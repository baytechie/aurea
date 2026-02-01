import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  RefreshControl,
} from 'react-native';
import { useQuery } from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import { useNavigation } from '@react-navigation/native';
import { logsApi, insightsApi } from '../lib/api';
import { useAuth } from '../hooks/useAuth';
import { colors, typography, spacing, borderRadius, shadows } from '../theme';

export default function HomeScreen() {
  const { user } = useAuth();
  const navigation = useNavigation<any>();

  const {
    data: logs,
    isLoading: logsLoading,
    isRefetching,
    refetch: refetchLogs,
  } = useQuery({
    queryKey: ['logs'],
    queryFn: logsApi.getLogs,
  });

  const { data: insights } = useQuery({
    queryKey: ['insights'],
    queryFn: insightsApi.getInsights,
  });

  const todayLog = logs?.find(
    log => log.date === new Date().toISOString().split('T')[0],
  );

  const recentLogs = logs?.slice(0, 5) || [];

  // Get greeting based on time
  const getGreeting = () => {
    const hour = new Date().getHours();
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  };

  return (
    <ScrollView
      style={styles.container}
      refreshControl={
        <RefreshControl
          refreshing={isRefetching}
          onRefresh={refetchLogs}
          tintColor={colors.primary}
        />
      }
    >
      {/* Welcome Section */}
      <View style={styles.welcomeSection}>
        <Text style={styles.greeting}>
          {getGreeting()}, {user?.email?.split('@')[0] || 'there'}!
        </Text>
        <Text style={styles.date}>
          {new Date().toLocaleDateString('en-US', {
            weekday: 'long',
            month: 'long',
            day: 'numeric',
          })}
        </Text>
      </View>

      {/* Quick Actions */}
      <View style={styles.quickActions}>
        <TouchableOpacity
          style={styles.actionCard}
          onPress={() => navigation.navigate('Search')}
          accessibilityLabel="Search ingredients"
          accessibilityHint="Navigate to ingredient search"
        >
          <View style={styles.actionIconContainer}>
            <Icon name="search" size={24} color={colors.primary} />
          </View>
          <Text style={styles.actionTitle}>Search</Text>
          <Text style={styles.actionSubtitle}>Find ingredients</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.actionCard}
          onPress={() => navigation.navigate('Log')}
          accessibilityLabel="Log today"
          accessibilityHint="Add or update today's log"
        >
          <View style={[styles.actionIconContainer, { backgroundColor: '#F0F9FF' }]}>
            <Icon name="add-circle" size={24} color="#0EA5E9" />
          </View>
          <Text style={styles.actionTitle}>Log Today</Text>
          <Text style={styles.actionSubtitle}>
            {todayLog ? 'Update log' : 'Add entry'}
          </Text>
        </TouchableOpacity>
      </View>

      {/* Today's Summary */}
      {todayLog && (
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Today's Summary</Text>
          <View style={styles.summaryCard}>
            <View style={styles.summaryRow}>
              <Text style={styles.summaryLabel}>Ingredients logged</Text>
              <View style={styles.countBadge}>
                <Text style={styles.countText}>
                  {todayLog.ingredients?.length || 0}
                </Text>
              </View>
            </View>
            <View style={styles.ingredientTags}>
              {todayLog.ingredients?.slice(0, 5).map((ing, idx) => (
                <View key={idx} style={styles.tag}>
                  <Text style={styles.tagText}>{ing}</Text>
                </View>
              ))}
              {(todayLog.ingredients?.length || 0) > 5 && (
                <View style={[styles.tag, styles.moreTag]}>
                  <Text style={styles.moreTagText}>
                    +{todayLog.ingredients.length - 5}
                  </Text>
                </View>
              )}
            </View>
          </View>
        </View>
      )}

      {/* Top Triggers */}
      {insights?.top_triggers && insights.top_triggers.length > 0 && (
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>Your Top Triggers</Text>
            <TouchableOpacity onPress={() => navigation.navigate('Insights')}>
              <Text style={styles.seeAllText}>See all</Text>
            </TouchableOpacity>
          </View>
          {insights.top_triggers.slice(0, 3).map((trigger, idx) => (
            <View key={idx} style={styles.triggerCard}>
              <View style={styles.triggerHeader}>
                <View style={styles.triggerLeft}>
                  <View style={styles.triggerRank}>
                    <Text style={styles.triggerRankText}>#{idx + 1}</Text>
                  </View>
                  <Text style={styles.triggerName}>{trigger.ingredient}</Text>
                </View>
                <View style={styles.correlationBadge}>
                  <Text style={styles.correlationText}>
                    {Math.round(trigger.correlation * 100)}%
                  </Text>
                </View>
              </View>
              <Text style={styles.triggerSymptoms}>
                Affects: {trigger.affected_symptoms?.join(', ')}
              </Text>
            </View>
          ))}
        </View>
      )}

      {/* Recent Activity */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Recent Logs</Text>
        {recentLogs.length > 0 ? (
          recentLogs.map((log, idx) => (
            <View key={idx} style={styles.logCard}>
              <View style={styles.logDateBadge}>
                <Text style={styles.logDateDay}>
                  {new Date(log.date).getDate()}
                </Text>
                <Text style={styles.logDateMonth}>
                  {new Date(log.date).toLocaleDateString('en-US', { month: 'short' })}
                </Text>
              </View>
              <View style={styles.logContent}>
                <Text style={styles.logIngredients}>
                  {log.ingredients?.slice(0, 3).join(', ')}
                  {(log.ingredients?.length || 0) > 3 &&
                    ` +${log.ingredients.length - 3} more`}
                </Text>
              </View>
            </View>
          ))
        ) : (
          <View style={styles.emptyState}>
            <View style={styles.emptyIconContainer}>
              <Icon name="document-text-outline" size={32} color={colors.textTertiary} />
            </View>
            <Text style={styles.emptyText}>No logs yet</Text>
            <Text style={styles.emptySubtext}>
              Start by logging what you eat today
            </Text>
            <TouchableOpacity
              style={styles.emptyButton}
              onPress={() => navigation.navigate('Log')}
            >
              <Text style={styles.emptyButtonText}>Add your first log</Text>
              <Icon name="arrow-forward" size={16} color={colors.primary} />
            </TouchableOpacity>
          </View>
        )}
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
  welcomeSection: {
    paddingHorizontal: spacing.lg,
    paddingTop: spacing.base,
    paddingBottom: spacing.lg,
    backgroundColor: colors.white,
  },
  greeting: {
    fontSize: typography.fontSize.xl,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
  },
  date: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginTop: spacing.xs,
  },
  quickActions: {
    flexDirection: 'row',
    paddingHorizontal: spacing.base,
    paddingTop: spacing.base,
    gap: spacing.md,
  },
  actionCard: {
    flex: 1,
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    alignItems: 'center',
    ...shadows.md,
  },
  actionIconContainer: {
    width: 48,
    height: 48,
    borderRadius: borderRadius.md,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.md,
  },
  actionTitle: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
  },
  actionSubtitle: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginTop: spacing.xs,
  },
  section: {
    padding: spacing.base,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  sectionTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.md,
  },
  seeAllText: {
    fontSize: typography.fontSize.sm,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
  },
  summaryCard: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
  },
  summaryRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  summaryLabel: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },
  countBadge: {
    backgroundColor: colors.primaryBackground,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.xs,
    borderRadius: borderRadius.full,
  },
  countText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.primary,
  },
  ingredientTags: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  tag: {
    backgroundColor: colors.primaryBackground,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.full,
  },
  tagText: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
  },
  moreTag: {
    backgroundColor: colors.border,
  },
  moreTagText: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    fontWeight: typography.fontWeight.medium,
  },
  triggerCard: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.sm,
  },
  triggerHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  triggerLeft: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.md,
  },
  triggerRank: {
    width: 28,
    height: 28,
    borderRadius: 14,
    backgroundColor: colors.errorLight,
    alignItems: 'center',
    justifyContent: 'center',
  },
  triggerRankText: {
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.bold,
    color: colors.error,
  },
  triggerName: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    textTransform: 'capitalize',
  },
  correlationBadge: {
    backgroundColor: colors.errorLight,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.xs,
    borderRadius: borderRadius.full,
  },
  correlationText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.error,
  },
  triggerSymptoms: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginLeft: 40,
  },
  logCard: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.sm,
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.md,
  },
  logDateBadge: {
    width: 48,
    height: 48,
    borderRadius: borderRadius.md,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
  },
  logDateDay: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.primary,
    lineHeight: typography.fontSize.lg,
  },
  logDateMonth: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
    textTransform: 'uppercase',
  },
  logContent: {
    flex: 1,
  },
  logIngredients: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },
  emptyState: {
    alignItems: 'center',
    padding: spacing['2xl'],
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
  },
  emptyIconContainer: {
    width: 64,
    height: 64,
    borderRadius: 32,
    backgroundColor: colors.background,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.base,
  },
  emptyText: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textSecondary,
  },
  emptySubtext: {
    fontSize: typography.fontSize.sm,
    color: colors.textTertiary,
    marginTop: spacing.xs,
    marginBottom: spacing.lg,
  },
  emptyButton: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
  },
  emptyButtonText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.primary,
  },
});
