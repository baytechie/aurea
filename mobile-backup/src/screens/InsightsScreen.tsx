import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  RefreshControl,
} from 'react-native';
import {useQuery} from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import {insightsApi, logsApi} from '../lib/api';

export default function InsightsScreen() {
  const {
    data: insights,
    isLoading,
    refetch,
  } = useQuery({
    queryKey: ['insights'],
    queryFn: insightsApi.getInsights,
  });

  const {data: logs} = useQuery({
    queryKey: ['logs'],
    queryFn: logsApi.getLogs,
  });

  const totalLogs = logs?.length || 0;

  return (
    <ScrollView
      style={styles.container}
      refreshControl={
        <RefreshControl refreshing={isLoading} onRefresh={refetch} />
      }>
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
            <Icon name="analytics-outline" size={40} color="#ccc" />
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
              <Icon name="checkmark-circle" size={20} color="#2E7D32" />
              <Text style={styles.recText}>{rec}</Text>
            </View>
          ))
        ) : (
          <View style={styles.emptyCard}>
            <Icon name="bulb-outline" size={40} color="#ccc" />
            <Text style={styles.emptyText}>
              Recommendations will appear as you log more data.
            </Text>
          </View>
        )}
      </View>

      {/* How It Works */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>📊 How Insights Work</Text>
        <View style={styles.infoCard}>
          <View style={styles.infoRow}>
            <Icon name="create-outline" size={24} color="#2E7D32" />
            <View style={styles.infoText}>
              <Text style={styles.infoTitle}>Log Daily</Text>
              <Text style={styles.infoDesc}>
                Record what you eat and how you feel
              </Text>
            </View>
          </View>
          <View style={styles.infoRow}>
            <Icon name="analytics-outline" size={24} color="#2E7D32" />
            <View style={styles.infoText}>
              <Text style={styles.infoTitle}>We Analyze</Text>
              <Text style={styles.infoDesc}>
                Our AI finds patterns in your data
              </Text>
            </View>
          </View>
          <View style={styles.infoRow}>
            <Icon name="flash-outline" size={24} color="#2E7D32" />
            <View style={styles.infoText}>
              <Text style={styles.infoTitle}>Get Insights</Text>
              <Text style={styles.infoDesc}>
                Discover your personal triggers
              </Text>
            </View>
          </View>
        </View>
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
  statsHeader: {
    flexDirection: 'row',
    padding: 16,
    gap: 12,
  },
  statCard: {
    flex: 1,
    backgroundColor: '#2E7D32',
    borderRadius: 16,
    padding: 20,
    alignItems: 'center',
  },
  statValue: {
    fontSize: 32,
    fontWeight: '700',
    color: '#fff',
  },
  statLabel: {
    fontSize: 12,
    color: 'rgba(255,255,255,0.8)',
    marginTop: 4,
  },
  section: {
    padding: 16,
    paddingTop: 0,
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: '600',
    color: '#333',
    marginBottom: 12,
  },
  triggerCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 8,
  },
  triggerRank: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: '#E8F5E9',
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 12,
  },
  rankText: {
    fontSize: 14,
    fontWeight: '600',
    color: '#2E7D32',
  },
  triggerContent: {
    flex: 1,
  },
  triggerName: {
    fontSize: 16,
    fontWeight: '600',
    color: '#333',
    textTransform: 'capitalize',
  },
  triggerSymptoms: {
    fontSize: 12,
    color: '#666',
    marginTop: 2,
  },
  correlationContainer: {
    alignItems: 'flex-end',
  },
  correlationValue: {
    fontSize: 18,
    fontWeight: '700',
    color: '#EF5350',
  },
  correlationLabel: {
    fontSize: 10,
    color: '#999',
  },
  emptyCard: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 32,
    alignItems: 'center',
  },
  emptyText: {
    fontSize: 14,
    color: '#999',
    textAlign: 'center',
    marginTop: 12,
  },
  recCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
    marginBottom: 8,
    gap: 12,
  },
  recText: {
    flex: 1,
    fontSize: 14,
    color: '#333',
  },
  infoCard: {
    backgroundColor: '#fff',
    borderRadius: 12,
    padding: 16,
  },
  infoRow: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 12,
    borderBottomWidth: 1,
    borderBottomColor: '#f0f0f0',
  },
  infoText: {
    marginLeft: 16,
  },
  infoTitle: {
    fontSize: 14,
    fontWeight: '600',
    color: '#333',
  },
  infoDesc: {
    fontSize: 12,
    color: '#666',
    marginTop: 2,
  },
});
