import React, { useState, useEffect, useRef, useMemo } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TextInput,
  TouchableOpacity,
  Alert,
  ActivityIndicator,
  Keyboard,
} from 'react-native';
import { useMutation, useQueryClient, useQuery } from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import Slider from '@react-native-community/slider';
import AsyncStorage from '@react-native-async-storage/async-storage';
import debounce from 'lodash/debounce';
import { logsApi, ingredientsApi } from '../lib/api';
import { colors, typography, spacing, borderRadius, shadows } from '../theme';

const CYCLE_PHASES = ['menstruation', 'follicular', 'ovulation', 'luteal'];

const SYMPTOMS = [
  { key: 'energy', label: 'Energy', icon: 'flash' },
  { key: 'bloating', label: 'Bloating', icon: 'water' },
  { key: 'focus', label: 'Focus', icon: 'bulb' },
  { key: 'mood', label: 'Mood', icon: 'happy' },
  { key: 'sleep', label: 'Sleep', icon: 'moon' },
];

// Common foods for quick suggestions when input is empty
const QUICK_ADD_FOODS = [
  'Eggs', 'Oatmeal', 'Banana', 'Chicken', 'Rice',
  'Salad', 'Coffee', 'Yogurt', 'Avocado', 'Bread',
];

const HISTORY_STORAGE_KEY = '@aurea_food_history';
const MAX_HISTORY_ITEMS = 20;

