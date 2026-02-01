import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  RefreshControl,
} from 'react-native';
import { useQuery } from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import { insightsApi, logsApi } from '../lib/api';
import { colors, typography, spacing, borderRadius } from '../theme';

export default function InsightsScreen() {
  const {
    data: insights,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ['insights'],
    queryFn: insightsApi.getInsights,
  });

  const { data: logs } = useQuery({
    queryKey: ['logs'],
    queryFn: logsApi.getLogs,
  });

  const totalLogs = logs?.length || 0;

  return (
    <ScrollView
      style={styles.container}
      refreshControl={
        <RefreshControl
          refreshing={isLoading}
          onRefresh={refetch}
          tintColor={colors.primary}
        />
      }
    >
      {/* Stats Header */}
      <View style={styles.statsHeader}>
        <View style={styles.statCard}>
          <Text style={styles.statValue}>{totalLogs}</Text>
          <Text style={styles.statLabel}>Total Logs</Text>
        </View>
        <View style={styles.statCard}>
          <Text style={styles.statValue}>
            {insights?.top_triggers?.length || 0}
          </Text>
          <Text style={styles.statLabel}>Triggers Found</Text>
        </View>
      </View>

      {/* Top Triggers */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>🎯 Your Top Triggers</Text>
        {insights?.top_triggers && insights.top_triggers.length > 0 ? (
          insights.top_triggers.map((trigger, idx) => (
            <View key={idx} style={styles.triggerCard}>
              <View style={styles.triggerRank}>
                <Text style={styles.rankText}>#{idx + 1}</Text>
              </View>
              <View style={styles.triggerContent}>
                <Text style={styles.triggerName}>{trigger.ingredient}</Text>
                <Text style={styles.triggerSymptoms}>
                  Affects: {trigger.affected_symptoms?.join(', ') || 'N/A'}
                </Text>
              </View>
              <View style={styles.correlationContainer}>
                <Text style={styles.correlationValue}>
                  {Math.round((trigger.correlation || 0) * 100)}%
                </Text>
                <Text style={styles.correlationLabel}>correlation</Text>
              </View>
            </View>
          ))
        ) : (
          <View style={styles.emptyCard}>
            <Icon name="analytics-outline" size={40} color={colors.textTertiary} />
            <Text style={styles.emptyText}>
              Not enough data yet. Keep logging to discover your triggers!
            </Text>
          </View>
        )}
      </View>

      {/* Recommendations */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>💡 Recommendations</Text>
        {insights?.recommendations && insights.recommendations.length > 0 ? (
          insights.recommendations.map((rec, idx) => (
            <View key={idx} style={styles.recCard}>
              <Icon name="checkmark-circle" size={20} color={colors.primary} />
              <Text style={styles.recText}>{rec}</Text>
            </View>
          ))
        ) : (
          <View style={styles.recCard}>
            <Icon name="checkmark-circle" size={20} color={colors.primary} />
            <Text style={styles.recText}>Keep logging to unlock personalized insights!</Text>
          </View>
        )}
      </View>

      {/* How It Works */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>📊 How Insights Work</Text>
        <View style={styles.infoCard}>
          <View style={styles.infoRow}>
            <View style={styles.infoIconContainer}>
              <Icon name="create-outline" size={22} color={colors.primary} />
            </View>
            <View style={styles.infoText}>
              <Text style={styles.infoTitle}>Log Daily</Text>
              <Text style={styles.infoDesc}>
                Record what you eat and how you feel
              </Text>
            </View>
          </View>
          <View style={styles.infoRow}>
            <View style={styles.infoIconContainer}>
              <Icon name="analytics-outline" size={22} color={colors.primary} />
            </View>
            <View style={styles.infoText}>
              <Text style={styles.infoTitle}>We Analyze</Text>
              <Text style={styles.infoDesc}>
                Our AI finds patterns in your data
              </Text>
            </View>
          </View>
          <View style={[styles.infoRow, { borderBottomWidth: 0 }]}>
            <View style={styles.infoIconContainer}>
              <Icon name="flash-outline" size={22} color={colors.primary} />
            </View>
            <View style={styles.infoText}>
              <Text style={styles.infoTitle}>Get Insights</Text>
              <Text style={styles.infoDesc}>
                Discover your personal triggers
              </Text>
            </View>
          </View>
        </View>
      </View>

      <View style={{ height: 40 }} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  statsHeader: {
    flexDirection: 'row',
    padding: spacing.base,
    gap: spacing.md,
  },
  statCard: {
    flex: 1,
    backgroundColor: colors.primary,
    borderRadius: borderRadius.lg,
    padding: spacing.lg,
    alignItems: 'center',
  },
  statValue: {
    fontSize: 32,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
  },
  statLabel: {
    fontSize: typography.fontSize.xs,
    color: 'rgba(255,255,255,0.8)',
    marginTop: spacing.xs,
  },
  section: {
    padding: spacing.base,
    paddingTop: 0,
  },
  sectionTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.md,
  },
  triggerCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.sm,
  },
  triggerRank: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: spacing.md,
  },
  rankText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.primary,
  },
  triggerContent: {
    flex: 1,
  },
  triggerName: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    textTransform: 'capitalize',
  },
  triggerSymptoms: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginTop: spacing.xs,
  },
  correlationContainer: {
    alignItems: 'flex-end',
  },
  correlationValue: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.error,
  },
  correlationLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
  },
  emptyCard: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing['2xl'],
    alignItems: 'center',
  },
  emptyText: {
    fontSize: typography.fontSize.sm,
    color: colors.textTertiary,
    textAlign: 'center',
    marginTop: spacing.md,
  },
  recCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.sm,
    gap: spacing.md,
  },
  recText: {
    flex: 1,
    fontSize: typography.fontSize.sm,
    color: colors.textPrimary,
  },
  infoCard: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
  },
  infoRow: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  infoIconContainer: {
    width: 40,
    height: 40,
    borderRadius: borderRadius.md,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
  },
  infoText: {
    marginLeft: spacing.md,
    flex: 1,
  },
  infoTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
  },
  infoDesc: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginTop: spacing.xs,
  },
});
