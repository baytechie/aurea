import React, {useState} from 'react';
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
import {useMutation, useQueryClient} from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import Slider from '@react-native-community/slider';
import {logsApi} from '../lib/api';

const CYCLE_PHASES = ['menstruation', 'follicular', 'ovulation', 'luteal'];

const SYMPTOMS = [
  {key: 'energy', label: 'Energy', icon: 'flash'},
  {key: 'bloating', label: 'Bloating', icon: 'water'},
  {key: 'focus', label: 'Focus', icon: 'bulb'},
  {key: 'mood', label: 'Mood', icon: 'happy'},
  {key: 'sleep', label: 'Sleep', icon: 'moon'},
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
      queryClient.invalidateQueries({queryKey: ['logs']});
      Alert.alert('Success', 'Your daily log has been saved!');
      // Reset form
      setIngredients([]);
      setSymptoms({energy: 3, bloating: 0, focus: 3, mood: 3, sleep: 3});
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
            value={ingredientInput}
            onChangeText={setIngredientInput}
            onSubmitEditing={addIngredient}
            autoCapitalize="none"
          />
          <TouchableOpacity style={styles.addButton} onPress={addIngredient}>
            <Icon name="add" size={24} color="#fff" />
          </TouchableOpacity>
        </View>

        <View style={styles.tagsContainer}>
          {ingredients.map((ing, idx) => (
            <View key={idx} style={styles.tag}>
              <Text style={styles.tagText}>{ing}</Text>
              <TouchableOpacity onPress={() => removeIngredient(ing)}>
                <Icon name="close" size={16} color="#666" />
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
              <Icon name={symptom.icon} size={20} color="#2E7D32" />
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
                  setSymptoms({...symptoms, [symptom.key]: value})
                }
                minimumTrackTintColor="#2E7D32"
                maximumTrackTintColor="#ddd"
                thumbTintColor="#2E7D32"
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
              }>
              <Text
                style={[
                  styles.cycleText,
                  cyclePhase === phase && styles.cycleTextActive,
                ]}>
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
        disabled={mutation.isPending}>
        {mutation.isPending ? (
          <ActivityIndicator color="#fff" />
        ) : (
          <>
            <Icon name="checkmark-circle" size={24} color="#fff" />
            <Text style={styles.submitText}>Save Daily Log</Text>
          </>
        )}
      </TouchableOpacity>

      <View style={{height: 40}} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  section: {
    backgroundColor: '#fff',
    margin: 16,
    marginBottom: 0,
    borderRadius: 16,
    padding: 20,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#333',
    marginBottom: 16,
  },
  inputRow: {
    flexDirection: 'row',
    gap: 12,
  },
  input: {
    flex: 1,
    borderWidth: 1,
    borderColor: '#ddd',
    borderRadius: 12,
    paddingHorizontal: 16,
    paddingVertical: 12,
    fontSize: 16,
    backgroundColor: '#f9f9f9',
  },
  addButton: {
    backgroundColor: '#2E7D32',
    width: 48,
    height: 48,
    borderRadius: 12,
    alignItems: 'center',
    justifyContent: 'center',
  },
  tagsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
    marginTop: 12,
  },
  tag: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#E8F5E9',
    paddingHorizontal: 12,
    paddingVertical: 8,
    borderRadius: 20,
    gap: 8,
  },
  tagText: {
    fontSize: 14,
    color: '#2E7D32',
    textTransform: 'capitalize',
  },
  hint: {
    fontSize: 14,
    color: '#999',
    fontStyle: 'italic',
  },
  symptomRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  symptomLabel: {
    flexDirection: 'row',
    alignItems: 'center',
    width: 100,
    gap: 8,
  },
  symptomText: {
    fontSize: 14,
    color: '#333',
  },
  sliderContainer: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
  },
  sliderValue: {
    width: 24,
    fontSize: 16,
    fontWeight: '600',
    color: '#2E7D32',
    textAlign: 'center',
  },
  slider: {
    flex: 1,
    height: 40,
  },
  cycleContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
  },
  cycleButton: {
    paddingHorizontal: 16,
    paddingVertical: 10,
    borderRadius: 20,
    borderWidth: 1,
    borderColor: '#ddd',
    backgroundColor: '#f9f9f9',
  },
  cycleButtonActive: {
    backgroundColor: '#2E7D32',
    borderColor: '#2E7D32',
  },
  cycleText: {
    fontSize: 14,
    color: '#666',
    textTransform: 'capitalize',
  },
  cycleTextActive: {
    color: '#fff',
  },
  submitButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#2E7D32',
    margin: 16,
    paddingVertical: 16,
    borderRadius: 12,
    gap: 8,
  },
  submitDisabled: {
    opacity: 0.7,
  },
  submitText: {
    color: '#fff',
    fontSize: 18,
    fontWeight: '600',
  },
});
