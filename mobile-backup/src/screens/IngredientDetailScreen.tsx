import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
} from 'react-native';
import {useQuery} from '@tanstack/react-query';
import {RouteProp, useRoute} from '@react-navigation/native';
import Icon from 'react-native-vector-icons/Ionicons';
import {ingredientsApi} from '../lib/api';
import {RootStackParamList} from '../navigation/RootNavigator';

type RouteProps = RouteProp<RootStackParamList, 'IngredientDetail'>;

export default function IngredientDetailScreen() {
  const route = useRoute<RouteProps>();
  const {name} = route.params;

  const {data: ingredient, isLoading} = useQuery({
    queryKey: ['ingredient', name],
    queryFn: () => ingredientsApi.getIngredient(name),
  });

  if (isLoading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color="#2E7D32" />
      </View>
    );
  }

  if (!ingredient) {
    return (
      <View style={styles.errorContainer}>
        <Icon name="alert-circle" size={48} color="#EF5350" />
        <Text style={styles.errorText}>Ingredient not found</Text>
      </View>
    );
  }

  const getScoreColor = (score: number, inverse = false) => {
    const effectiveScore = inverse ? 100 - score : score;
    if (effectiveScore >= 70) return '#4CAF50';
    if (effectiveScore >= 40) return '#FFA726';
    return '#EF5350';
  };

  const getConfidenceColor = (confidence: string) => {
    switch (confidence) {
      case 'high':
        return '#4CAF50';
      case 'medium':
        return '#FFA726';
      default:
        return '#EF5350';
    }
  };

  return (
    <ScrollView style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        <Text style={styles.ingredientName}>{ingredient.name}</Text>
        <View
          style={[
            styles.overallScore,
            {backgroundColor: getScoreColor(ingredient.overall_score)},
          ]}>
          <Text style={styles.overallScoreValue}>
            {ingredient.overall_score}
          </Text>
          <Text style={styles.overallScoreLabel}>Overall Score</Text>
        </View>
      </View>

      {/* Score Breakdown */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Health Score Breakdown</Text>

        <ScoreBar
          label="Blood Sugar Impact"
          value={ingredient.blood_sugar_impact}
          color={getScoreColor(ingredient.blood_sugar_impact)}
          description="Higher is better (less blood sugar spike)"
        />

        <ScoreBar
          label="Inflammation"
          value={ingredient.inflammation_potential}
          color={getScoreColor(ingredient.inflammation_potential, true)}
          description="Lower is better (less inflammatory)"
          inverse
        />

        <ScoreBar
          label="Gut Health"
          value={ingredient.gut_impact}
          color={getScoreColor(ingredient.gut_impact)}
          description="Higher is better (more gut-friendly)"
        />
      </View>

      {/* Hormonal Impact */}
      {ingredient.hormonal_relevance && (
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Hormonal Impact</Text>
          <View style={styles.hormonalCard}>
            <View style={styles.hormonalRow}>
              <Text style={styles.hormonalLabel}>Insulin Impact:</Text>
              <Text style={styles.hormonalValue}>
                {ingredient.hormonal_relevance.insulin_impact}
              </Text>
            </View>
            <View style={styles.hormonalRow}>
              <Text style={styles.hormonalLabel}>Estrogen Impact:</Text>
              <Text style={styles.hormonalValue}>
                {ingredient.hormonal_relevance.estrogen_impact}
              </Text>
            </View>
            <View style={styles.hormonalRow}>
              <Text style={styles.hormonalLabel}>Cortisol Impact:</Text>
              <Text style={styles.hormonalValue}>
                {ingredient.hormonal_relevance.cortisol_impact}
              </Text>
            </View>
            {ingredient.hormonal_relevance.details && (
              <Text style={styles.hormonalDetails}>
                {ingredient.hormonal_relevance.details}
              </Text>
            )}
          </View>
        </View>
      )}

      {/* Evidence */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Evidence</Text>
        <View style={styles.evidenceCard}>
          <View style={styles.confidenceRow}>
            <Text style={styles.confidenceLabel}>Confidence Level:</Text>
            <View
              style={[
                styles.confidenceBadge,
                {
                  backgroundColor: getConfidenceColor(
                    ingredient.evidence_confidence,
                  ),
                },
              ]}>
              <Text style={styles.confidenceText}>
                {ingredient.evidence_confidence}
              </Text>
            </View>
          </View>

          {ingredient.sources && ingredient.sources.length > 0 && (
            <View style={styles.sources}>
              <Text style={styles.sourcesTitle}>Sources:</Text>
              {ingredient.sources.map((source, idx) => (
                <Text key={idx} style={styles.sourceItem}>
                  • {source.name}
                </Text>
              ))}
            </View>
          )}
        </View>
      </View>

      <View style={{height: 40}} />
    </ScrollView>
  );
}

function ScoreBar({
  label,
  value,
  color,
  description,
  inverse,
}: {
  label: string;
  value: number;
  color: string;
  description: string;
  inverse?: boolean;
}) {
  return (
    <View style={styles.scoreBar}>
      <View style={styles.scoreHeader}>
        <Text style={styles.scoreLabel}>{label}</Text>
        <Text style={[styles.scoreValue, {color}]}>{value}/100</Text>
      </View>
      <View style={styles.barContainer}>
        <View style={[styles.barFill, {width: `${value}%`, backgroundColor: color}]} />
      </View>
      <Text style={styles.scoreDescription}>{description}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  errorText: {
    fontSize: 16,
    color: '#666',
    marginTop: 12,
  },
  header: {
    backgroundColor: '#fff',
    padding: 24,
    alignItems: 'center',
  },
  ingredientName: {
    fontSize: 28,
    fontWeight: '700',
    color: '#333',
    textTransform: 'capitalize',
    marginBottom: 16,
  },
  overallScore: {
    width: 100,
    height: 100,
    borderRadius: 50,
    alignItems: 'center',
    justifyContent: 'center',
  },
  overallScoreValue: {
    fontSize: 32,
    fontWeight: '700',
    color: '#fff',
  },
  overallScoreLabel: {
    fontSize: 10,
    color: 'rgba(255,255,255,0.9)',
  },
  section: {
    backgroundColor: '#fff',
    marginTop: 16,
    padding: 20,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#333',
    marginBottom: 16,
  },
  scoreBar: {
    marginBottom: 20,
  },
  scoreHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 8,
  },
  scoreLabel: {
    fontSize: 14,
    fontWeight: '500',
    color: '#333',
  },
  scoreValue: {
    fontSize: 14,
    fontWeight: '700',
  },
  barContainer: {
    height: 8,
    backgroundColor: '#E0E0E0',
    borderRadius: 4,
    overflow: 'hidden',
  },
  barFill: {
    height: '100%',
    borderRadius: 4,
  },
  scoreDescription: {
    fontSize: 12,
    color: '#999',
    marginTop: 4,
  },
  hormonalCard: {
    backgroundColor: '#f9f9f9',
    borderRadius: 12,
    padding: 16,
  },
  hormonalRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: 8,
    borderBottomWidth: 1,
    borderBottomColor: '#eee',
  },
  hormonalLabel: {
    fontSize: 14,
    color: '#666',
  },
  hormonalValue: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
    textTransform: 'capitalize',
  },
  hormonalDetails: {
    fontSize: 13,
    color: '#666',
    marginTop: 12,
    fontStyle: 'italic',
  },
  evidenceCard: {
    backgroundColor: '#f9f9f9',
    borderRadius: 12,
    padding: 16,
  },
  confidenceRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  confidenceLabel: {
    fontSize: 14,
    color: '#666',
  },
  confidenceBadge: {
    paddingHorizontal: 12,
    paddingVertical: 4,
    borderRadius: 12,
  },
  confidenceText: {
    color: '#fff',
    fontSize: 12,
    fontWeight: '600',
    textTransform: 'capitalize',
  },
  sources: {
    marginTop: 16,
    paddingTop: 16,
    borderTopWidth: 1,
    borderTopColor: '#eee',
  },
  sourcesTitle: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
    marginBottom: 8,
  },
  sourceItem: {
    fontSize: 13,
    color: '#666',
    marginBottom: 4,
  },
});
