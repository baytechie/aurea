import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  RefreshControl,
} from 'react-native';
import {useQuery} from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import {useNavigation} from '@react-navigation/native';
import {logsApi, insightsApi} from '../lib/api';
import {useAuth} from '../hooks/useAuth';

export default function HomeScreen() {
  const {user} = useAuth();
  const navigation = useNavigation<any>();

  const {
    data: logs,
    isLoading: logsLoading,
    refetch: refetchLogs,
  } = useQuery({
    queryKey: ['logs'],
    queryFn: logsApi.getLogs,
  });

  const {data: insights} = useQuery({
    queryKey: ['insights'],
    queryFn: insightsApi.getInsights,
  });

  const todayLog = logs?.find(
    log => log.date === new Date().toISOString().split('T')[0],
  );

  const recentLogs = logs?.slice(0, 5) || [];

  return (
    <ScrollView
      style={styles.container}
      refreshControl={
        <RefreshControl refreshing={logsLoading} onRefresh={refetchLogs} />
      }>
      {/* Welcome Section */}
      <View style={styles.header}>
        <Text style={styles.greeting}>
          Hello, {user?.email?.split('@')[0] || 'there'}! 👋
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
          onPress={() => navigation.navigate('Search')}>
          <Icon name="search" size={28} color="#2E7D32" />
          <Text style={styles.actionTitle}>Search</Text>
          <Text style={styles.actionSubtitle}>Find ingredients</Text>
        </TouchableOpacity>

        <TouchableOpacity
          style={styles.actionCard}
          onPress={() => navigation.navigate('Log')}>
          <Icon name="add-circle" size={28} color="#2E7D32" />
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
              <Text style={styles.summaryLabel}>Ingredients logged:</Text>
              <Text style={styles.summaryValue}>
                {todayLog.ingredients?.length || 0}
              </Text>
            </View>
            <View style={styles.ingredientTags}>
              {todayLog.ingredients?.slice(0, 5).map((ing, idx) => (
                <View key={idx} style={styles.tag}>
                  <Text style={styles.tagText}>{ing}</Text>
                </View>
              ))}
              {(todayLog.ingredients?.length || 0) > 5 && (
                <View style={styles.tag}>
                  <Text style={styles.tagText}>
                    +{todayLog.ingredients.length - 5} more
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
          <Text style={styles.sectionTitle}>Your Top Triggers</Text>
          {insights.top_triggers.slice(0, 3).map((trigger, idx) => (
            <View key={idx} style={styles.triggerCard}>
              <View style={styles.triggerHeader}>
                <Text style={styles.triggerName}>{trigger.ingredient}</Text>
                <View
                  style={[
                    styles.correlationBadge,
                    {
                      backgroundColor:
                        trigger.correlation > 0.5 ? '#FFEBEE' : '#FFF3E0',
                    },
                  ]}>
                  <Text style={styles.correlationText}>
                    {Math.round(trigger.correlation * 100)}% correlation
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
              <Text style={styles.logDate}>
                {new Date(log.date).toLocaleDateString('en-US', {
                  weekday: 'short',
                  month: 'short',
                  day: 'numeric',
                })}
              </Text>
              <Text style={styles.logIngredients}>
                {log.ingredients?.slice(0, 3).join(', ')}
                {(log.ingredients?.length || 0) > 3 &&
                  ` +${log.ingredients.length - 3} more`}
              </Text>
            </View>
          ))
        ) : (
          <View style={styles.emptyState}>
            <Icon name="document-text-outline" size={48} color="#ccc" />
            <Text style={styles.emptyText}>No logs yet</Text>
            <Text style={styles.emptySubtext}>
              Start by logging what you eat today
            </Text>
          </View>
        )}
      </View>

      <View style={{height: 40}} />
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  header: {
    backgroundColor: '#2E7D32',
    paddingHorizontal: 20,
    paddingTop: 20,
    paddingBottom: 30,
  },
  greeting: {
    fontSize: 24,
    fontWeight: '700',
    color: '#fff',
    marginBottom: 4,
  },
  date: {
    fontSize: 14,
    color: 'rgba(255,255,255,0.8)',
  },
  quickActions: {
    flexDirection: 'row',
    paddingHorizontal: 16,
    marginTop: -20,
    gap: 12,
  },
  actionCard: {
    flex: 1,
    backgroundColor: '#fff',
    borderRadius: 16,
    padding: 16,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: {width: 0, height: 2},
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 3,
  },
  actionTitle: {
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
    marginTop: 8,
  },
  actionSubtitle: {
    fontSize: 12,
    color: '#666',
    marginTop: 2,
  },
  section: {
    padding: 16,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#333',
    marginBottom: 12,
  },
  summaryCard: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
  },
  summaryRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 12,
  },
  summaryLabel: {
    fontSize: 14,
    color: '#666',
  },
  summaryValue: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
  },
  ingredientTags: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: 8,
  },
  tag: {
    backgroundColor: '#E8F5E9',
    paddingHorizontal: 12,
    paddingVertical: 6,
    borderRadius: 16,
  },
  tagText: {
    fontSize: 12,
    color: '#2E7D32',
  },
  triggerCard: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 8,
  },
  triggerHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 8,
  },
  triggerName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
    textTransform: 'capitalize',
  },
  correlationBadge: {
    paddingHorizontal: 8,
    paddingVertical: 4,
    borderRadius: 8,
  },
  correlationText: {
    fontSize: 12,
    color: '#666',
  },
  triggerSymptoms: {
    fontSize: 14,
    color: '#666',
  },
  logCard: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 8,
  },
  logDate: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
    marginBottom: 4,
  },
  logIngredients: {
    fontSize: 14,
    color: '#666',
  },
  emptyState: {
    alignItems: 'center',
    padding: 40,
  },
  emptyText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#999',
    marginTop: 12,
  },
  emptySubtext: {
    fontSize: 14,
    color: '#bbb',
    marginTop: 4,
  },
});
