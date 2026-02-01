import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
} from 'react-native';
import { useQuery } from '@tanstack/react-query';
import { RouteProp, useRoute } from '@react-navigation/native';
import Icon from 'react-native-vector-icons/Ionicons';
import { ingredientsApi } from '../lib/api';
import { RootStackParamList } from '../navigation/RootNavigator';
import { colors, typography, spacing, borderRadius, getScoreColor } from '../theme';

type RouteProps = RouteProp<RootStackParamList, 'IngredientDetail'>;

export default function IngredientDetailScreen() {
  const route = useRoute<RouteProps>();
  const { name } = route.params;

  const { data: ingredient, isLoading } = useQuery({
    queryKey: ['ingredient', name],
    queryFn: () => ingredientsApi.getIngredient(name),
  });

  if (isLoading) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator size="large" color={colors.primary} />
      </View>
    );
  }

  if (!ingredient) {
    return (
      <View style={styles.errorContainer}>
        <View style={styles.errorIconContainer}>
          <Icon name="alert-circle" size={40} color={colors.error} />
        </View>
        <Text style={styles.errorText}>Ingredient not found</Text>
      </View>
    );
  }

  const getLocalScoreColor = (score: number, inverse = false) => {
    const effectiveScore = inverse ? 100 - score : score;
    return getScoreColor(effectiveScore);
  };

  const getConfidenceColor = (confidence: string) => {
    switch (confidence) {
      case 'high':
        return colors.success;
      case 'medium':
        return colors.warning;
      default:
        return colors.error;
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
            { backgroundColor: getScoreColor(ingredient.overall_score) },
          ]}
        >
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
          color={getLocalScoreColor(ingredient.blood_sugar_impact)}
          description="Higher is better (less blood sugar spike)"
        />

        <ScoreBar
          label="Inflammation"
          value={ingredient.inflammation_potential}
          color={getLocalScoreColor(ingredient.inflammation_potential, true)}
          description="Lower is better (less inflammatory)"
          inverse
        />

        <ScoreBar
          label="Gut Health"
          value={ingredient.gut_impact}
          color={getLocalScoreColor(ingredient.gut_impact)}
          description="Higher is better (more gut-friendly)"
        />
      </View>

      {/* Hormonal Impact */}
      {ingredient.hormonal_relevance && (
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Hormonal Impact</Text>
          <View style={styles.hormonalCard}>
            <View style={styles.hormonalRow}>
              <Text style={styles.hormonalLabel}>Insulin Impact</Text>
              <Text style={styles.hormonalValue}>
                {ingredient.hormonal_relevance.insulin_impact}
              </Text>
            </View>
            <View style={styles.hormonalRow}>
              <Text style={styles.hormonalLabel}>Estrogen Impact</Text>
              <Text style={styles.hormonalValue}>
                {ingredient.hormonal_relevance.estrogen_impact}
              </Text>
            </View>
            <View style={[styles.hormonalRow, { borderBottomWidth: 0 }]}>
              <Text style={styles.hormonalLabel}>Cortisol Impact</Text>
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
            <Text style={styles.confidenceLabel}>Confidence Level</Text>
            <View
              style={[
                styles.confidenceBadge,
                {
                  backgroundColor: getConfidenceColor(
                    ingredient.evidence_confidence,
                  ),
                },
              ]}
            >
              <Text style={styles.confidenceText}>
                {ingredient.evidence_confidence}
              </Text>
            </View>
          </View>

          {ingredient.sources && ingredient.sources.length > 0 && (
            <View style={styles.sources}>
              <Text style={styles.sourcesTitle}>Sources</Text>
              {ingredient.sources.map((source, idx) => (
                <Text key={idx} style={styles.sourceItem}>
                  • {source.name}
                </Text>
              ))}
            </View>
          )}
        </View>
      </View>

      <View style={{ height: 40 }} />
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
        <Text style={[styles.scoreValue, { color }]}>{value}/100</Text>
      </View>
      <View style={styles.barContainer}>
        <View style={[styles.barFill, { width: `${value}%`, backgroundColor: color }]} />
      </View>
      <Text style={styles.scoreDescription}>{description}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.background,
  },
  errorContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.background,
  },
  errorIconContainer: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.errorLight,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.base,
  },
  errorText: {
    fontSize: typography.fontSize.base,
    color: colors.textSecondary,
  },
  header: {
    backgroundColor: colors.white,
    padding: spacing.xl,
    alignItems: 'center',
  },
  ingredientName: {
    fontSize: typography.fontSize['3xl'],
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
    textTransform: 'capitalize',
    marginBottom: spacing.base,
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
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
  },
  overallScoreLabel: {
    fontSize: typography.fontSize.xs,
    color: 'rgba(255,255,255,0.9)',
  },
  section: {
    backgroundColor: colors.white,
    marginTop: spacing.base,
    padding: spacing.lg,
  },
  sectionTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.base,
  },
  scoreBar: {
    marginBottom: spacing.lg,
  },
  scoreHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: spacing.sm,
  },
  scoreLabel: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
  },
  scoreValue: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
  },
  barContainer: {
    height: 8,
    backgroundColor: colors.border,
    borderRadius: borderRadius.sm,
    overflow: 'hidden',
  },
  barFill: {
    height: '100%',
    borderRadius: borderRadius.sm,
  },
  scoreDescription: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    marginTop: spacing.xs,
  },
  hormonalCard: {
    backgroundColor: colors.background,
    borderRadius: borderRadius.md,
    padding: spacing.base,
  },
  hormonalRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  hormonalLabel: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },
  hormonalValue: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    textTransform: 'capitalize',
  },
  hormonalDetails: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginTop: spacing.md,
    fontStyle: 'italic',
  },
  evidenceCard: {
    backgroundColor: colors.background,
    borderRadius: borderRadius.md,
    padding: spacing.base,
  },
  confidenceRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  confidenceLabel: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },
  confidenceBadge: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.xs,
    borderRadius: borderRadius.full,
  },
  confidenceText: {
    color: colors.white,
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.semiBold,
    textTransform: 'capitalize',
  },
  sources: {
    marginTop: spacing.base,
    paddingTop: spacing.base,
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
  },
  sourcesTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.sm,
  },
  sourceItem: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginBottom: spacing.xs,
  },
});
