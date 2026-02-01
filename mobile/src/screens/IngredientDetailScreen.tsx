import React, {useState} from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
  TouchableOpacity,
  Linking,
} from 'react-native';
import {useQuery} from '@tanstack/react-query';
import {RouteProp, useRoute} from '@react-navigation/native';
import Icon from 'react-native-vector-icons/Ionicons';
import {ingredientsApi, HealthScoreDetail} from '../lib/api';
import {HomeStackParamList} from '../navigation/RootNavigator';
import {
  colors,
  typography,
  spacing,
  borderRadius,
  getScoreColor,
  getConfidenceColor,
  getCategoryColor,
} from '../theme';

type RouteProps = RouteProp<HomeStackParamList, 'IngredientDetail'>;

export default function IngredientDetailScreen() {
  const route = useRoute<RouteProps>();
  const {name} = route.params;

  // Track expanded sections
  const [expandedSections, setExpandedSections] = useState<
    Record<string, boolean>
  >({});

  const {data: ingredient, isLoading} = useQuery({
    queryKey: ['ingredient', name],
    queryFn: () => ingredientsApi.getIngredient(name),
  });

  const toggleSection = (section: string) => {
    setExpandedSections(prev => ({
      ...prev,
      [section]: !prev[section],
    }));
  };

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

  // Helper to get score detail from nested health_scores or direct *_details fields
  const getScoreDetail = (
    key: 'blood_sugar' | 'inflammation' | 'gut_impact' | 'disease_links'
  ): HealthScoreDetail | undefined => {
    // Try nested health_scores first
    if (ingredient.health_scores?.[key]) {
      return ingredient.health_scores[key];
    }
    // Fallback to direct *_details fields
    const detailsKey = `${key}_details` as keyof typeof ingredient;
    return ingredient[detailsKey] as HealthScoreDetail | undefined;
  };

  const getLocalScoreColor = (score: number, inverse = false) => {
    const effectiveScore = inverse ? 100 - score : score;
    return getScoreColor(effectiveScore);
  };

  // For inflammation: higher score = less inflammatory = better
  // No inversion needed - database stores scores consistently (higher = better)
  const getInflammationDisplayScore = () => {
    const detail = getScoreDetail('inflammation');
    if (detail?.score !== undefined) {
      return detail.score;
    }
    return ingredient.inflammation_potential || 0;
  };

  const isTrusted = ingredient.is_trusted === 1;
  const category = ingredient.category || 'Food';
  const categoryColors = getCategoryColor(category);

  const handleSourcePress = (url?: string) => {
    if (url) {
      Linking.openURL(url).catch(() => {
        // Silently fail if URL cannot be opened
      });
    }
  };

  return (
    <ScrollView style={styles.container}>
      {/* Header */}
      <View style={styles.header}>
        {/* Category Badge */}
        <View
          style={[
            styles.categoryBadge,
            {backgroundColor: categoryColors.backgroundColor},
          ]}>
          <Text style={[styles.categoryBadgeText, {color: categoryColors.textColor}]}>
            {category.replace(/_/g, ' ')}
          </Text>
        </View>

        <Text style={styles.ingredientName}>{ingredient.name}</Text>

        {/* Trust Indicator */}
        <View style={styles.trustIndicator}>
          <Icon
            name={isTrusted ? 'checkmark-circle' : 'alert-circle-outline'}
            size={16}
            color={isTrusted ? colors.success : colors.warning}
          />
          <Text
            style={[
              styles.trustText,
              {color: isTrusted ? colors.success : colors.warning},
            ]}>
            {isTrusted ? 'Researched' : 'Public Source'}
          </Text>
        </View>

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

        <ExpandableScoreBar
          label="Blood Sugar Impact"
          value={ingredient.blood_sugar_impact}
          color={getLocalScoreColor(ingredient.blood_sugar_impact)}
          description="Higher is better (less blood sugar spike)"
          detail={getScoreDetail('blood_sugar')}
          isExpanded={expandedSections.blood_sugar}
          onToggle={() => toggleSection('blood_sugar')}
        />

        <ExpandableScoreBar
          label="Anti-inflammatory"
          value={getInflammationDisplayScore()}
          color={getLocalScoreColor(getInflammationDisplayScore())}
          description="Higher is better (less inflammatory)"
          detail={getScoreDetail('inflammation')}
          isExpanded={expandedSections.inflammation}
          onToggle={() => toggleSection('inflammation')}
          displayLabel="Anti-inflammatory Score"
        />

        <ExpandableScoreBar
          label="Gut Health"
          value={ingredient.gut_impact}
          color={getLocalScoreColor(ingredient.gut_impact)}
          description="Higher is better (more gut-friendly)"
          detail={getScoreDetail('gut_impact')}
          isExpanded={expandedSections.gut_impact}
          onToggle={() => toggleSection('gut_impact')}
        />

        {/* Disease Links Score - new category */}
        {(ingredient.disease_links !== undefined ||
          getScoreDetail('disease_links')) && (
          <ExpandableScoreBar
            label="Disease Prevention"
            value={ingredient.disease_links ?? getScoreDetail('disease_links')?.score ?? 0}
            color={getLocalScoreColor(
              ingredient.disease_links ?? getScoreDetail('disease_links')?.score ?? 0
            )}
            description="Higher is better (fewer disease associations)"
            detail={getScoreDetail('disease_links')}
            isExpanded={expandedSections.disease_links}
            onToggle={() => toggleSection('disease_links')}
          />
        )}
      </View>

      {/* Hormonal Impact */}
      {ingredient.hormonal_relevance && (
        <View style={styles.section}>
          <TouchableOpacity
            style={styles.sectionHeaderTouchable}
            onPress={() => toggleSection('hormonal')}
            accessibilityLabel="Toggle hormonal impact details">
            <Text style={styles.sectionTitle}>Hormonal Impact</Text>
            {ingredient.hormonal_relevance.confidence_level && (
              <View
                style={[
                  styles.confidenceBadgeSmall,
                  {
                    backgroundColor: getConfidenceColor(
                      ingredient.hormonal_relevance.confidence_level
                    ),
                  },
                ]}>
                <Text style={styles.confidenceBadgeSmallText}>
                  {ingredient.hormonal_relevance.confidence_level}
                </Text>
              </View>
            )}
            <Icon
              name={expandedSections.hormonal ? 'chevron-up' : 'chevron-down'}
              size={20}
              color={colors.textSecondary}
            />
          </TouchableOpacity>
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
            <View style={[styles.hormonalRow, {borderBottomWidth: 0}]}>
              <Text style={styles.hormonalLabel}>Cortisol Impact</Text>
              <Text style={styles.hormonalValue}>
                {ingredient.hormonal_relevance.cortisol_impact}
              </Text>
            </View>
            {/* Expanded details */}
            {expandedSections.hormonal && (
              <>
                {(ingredient.hormonal_relevance.description ||
                  ingredient.hormonal_relevance.details) && (
                  <View style={styles.expandedDetails}>
                    <Text style={styles.expandedDetailsText}>
                      {ingredient.hormonal_relevance.description ||
                        ingredient.hormonal_relevance.details}
                    </Text>
                  </View>
                )}
              </>
            )}
            {!expandedSections.hormonal &&
              (ingredient.hormonal_relevance.details ||
                ingredient.hormonal_relevance.description) && (
                <Text style={styles.hormonalDetails} numberOfLines={2}>
                  {ingredient.hormonal_relevance.description ||
                    ingredient.hormonal_relevance.details}
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
                    ingredient.evidence_confidence === 'high'
                      ? 'High'
                      : ingredient.evidence_confidence === 'medium'
                      ? 'Medium'
                      : 'Low'
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
              <Text style={styles.sourcesTitle}>Sources</Text>
              {ingredient.sources.map((source, idx) => (
                <TouchableOpacity
                  key={idx}
                  style={styles.sourceItemContainer}
                  onPress={() => handleSourcePress(source.url)}
                  disabled={!source.url}
                  accessibilityLabel={`Source: ${source.name}${
                    source.url ? ', tap to open' : ''
                  }`}>
                  <Icon
                    name={source.url ? 'link-outline' : 'document-text-outline'}
                    size={14}
                    color={source.url ? colors.primary : colors.textTertiary}
                  />
                  <Text
                    style={[
                      styles.sourceItem,
                      source.url && styles.sourceItemLink,
                    ]}>
                    {source.name}
                  </Text>
                  {source.url && (
                    <Icon
                      name="open-outline"
                      size={12}
                      color={colors.primary}
                    />
                  )}
                </TouchableOpacity>
              ))}
            </View>
          )}
        </View>
      </View>

      <View style={{height: 40}} />
    </ScrollView>
  );
}

function ExpandableScoreBar({
  label,
  value,
  color,
  description,
  detail,
  isExpanded,
  onToggle,
  displayLabel,
}: {
  label: string;
  value: number;
  color: string;
  description: string;
  detail?: HealthScoreDetail;
  isExpanded?: boolean;
  onToggle?: () => void;
  displayLabel?: string;
}) {
  const hasDetail = detail?.description || detail?.confidence_level;

  return (
    <View style={styles.scoreBar}>
      <TouchableOpacity
        style={styles.scoreHeader}
        onPress={hasDetail ? onToggle : undefined}
        disabled={!hasDetail}
        accessibilityLabel={`${label}: ${value} out of 100${
          hasDetail ? ', tap for details' : ''
        }`}>
        <View style={styles.scoreLabelRow}>
          <Text style={styles.scoreLabel}>{displayLabel || label}</Text>
          {detail?.confidence_level && (
            <View
              style={[
                styles.confidenceBadgeSmall,
                {backgroundColor: getConfidenceColor(detail.confidence_level)},
              ]}>
              <Text style={styles.confidenceBadgeSmallText}>
                {detail.confidence_level}
              </Text>
            </View>
          )}
        </View>
        <View style={styles.scoreValueRow}>
          <Text style={[styles.scoreValue, {color}]}>{value}/100</Text>
          {hasDetail && (
            <Icon
              name={isExpanded ? 'chevron-up' : 'chevron-down'}
              size={16}
              color={colors.textSecondary}
            />
          )}
        </View>
      </TouchableOpacity>
      <View style={styles.barContainer}>
        <View
          style={[styles.barFill, {width: `${value}%`, backgroundColor: color}]}
        />
      </View>
      <Text style={styles.scoreDescription}>{description}</Text>

      {/* Expanded Details */}
      {isExpanded && detail?.description && (
        <View style={styles.expandedDetails}>
          <Text style={styles.expandedDetailsText}>{detail.description}</Text>
        </View>
      )}
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
  categoryBadge: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.xs,
    borderRadius: borderRadius.full,
    marginBottom: spacing.sm,
  },
  categoryBadgeText: {
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.semiBold,
    textTransform: 'capitalize',
  },
  ingredientName: {
    fontSize: typography.fontSize['3xl'],
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
    textTransform: 'capitalize',
    marginBottom: spacing.xs,
    textAlign: 'center',
  },
  trustIndicator: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.base,
    gap: spacing.xs,
  },
  trustText: {
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.medium,
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
  sectionHeaderTouchable: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.base,
    gap: spacing.sm,
  },
  sectionTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.base,
    flex: 1,
  },
  scoreBar: {
    marginBottom: spacing.lg,
  },
  scoreHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  scoreLabelRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
    flex: 1,
  },
  scoreLabel: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
  },
  scoreValueRow: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.xs,
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
  expandedDetails: {
    marginTop: spacing.md,
    padding: spacing.md,
    backgroundColor: colors.background,
    borderRadius: borderRadius.md,
    borderLeftWidth: 3,
    borderLeftColor: colors.primary,
  },
  expandedDetailsText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    lineHeight: typography.fontSize.sm * 1.5,
  },
  confidenceBadgeSmall: {
    paddingHorizontal: spacing.sm,
    paddingVertical: 2,
    borderRadius: borderRadius.full,
  },
  confidenceBadgeSmallText: {
    fontSize: typography.fontSize.xs,
    color: colors.white,
    fontWeight: typography.fontWeight.medium,
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
  sourceItemContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: spacing.xs,
    gap: spacing.sm,
  },
  sourceItem: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    flex: 1,
  },
  sourceItemLink: {
    color: colors.primary,
    textDecorationLine: 'underline',
  },
});
