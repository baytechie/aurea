import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TextInput,
  TouchableOpacity,
  Alert,
  ActivityIndicator,
} from 'react-native';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import Slider from '@react-native-community/slider';
import { logsApi } from '../lib/api';
import { colors, typography, spacing, borderRadius } from '../theme';

const CYCLE_PHASES = ['menstruation', 'follicular', 'ovulation', 'luteal'];

const SYMPTOMS = [
  { key: 'energy', label: 'Energy', icon: 'flash' },
  { key: 'bloating', label: 'Bloating', icon: 'water' },
  { key: 'focus', label: 'Focus', icon: 'bulb' },
  { key: 'mood', label: 'Mood', icon: 'happy' },
  { key: 'sleep', label: 'Sleep', icon: 'moon' },
];

export default function LogScreen() {
  const [ingredients, setIngredients] = useState<string[]>([]);
  const [ingredientInput, setIngredientInput] = useState('');
  const [symptoms, setSymptoms] = useState<Record<string, number>>({
    energy: 3,
    bloating: 0,
    focus: 3,
    mood: 3,
    sleep: 3,
  });
  const [cyclePhase, setCyclePhase] = useState<string | undefined>();

  const queryClient = useQueryClient();

  const mutation = useMutation({
    mutationFn: logsApi.createLog,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['logs'] });
      Alert.alert('Success', 'Your daily log has been saved!');
      setIngredients([]);
      setSymptoms({ energy: 3, bloating: 0, focus: 3, mood: 3, sleep: 3 });
      setCyclePhase(undefined);
    },
    onError: (error: any) => {
      Alert.alert('Error', error.message || 'Failed to save log');
    },
  });

  const addIngredient = () => {
    const trimmed = ingredientInput.trim().toLowerCase();
    if (trimmed && !ingredients.includes(trimmed)) {
      setIngredients([...ingredients, trimmed]);
      setIngredientInput('');
    }
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

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      {/* Ingredients Section */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>What did you eat today?</Text>

        <View style={styles.inputRow}>
          <TextInput
            style={styles.input}
            placeholder="Add ingredient..."
            placeholderTextColor={colors.textTertiary}
            value={ingredientInput}
            onChangeText={setIngredientInput}
            onSubmitEditing={addIngredient}
            autoCapitalize="none"
          />
          <TouchableOpacity style={styles.addButton} onPress={addIngredient}>
            <Icon name="add" size={24} color={colors.white} />
          </TouchableOpacity>
        </View>

        <View style={styles.tagsContainer}>
          {ingredients.map((ing, idx) => (
            <View key={idx} style={styles.tag}>
              <Text style={styles.tagText}>{ing}</Text>
              <TouchableOpacity onPress={() => removeIngredient(ing)}>
                <Icon name="close" size={16} color={colors.primary} />
              </TouchableOpacity>
            </View>
          ))}
          {ingredients.length === 0 && (
            <Text style={styles.hint}>
              Type ingredient names and press enter to add
            </Text>
          )}
        </View>
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
  input: {
    flex: 1,
    borderWidth: 1,
    borderColor: colors.border,
    borderRadius: borderRadius.md,
    paddingHorizontal: spacing.base,
    paddingVertical: spacing.md,
    fontSize: typography.fontSize.base,
    backgroundColor: colors.background,
    color: colors.textPrimary,
  },
  addButton: {
    backgroundColor: colors.primary,
    width: 48,
    height: 48,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
  },
  tagsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
    marginTop: spacing.md,
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
  hint: {
    fontSize: typography.fontSize.sm,
    color: colors.textTertiary,
    fontStyle: 'italic',
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