export default function LogScreen() {
  const [ingredients, setIngredients] = useState<string[]>([]);
  const [ingredientInput, setIngredientInput] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  const [recentFoods, setRecentFoods] = useState<string[]>([]);
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [symptoms, setSymptoms] = useState<Record<string, number>>({
    energy: 3,
    bloating: 0,
    focus: 3,
    mood: 3,
    sleep: 3,
  });
  const [cyclePhase, setCyclePhase] = useState<string | undefined>();

  const queryClient = useQueryClient();

  // Load food history on mount
  useEffect(() => {
    loadFoodHistory();
  }, []);

  const loadFoodHistory = async () => {
    try {
      const history = await AsyncStorage.getItem(HISTORY_STORAGE_KEY);
      if (history) {
        setRecentFoods(JSON.parse(history));
      }
    } catch (error) {
      console.log('Error loading food history:', error);
    }
  };

  const saveFoodHistory = async (newFoods: string[]) => {
    try {
      // Merge with existing and dedupe, keeping most recent first
      const existingHistory = [...recentFoods];
      const updatedHistory = [...new Set([...newFoods, ...existingHistory])]
        .slice(0, MAX_HISTORY_ITEMS);
      await AsyncStorage.setItem(HISTORY_STORAGE_KEY, JSON.stringify(updatedHistory));
      setRecentFoods(updatedHistory);
    } catch (error) {
      console.log('Error saving food history:', error);
    }
  };

  // Search for ingredient suggestions
  const { data: searchResults, isLoading: isSearching } = useQuery({
    queryKey: ['ingredientSearch', searchTerm],
    queryFn: () => ingredientsApi.search(searchTerm),
    enabled: searchTerm.length >= 2,
  });

  // Create debounced search function with useRef to avoid hook issues
  const debouncedSearchRef = useRef(
    debounce((text: string) => {
      setSearchTerm(text);
    }, 300)
  );

  // Cleanup debounce on unmount
  useEffect(() => {
    const debouncedFn = debouncedSearchRef.current;
    return () => {
      debouncedFn.cancel();
    };
  }, []);

  const handleInputChange = (text: string) => {
    setIngredientInput(text);
    setShowSuggestions(true);
    debouncedSearchRef.current(text);
  };

  const mutation = useMutation({
    mutationFn: logsApi.createLog,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['logs'] });
      Alert.alert('Success', 'Your daily log has been saved!');
      // Save foods to history before clearing
      saveFoodHistory(ingredients);
      setIngredients([]);
      setSymptoms({ energy: 3, bloating: 0, focus: 3, mood: 3, sleep: 3 });
      setCyclePhase(undefined);
    },
    onError: (error: any) => {
      Alert.alert('Error', error.message || 'Failed to save log');
    },
  });

  const addIngredient = (name?: string) => {
    const toAdd = name || ingredientInput.trim();
    const normalized = toAdd.toLowerCase();
    if (normalized && !ingredients.includes(normalized)) {
      setIngredients([...ingredients, normalized]);
    }
    setIngredientInput('');
    setSearchTerm('');
    setShowSuggestions(false);
    Keyboard.dismiss();
  };

  const removeIngredient = (ing: string) => {
    setIngredients(ingredients.filter(i => i !== ing));
  };

  const handleSubmit = () => {
    if (ingredients.length === 0) {
      Alert.alert('Error', 'Please add at least one ingredient');
      return;
    }

    mutation.mutate({
      ingredients,
      symptoms,
      cycle_phase: cyclePhase,
    });
  };

  // Filter suggestions to not show already added items
  const filteredSuggestions = (searchResults || [])
    .filter((item: any) => !ingredients.includes(item.name.toLowerCase()))
    .slice(0, 6);

  // Get recent foods not already added
  const availableRecentFoods = recentFoods
    .filter(food => !ingredients.includes(food.toLowerCase()))
    .slice(0, 8);

  // Get quick add foods not already added
  const availableQuickFoods = QUICK_ADD_FOODS
    .filter(food => !ingredients.includes(food.toLowerCase()))
    .slice(0, 10);

  // Match input to available foods for inline suggestions
  const matchingFoods = ingredientInput.length >= 1
    ? [...recentFoods, ...QUICK_ADD_FOODS]
        .filter(food =>
          food.toLowerCase().startsWith(ingredientInput.toLowerCase()) &&
          !ingredients.includes(food.toLowerCase())
        )
        .slice(0, 5)
    : [];

  return (
    <ScrollView
      style={styles.container}
      showsVerticalScrollIndicator={false}
      keyboardShouldPersistTaps="handled"
    >
      {/* Ingredients Section */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>What did you eat today?</Text>

        {/* Input Row */}
        <View style={styles.inputRow}>
          <View style={styles.inputContainer}>
            <Icon name="search" size={18} color={colors.textTertiary} style={styles.inputIcon} />
            <TextInput
              style={styles.input}
              placeholder="Search or type food..."
              placeholderTextColor={colors.textTertiary}
              value={ingredientInput}
              onChangeText={handleInputChange}
              onSubmitEditing={() => addIngredient()}
              onFocus={() => setShowSuggestions(true)}
              autoCapitalize="none"
              returnKeyType="done"
            />
            {ingredientInput.length > 0 && (
              <TouchableOpacity
                onPress={() => {
                  setIngredientInput('');
                  setSearchTerm('');
                }}
                style={styles.clearInput}
              >
                <Icon name="close-circle" size={18} color={colors.textTertiary} />
              </TouchableOpacity>
            )}
          </View>
          <TouchableOpacity
            style={[
              styles.addButton,
              !ingredientInput.trim() && styles.addButtonDisabled
            ]}
            onPress={() => addIngredient()}
            disabled={!ingredientInput.trim()}
          >
            <Icon name="add" size={24} color={colors.white} />
          </TouchableOpacity>
        </View>

        {/* Live Suggestions Dropdown */}
        {showSuggestions && ingredientInput.length >= 2 && (
          <View style={styles.suggestionsDropdown}>
            {isSearching ? (
              <View style={styles.searchingContainer}>
                <ActivityIndicator size="small" color={colors.primary} />
                <Text style={styles.searchingText}>Searching...</Text>
              </View>
            ) : filteredSuggestions.length > 0 ? (
              <>
                <Text style={styles.suggestionsHeader}>Suggestions</Text>
                {filteredSuggestions.map((item: any, idx: number) => (
                  <TouchableOpacity
                    key={`${item.name}-${idx}`}
                    style={styles.suggestionItem}
                    onPress={() => addIngredient(item.name)}
                  >
                    <Icon name="leaf-outline" size={16} color={colors.primary} />
                    <Text style={styles.suggestionText}>{item.name}</Text>
                    <Icon name="add-circle-outline" size={20} color={colors.primary} />
                  </TouchableOpacity>
                ))}
              </>
            ) : matchingFoods.length > 0 ? (
              <>
                <Text style={styles.suggestionsHeader}>Quick Add</Text>
                {matchingFoods.map((food, idx) => (
                  <TouchableOpacity
                    key={`match-${food}-${idx}`}
                    style={styles.suggestionItem}
                    onPress={() => addIngredient(food)}
                  >
                    <Icon name="time-outline" size={16} color={colors.textTertiary} />
                    <Text style={styles.suggestionText}>{food}</Text>
                    <Icon name="add-circle-outline" size={20} color={colors.primary} />
                  </TouchableOpacity>
                ))}
              </>
            ) : (
              <TouchableOpacity
                style={styles.suggestionItem}
                onPress={() => addIngredient()}
              >
                <Icon name="add-outline" size={16} color={colors.primary} />
                <Text style={styles.suggestionText}>Add "{ingredientInput}"</Text>
                <Icon name="arrow-forward" size={20} color={colors.primary} />
              </TouchableOpacity>
            )}
          </View>
        )}

        {/* Selected Ingredients */}
        {ingredients.length > 0 && (
          <View style={styles.selectedContainer}>
            <Text style={styles.selectedLabel}>
              <Icon name="checkmark-circle" size={14} color={colors.success} /> Added ({ingredients.length})
            </Text>
            <View style={styles.tagsContainer}>
              {ingredients.map((ing, idx) => (
                <View key={idx} style={styles.tag}>
                  <Text style={styles.tagText}>{ing}</Text>
                  <TouchableOpacity
                    onPress={() => removeIngredient(ing)}
                    hitSlop={{ top: 8, bottom: 8, left: 8, right: 8 }}
                  >
                    <Icon name="close" size={16} color={colors.primary} />
                  </TouchableOpacity>
                </View>
              ))}
            </View>
          </View>
        )}

        {/* Recent Foods */}
        {availableRecentFoods.length > 0 && !showSuggestions && (
          <View style={styles.quickSection}>
            <View style={styles.quickHeader}>
              <Icon name="time-outline" size={16} color={colors.textSecondary} />
              <Text style={styles.quickTitle}>Recent</Text>
            </View>
            <View style={styles.quickChips}>
              {availableRecentFoods.map((food, idx) => (
                <TouchableOpacity
                  key={`recent-${food}-${idx}`}
                  style={styles.quickChip}
                  onPress={() => addIngredient(food)}
                >
                  <Text style={styles.quickChipText}>{food}</Text>
                  <Icon name="add" size={14} color={colors.primary} />
                </TouchableOpacity>
              ))}
            </View>
          </View>
        )}

        {/* Quick Add Common Foods */}
        {ingredients.length === 0 && availableRecentFoods.length === 0 && !showSuggestions && (
          <View style={styles.quickSection}>
            <View style={styles.quickHeader}>
              <Icon name="flash-outline" size={16} color={colors.textSecondary} />
              <Text style={styles.quickTitle}>Quick Add</Text>
            </View>
            <View style={styles.quickChips}>
              {availableQuickFoods.map((food, idx) => (
                <TouchableOpacity
                  key={`quick-${food}-${idx}`}
                  style={styles.quickChip}
                  onPress={() => addIngredient(food)}
                >
                  <Text style={styles.quickChipText}>{food}</Text>
                  <Icon name="add" size={14} color={colors.primary} />
                </TouchableOpacity>
              ))}
            </View>
          </View>
        )}

        {/* Common Foods Grid when user has added some but looking for more */}
        {ingredients.length > 0 && availableQuickFoods.length > 0 && !showSuggestions && (
          <View style={styles.quickSection}>
            <View style={styles.quickHeader}>
              <Icon name="add-circle-outline" size={16} color={colors.textSecondary} />
              <Text style={styles.quickTitle}>Add More</Text>
            </View>
            <View style={styles.quickChips}>
              {availableQuickFoods.slice(0, 6).map((food, idx) => (
                <TouchableOpacity
                  key={`more-${food}-${idx}`}
                  style={styles.quickChipOutline}
                  onPress={() => addIngredient(food)}
                >
                  <Text style={styles.quickChipOutlineText}>{food}</Text>
                  <Icon name="add" size={14} color={colors.textSecondary} />
                </TouchableOpacity>
              ))}
            </View>
          </View>
        )}

        {/* Empty State Hint */}
        {ingredients.length === 0 && !showSuggestions && availableRecentFoods.length === 0 && (
          <Text style={styles.hint}>
            Tap items above or search to add what you ate
          </Text>
        )}
      </View>

      {/* Symptoms Section */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>How are you feeling?</Text>

        {SYMPTOMS.map(symptom => (
          <View key={symptom.key} style={styles.symptomRow}>
            <View style={styles.symptomLabel}>
              <Icon name={symptom.icon} size={20} color={colors.primary} />
              <Text style={styles.symptomText}>{symptom.label}</Text>
            </View>
            <View style={styles.sliderContainer}>
              <Text style={styles.sliderValue}>
                {symptoms[symptom.key]}
              </Text>
              <Slider
                style={styles.slider}
                minimumValue={0}
                maximumValue={5}
                step={1}
                value={symptoms[symptom.key]}
                onValueChange={value =>
                  setSymptoms({ ...symptoms, [symptom.key]: value })
                }
                minimumTrackTintColor={colors.primary}
                maximumTrackTintColor={colors.border}
                thumbTintColor={colors.primary}
              />
            </View>
          </View>
        ))}
      </View>

      {/* Cycle Phase Section */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Cycle Phase (Optional)</Text>
        <View style={styles.cycleContainer}>
          {CYCLE_PHASES.map(phase => (
            <TouchableOpacity
              key={phase}
              style={[
                styles.cycleButton,
                cyclePhase === phase && styles.cycleButtonActive,
              ]}
              onPress={() =>
                setCyclePhase(cyclePhase === phase ? undefined : phase)
              }
            >
              <Text
                style={[
                  styles.cycleText,
                  cyclePhase === phase && styles.cycleTextActive,
                ]}
              >
                {phase}
              </Text>
            </TouchableOpacity>
          ))}
        </View>
      </View>

      {/* Submit Button */}
      <TouchableOpacity
        style={[styles.submitButton, mutation.isPending && styles.submitDisabled]}
        onPress={handleSubmit}
        disabled={mutation.isPending}
      >
        {mutation.isPending ? (
          <ActivityIndicator color={colors.white} />
        ) : (
          <>
            <Icon name="checkmark-circle" size={24} color={colors.white} />
            <Text style={styles.submitText}>Save Daily Log</Text>
          </>
        )}
      </TouchableOpacity>

      <View style={{ height: 40 }} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  section: {
    backgroundColor: colors.white,
    margin: spacing.base,
    marginBottom: 0,
    borderRadius: borderRadius.lg,
    padding: spacing.lg,
  },
  sectionTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.base,
  },
  inputRow: {
    flexDirection: 'row',
    gap: spacing.md,
  },
  inputContainer: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    borderWidth: 1,
    borderColor: colors.border,
    borderRadius: borderRadius.md,
    backgroundColor: colors.background,
    paddingHorizontal: spacing.md,
  },
  inputIcon: {
    marginRight: spacing.sm,
  },
  input: {
    flex: 1,
    paddingVertical: spacing.md,
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
  },
  clearInput: {
    padding: spacing.xs,
  },
  addButton: {
    backgroundColor: colors.primary,
    width: 48,
    height: 48,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
  },
  addButtonDisabled: {
    backgroundColor: colors.border,
  },

  // Suggestions Dropdown
  suggestionsDropdown: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.md,
    marginTop: spacing.sm,
    borderWidth: 1,
    borderColor: colors.border,
    ...shadows.sm,
  },
  suggestionsHeader: {
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textTertiary,
    paddingHorizontal: spacing.md,
    paddingTop: spacing.md,
    paddingBottom: spacing.xs,
    textTransform: 'uppercase',
    letterSpacing: 0.5,
  },
  suggestionItem: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: spacing.md,
    paddingHorizontal: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
    gap: spacing.md,
  },
  suggestionText: {
    flex: 1,
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
    textTransform: 'capitalize',
  },
  searchingContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    padding: spacing.lg,
    gap: spacing.sm,
  },
  searchingText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },

  // Selected Tags
  selectedContainer: {
    marginTop: spacing.lg,
  },
  selectedLabel: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.medium,
    color: colors.success,
    marginBottom: spacing.sm,
  },
  tagsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  tag: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.primaryBackground,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.full,
    gap: spacing.sm,
  },
  tagText: {
    fontSize: typography.fontSize.sm,
    color: colors.primary,
    textTransform: 'capitalize',
    fontWeight: typography.fontWeight.medium,
  },

  // Quick Add Sections
  quickSection: {
    marginTop: spacing.lg,
  },
  quickHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.xs,
    marginBottom: spacing.sm,
  },
  quickTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.medium,
    color: colors.textSecondary,
  },
  quickChips: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  quickChip: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.primaryBackground,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.full,
    gap: spacing.xs,
  },
  quickChipText: {
    fontSize: typography.fontSize.sm,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
  },
  quickChipOutline: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.full,
    borderWidth: 1,
    borderColor: colors.border,
    gap: spacing.xs,
  },
  quickChipOutlineText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },

  hint: {
    fontSize: typography.fontSize.sm,
    color: colors.textTertiary,
    fontStyle: 'italic',
    marginTop: spacing.md,
    textAlign: 'center',
  },
  symptomRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.base,
  },
  symptomLabel: {
    flexDirection: 'row',
    alignItems: 'center',
    width: 100,
    gap: spacing.sm,
  },
  symptomText: {
    fontSize: typography.fontSize.sm,
    color: colors.textPrimary,
  },
  sliderContainer: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
  },
  sliderValue: {
    width: 24,
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.primary,
    textAlign: 'center',
  },
  slider: {
    flex: 1,
    height: 40,
  },
  cycleContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  cycleButton: {
    paddingHorizontal: spacing.base,
    paddingVertical: spacing.md,
    borderRadius: borderRadius.full,
    borderWidth: 1,
    borderColor: colors.border,
    backgroundColor: colors.background,
  },
  cycleButtonActive: {
    backgroundColor: colors.primary,
    borderColor: colors.primary,
  },
  cycleText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    textTransform: 'capitalize',
  },
  cycleTextActive: {
    color: colors.white,
    fontWeight: typography.fontWeight.medium,
  },
  submitButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.primary,
    margin: spacing.base,
    paddingVertical: spacing.base,
    borderRadius: borderRadius.md,
    gap: spacing.sm,
  },
  submitDisabled: {
    opacity: 0.7,
  },
  submitText: {
    color: colors.white,
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
  },
});
