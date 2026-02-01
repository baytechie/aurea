import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Alert,
  Modal,
  TextInput,
  Switch,
  Share,
  FlatList,
  ActivityIndicator,
  Linking,
} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { useAuth } from '../hooks/useAuth';
import { logsApi, insightsApi, authApi, DailyLog } from '../lib/api';
import { colors, typography, spacing, borderRadius, shadows } from '../theme';

// Storage keys for settings
const GOALS_STORAGE_KEY = '@aurea_goals';
const NOTIFICATIONS_STORAGE_KEY = '@aurea_notifications';

interface Goal {
  id: string;
  title: string;
  target: number;
  current: number;
  unit: string;
  completed: boolean;
}

interface NotificationSettings {
  dailyReminder: boolean;
  reminderTime: string;
  insightAlerts: boolean;
  weeklyReport: boolean;
}

export default function ProfileScreen() {
  const { user, logout } = useAuth();
  const queryClient = useQueryClient();

  // Modal states
  const [historyModalVisible, setHistoryModalVisible] = useState(false);
  const [goalsModalVisible, setGoalsModalVisible] = useState(false);
  const [editProfileModalVisible, setEditProfileModalVisible] = useState(false);
  const [notificationsModalVisible, setNotificationsModalVisible] = useState(false);
  const [privacyModalVisible, setPrivacyModalVisible] = useState(false);

  // Data states
  const [goals, setGoals] = useState<Goal[]>([]);
  const [newGoalTitle, setNewGoalTitle] = useState('');
  const [newGoalTarget, setNewGoalTarget] = useState('');
  const [profileName, setProfileName] = useState('');
  const [notificationSettings, setNotificationSettings] = useState<NotificationSettings>({
    dailyReminder: true,
    reminderTime: '09:00',
    insightAlerts: true,
    weeklyReport: false,
  });

  // Fetch logs for stats and history
  const { data: logs = [], isLoading: logsLoading } = useQuery({
    queryKey: ['logs'],
    queryFn: logsApi.getLogs,
  });

  // Fetch insights for stats
  const { data: insights, isLoading: insightsLoading } = useQuery({
    queryKey: ['insights'],
    queryFn: insightsApi.getInsights,
  });

  // Calculate dynamic stats
  const totalDaysLogged = logs.length;
  const uniqueIngredients = new Set(logs.flatMap((log: DailyLog) => log.ingredients || [])).size;
  const insightsCount = insights?.recommendations?.length || 0;

  // Load goals from AsyncStorage
  useEffect(() => {
    loadGoals();
    loadNotificationSettings();
    if (user?.name) {
      setProfileName(user.name);
    } else if (user?.email) {
      setProfileName(user.email.split('@')[0]);
    }
  }, [user]);

  const loadGoals = async () => {
    try {
      const storedGoals = await AsyncStorage.getItem(GOALS_STORAGE_KEY);
      if (storedGoals) {
        setGoals(JSON.parse(storedGoals));
      }
    } catch (error) {
      console.error('Error loading goals:', error);
    }
  };

  const saveGoals = async (newGoals: Goal[]) => {
    try {
      await AsyncStorage.setItem(GOALS_STORAGE_KEY, JSON.stringify(newGoals));
      setGoals(newGoals);
    } catch (error) {
      console.error('Error saving goals:', error);
    }
  };

  const loadNotificationSettings = async () => {
    try {
      const stored = await AsyncStorage.getItem(NOTIFICATIONS_STORAGE_KEY);
      if (stored) {
        setNotificationSettings(JSON.parse(stored));
      }
    } catch (error) {
      console.error('Error loading notification settings:', error);
    }
  };

  const saveNotificationSettings = async (settings: NotificationSettings) => {
    try {
      await AsyncStorage.setItem(NOTIFICATIONS_STORAGE_KEY, JSON.stringify(settings));
      setNotificationSettings(settings);
    } catch (error) {
      console.error('Error saving notification settings:', error);
    }
  };

  const handleLogout = () => {
    Alert.alert('Logout', 'Are you sure you want to log out?', [
      { text: 'Cancel', style: 'cancel' },
      { text: 'Logout', style: 'destructive', onPress: logout },
    ]);
  };

  const handleShare = async () => {
    try {
      await Share.share({
        message: `I'm using Aurea Health to track my food and wellness! I've logged ${totalDaysLogged} days and tracked ${uniqueIngredients} ingredients. Check it out!`,
        title: 'Share Aurea Health',
      });
    } catch (error) {
      console.error('Error sharing:', error);
    }
  };

  const handleAddGoal = () => {
    if (!newGoalTitle.trim() || !newGoalTarget.trim()) {
      Alert.alert('Error', 'Please enter a goal title and target');
      return;
    }

    const newGoal: Goal = {
      id: Date.now().toString(),
      title: newGoalTitle,
      target: parseInt(newGoalTarget, 10),
      current: 0,
      unit: 'days',
      completed: false,
    };

    saveGoals([...goals, newGoal]);
    setNewGoalTitle('');
    setNewGoalTarget('');
  };

  const handleDeleteGoal = (goalId: string) => {
    Alert.alert('Delete Goal', 'Are you sure you want to delete this goal?', [
      { text: 'Cancel', style: 'cancel' },
      {
        text: 'Delete',
        style: 'destructive',
        onPress: () => saveGoals(goals.filter(g => g.id !== goalId)),
      },
    ]);
  };

  const handleToggleGoal = (goalId: string) => {
    const updatedGoals = goals.map(g =>
      g.id === goalId ? { ...g, completed: !g.completed } : g
    );
    saveGoals(updatedGoals);
  };

  const handleExportData = async () => {
    try {
      const exportData = {
        exportDate: new Date().toISOString(),
        user: { email: user?.email },
        logs,
        insights,
        goals,
      };

      await Share.share({
        message: JSON.stringify(exportData, null, 2),
        title: 'Aurea Health Data Export',
      });
    } catch (error) {
      Alert.alert('Error', 'Failed to export data');
    }
  };

  const handleClearHistory = () => {
    Alert.alert(
      'Clear All Data',
      'This will permanently delete all your logs, goals, and cached data. This action cannot be undone.',
      [
        { text: 'Cancel', style: 'cancel' },
        {
          text: 'Clear All',
          style: 'destructive',
          onPress: async () => {
            try {
              // Clear local storage
              await AsyncStorage.multiRemove([
                GOALS_STORAGE_KEY,
                NOTIFICATIONS_STORAGE_KEY,
                '@food_history',
              ]);
              setGoals([]);

              // Invalidate queries to refetch
              queryClient.invalidateQueries({ queryKey: ['logs'] });
              queryClient.invalidateQueries({ queryKey: ['insights'] });

              Alert.alert('Success', 'All local data has been cleared');
            } catch (error) {
              Alert.alert('Error', 'Failed to clear data');
            }
          },
        },
      ]
    );
  };

  const handleOpenLink = (url: string) => {
    Linking.openURL(url).catch(() => {
      Alert.alert('Error', 'Could not open link');
    });
  };

  const handleUpdateProfile = async () => {
    try {
      await authApi.updateProfile({ name: profileName });
      Alert.alert('Success', 'Profile updated successfully');
      setEditProfileModalVisible(false);
    } catch (error) {
      // Store locally if API fails
      await AsyncStorage.setItem('@user_name', profileName);
      Alert.alert('Success', 'Profile updated locally');
      setEditProfileModalVisible(false);
    }
  };

  const userInitials = user?.email?.charAt(0).toUpperCase() || 'U';
  const displayName = profileName || user?.email?.split('@')[0] || 'User';

  const formatDate = (dateString: string) => {
    const date = new Date(dateString);
    return date.toLocaleDateString('en-US', {
      month: 'short',
      day: 'numeric',
      year: 'numeric',
    });
  };

  return (
    <ScrollView style={styles.container} showsVerticalScrollIndicator={false}>
      {/* Profile Card */}
      <View style={styles.profileCard}>
        <View style={styles.profileGradient}>
          <View style={styles.avatarContainer}>
            <View style={styles.avatar}>
              <Text style={styles.avatarText}>{userInitials}</Text>
            </View>
            <View style={styles.avatarBadge}>
              <Icon name="checkmark" size={12} color={colors.white} />
            </View>
          </View>
          <Text style={styles.userName}>{displayName}</Text>
          <Text style={styles.userEmail}>{user?.email}</Text>

          {/* Stats Row - Now Dynamic */}
          <View style={styles.statsRow}>
            <View style={styles.statItem}>
              {logsLoading ? (
                <ActivityIndicator size="small" color={colors.white} />
              ) : (
                <Text style={styles.statNumber}>{totalDaysLogged}</Text>
              )}
              <Text style={styles.statLabel}>Days Logged</Text>
            </View>
            <View style={styles.statDivider} />
            <View style={styles.statItem}>
              {logsLoading ? (
                <ActivityIndicator size="small" color={colors.white} />
              ) : (
                <Text style={styles.statNumber}>{uniqueIngredients}</Text>
              )}
              <Text style={styles.statLabel}>Ingredients</Text>
            </View>
            <View style={styles.statDivider} />
            <View style={styles.statItem}>
              {insightsLoading ? (
                <ActivityIndicator size="small" color={colors.white} />
              ) : (
                <Text style={styles.statNumber}>{insightsCount}</Text>
              )}
              <Text style={styles.statLabel}>Insights</Text>
            </View>
          </View>
        </View>
      </View>

      {/* Quick Actions */}
      <View style={styles.quickActions}>
        <TouchableOpacity
          style={styles.quickAction}
          onPress={() => setHistoryModalVisible(true)}
        >
          <View style={[styles.quickActionIcon, { backgroundColor: colors.primaryBackground }]}>
            <Icon name="calendar-outline" size={20} color={colors.primary} />
          </View>
          <Text style={styles.quickActionText}>History</Text>
        </TouchableOpacity>
        <TouchableOpacity
          style={styles.quickAction}
          onPress={() => setGoalsModalVisible(true)}
        >
          <View style={[styles.quickActionIcon, { backgroundColor: '#FEF3C7' }]}>
            <Icon name="star-outline" size={20} color="#F59E0B" />
          </View>
          <Text style={styles.quickActionText}>Goals</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.quickAction} onPress={handleShare}>
          <View style={[styles.quickActionIcon, { backgroundColor: '#E0E7FF' }]}>
            <Icon name="share-outline" size={20} color="#6366F1" />
          </View>
          <Text style={styles.quickActionText}>Share</Text>
        </TouchableOpacity>
      </View>

      {/* Settings Sections */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Account Settings</Text>
        <View style={styles.menuCard}>
          <MenuItem
            icon="person-outline"
            iconBg="#E0F2FE"
            iconColor="#0EA5E9"
            label="Edit Profile"
            subtitle="Update your personal info"
            onPress={() => setEditProfileModalVisible(true)}
          />
          <MenuItem
            icon="notifications-outline"
            iconBg="#FEE2E2"
            iconColor="#EF4444"
            label="Notifications"
            subtitle="Manage alerts & reminders"
            onPress={() => setNotificationsModalVisible(true)}
          />
          <MenuItem
            icon="shield-checkmark-outline"
            iconBg="#D1FAE5"
            iconColor="#10B981"
            label="Privacy & Security"
            subtitle="Control your data"
            onPress={() => setPrivacyModalVisible(true)}
            isLast
          />
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Data Management</Text>
        <View style={styles.menuCard}>
          <MenuItem
            icon="cloud-download-outline"
            iconBg={colors.primaryBackground}
            iconColor={colors.primary}
            label="Export Data"
            subtitle="Download your health data"
            onPress={handleExportData}
          />
          <MenuItem
            icon="trash-outline"
            iconBg="#FEE2E2"
            iconColor="#EF4444"
            label="Clear History"
            subtitle="Delete all your logs"
            onPress={handleClearHistory}
            isLast
          />
        </View>
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>Support</Text>
        <View style={styles.menuCard}>
          <MenuItem
            icon="help-buoy-outline"
            iconBg="#E0E7FF"
            iconColor="#6366F1"
            label="Help Center"
            subtitle="FAQs and guides"
            onPress={() => handleOpenLink('https://aureahealth.app/help')}
          />
          <MenuItem
            icon="chatbubbles-outline"
            iconBg="#FEF3C7"
            iconColor="#F59E0B"
            label="Contact Support"
            subtitle="Get in touch with us"
            onPress={() => handleOpenLink('mailto:support@aureahealth.app')}
          />
          <MenuItem
            icon="document-text-outline"
            iconBg="#F3F4F6"
            iconColor="#6B7280"
            label="Terms & Privacy"
            subtitle="Legal information"
            onPress={() => handleOpenLink('https://aureahealth.app/privacy')}
            isLast
          />
        </View>
      </View>

      {/* Logout Button */}
      <TouchableOpacity style={styles.logoutButton} onPress={handleLogout}>
        <Icon name="log-out-outline" size={22} color={colors.error} />
        <Text style={styles.logoutText}>Sign Out</Text>
      </TouchableOpacity>

      {/* App Info */}
      <View style={styles.appInfo}>
        <View style={styles.appLogo}>
          <Icon name="leaf" size={16} color={colors.primary} />
        </View>
        <Text style={styles.appName}>Aurea Health</Text>
        <Text style={styles.version}>Version 1.0.1</Text>
      </View>

      <View style={{ height: 40 }} />

      {/* History Modal */}
      <Modal
        visible={historyModalVisible}
        animationType="slide"
        presentationStyle="pageSheet"
        onRequestClose={() => setHistoryModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>Log History</Text>
            <TouchableOpacity onPress={() => setHistoryModalVisible(false)}>
              <Icon name="close" size={24} color={colors.textPrimary} />
            </TouchableOpacity>
          </View>

          {logsLoading ? (
            <View style={styles.loadingContainer}>
              <ActivityIndicator size="large" color={colors.primary} />
            </View>
          ) : logs.length === 0 ? (
            <View style={styles.emptyState}>
              <Icon name="document-text-outline" size={48} color={colors.textTertiary} />
              <Text style={styles.emptyText}>No logs yet</Text>
              <Text style={styles.emptySubtext}>Start logging your meals to see history</Text>
            </View>
          ) : (
            <FlatList
              data={logs}
              keyExtractor={(item) => item.id}
              renderItem={({ item }) => (
                <View style={styles.historyItem}>
                  <View style={styles.historyDate}>
                    <Icon name="calendar" size={16} color={colors.primary} />
                    <Text style={styles.historyDateText}>{formatDate(item.date)}</Text>
                  </View>
                  <View style={styles.historyIngredients}>
                    {(item.ingredients || []).slice(0, 5).map((ing, idx) => (
                      <View key={idx} style={styles.ingredientChip}>
                        <Text style={styles.ingredientChipText}>{ing}</Text>
                      </View>
                    ))}
                    {(item.ingredients || []).length > 5 && (
                      <Text style={styles.moreText}>
                        +{(item.ingredients || []).length - 5} more
                      </Text>
                    )}
                  </View>
                  {item.symptoms && (
                    <View style={styles.symptomsSummary}>
                      <Text style={styles.symptomsLabel}>Symptoms: </Text>
                      <Text style={styles.symptomsText}>
                        Energy {item.symptoms.energy}/5, Mood {item.symptoms.mood}/5
                      </Text>
                    </View>
                  )}
                </View>
              )}
              contentContainerStyle={styles.historyList}
            />
          )}
        </View>
      </Modal>

      {/* Goals Modal */}
      <Modal
        visible={goalsModalVisible}
        animationType="slide"
        presentationStyle="pageSheet"
        onRequestClose={() => setGoalsModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>My Goals</Text>
            <TouchableOpacity onPress={() => setGoalsModalVisible(false)}>
              <Icon name="close" size={24} color={colors.textPrimary} />
            </TouchableOpacity>
          </View>

          {/* Add Goal Form */}
          <View style={styles.addGoalForm}>
            <TextInput
              style={styles.goalInput}
              placeholder="Goal title (e.g., Log meals daily)"
              value={newGoalTitle}
              onChangeText={setNewGoalTitle}
              placeholderTextColor={colors.textTertiary}
            />
            <View style={styles.goalTargetRow}>
              <TextInput
                style={[styles.goalInput, styles.goalTargetInput]}
                placeholder="Target"
                value={newGoalTarget}
                onChangeText={setNewGoalTarget}
                keyboardType="numeric"
                placeholderTextColor={colors.textTertiary}
              />
              <TouchableOpacity style={styles.addGoalButton} onPress={handleAddGoal}>
                <Icon name="add" size={24} color={colors.white} />
              </TouchableOpacity>
            </View>
          </View>

          {/* Goals List */}
          {goals.length === 0 ? (
            <View style={styles.emptyState}>
              <Icon name="trophy-outline" size={48} color={colors.textTertiary} />
              <Text style={styles.emptyText}>No goals yet</Text>
              <Text style={styles.emptySubtext}>Add a goal to track your progress</Text>
            </View>
          ) : (
            <FlatList
              data={goals}
              keyExtractor={(item) => item.id}
              renderItem={({ item }) => (
                <View style={styles.goalItem}>
                  <TouchableOpacity
                    style={styles.goalCheckbox}
                    onPress={() => handleToggleGoal(item.id)}
                  >
                    <Icon
                      name={item.completed ? 'checkbox' : 'square-outline'}
                      size={24}
                      color={item.completed ? colors.success : colors.textTertiary}
                    />
                  </TouchableOpacity>
                  <View style={styles.goalContent}>
                    <Text style={[
                      styles.goalTitle,
                      item.completed && styles.goalCompleted
                    ]}>
                      {item.title}
                    </Text>
                    <Text style={styles.goalTarget}>
                      Target: {item.target} {item.unit}
                    </Text>
                  </View>
                  <TouchableOpacity onPress={() => handleDeleteGoal(item.id)}>
                    <Icon name="trash-outline" size={20} color={colors.error} />
                  </TouchableOpacity>
                </View>
              )}
              contentContainerStyle={styles.goalsList}
            />
          )}
        </View>
      </Modal>

      {/* Edit Profile Modal */}
      <Modal
        visible={editProfileModalVisible}
        animationType="slide"
        presentationStyle="pageSheet"
        onRequestClose={() => setEditProfileModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>Edit Profile</Text>
            <TouchableOpacity onPress={() => setEditProfileModalVisible(false)}>
              <Icon name="close" size={24} color={colors.textPrimary} />
            </TouchableOpacity>
          </View>

          <View style={styles.editProfileContent}>
            <View style={styles.profileAvatarLarge}>
              <Text style={styles.profileAvatarText}>{userInitials}</Text>
            </View>

            <Text style={styles.inputLabel}>Display Name</Text>
            <TextInput
              style={styles.textInput}
              value={profileName}
              onChangeText={setProfileName}
              placeholder="Enter your name"
              placeholderTextColor={colors.textTertiary}
            />

            <Text style={styles.inputLabel}>Email</Text>
            <View style={styles.disabledInput}>
              <Text style={styles.disabledInputText}>{user?.email}</Text>
              <Icon name="lock-closed" size={16} color={colors.textTertiary} />
            </View>

            <TouchableOpacity style={styles.saveButton} onPress={handleUpdateProfile}>
              <Text style={styles.saveButtonText}>Save Changes</Text>
            </TouchableOpacity>
          </View>
        </View>
      </Modal>

      {/* Notifications Modal */}
      <Modal
        visible={notificationsModalVisible}
        animationType="slide"
        presentationStyle="pageSheet"
        onRequestClose={() => setNotificationsModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>Notifications</Text>
            <TouchableOpacity onPress={() => setNotificationsModalVisible(false)}>
              <Icon name="close" size={24} color={colors.textPrimary} />
            </TouchableOpacity>
          </View>

          <View style={styles.settingsContent}>
            <View style={styles.settingItem}>
              <View style={styles.settingInfo}>
                <Text style={styles.settingLabel}>Daily Reminder</Text>
                <Text style={styles.settingDescription}>Get reminded to log your meals</Text>
              </View>
              <Switch
                value={notificationSettings.dailyReminder}
                onValueChange={(value) => {
                  const updated = { ...notificationSettings, dailyReminder: value };
                  saveNotificationSettings(updated);
                }}
                trackColor={{ false: colors.borderLight, true: colors.primaryLight }}
                thumbColor={notificationSettings.dailyReminder ? colors.primary : '#f4f3f4'}
              />
            </View>

            <View style={styles.settingItem}>
              <View style={styles.settingInfo}>
                <Text style={styles.settingLabel}>Insight Alerts</Text>
                <Text style={styles.settingDescription}>Notifications for new insights</Text>
              </View>
              <Switch
                value={notificationSettings.insightAlerts}
                onValueChange={(value) => {
                  const updated = { ...notificationSettings, insightAlerts: value };
                  saveNotificationSettings(updated);
                }}
                trackColor={{ false: colors.borderLight, true: colors.primaryLight }}
                thumbColor={notificationSettings.insightAlerts ? colors.primary : '#f4f3f4'}
              />
            </View>

            <View style={styles.settingItem}>
              <View style={styles.settingInfo}>
                <Text style={styles.settingLabel}>Weekly Report</Text>
                <Text style={styles.settingDescription}>Summary of your weekly progress</Text>
              </View>
              <Switch
                value={notificationSettings.weeklyReport}
                onValueChange={(value) => {
                  const updated = { ...notificationSettings, weeklyReport: value };
                  saveNotificationSettings(updated);
                }}
                trackColor={{ false: colors.borderLight, true: colors.primaryLight }}
                thumbColor={notificationSettings.weeklyReport ? colors.primary : '#f4f3f4'}
              />
            </View>
          </View>
        </View>
      </Modal>

      {/* Privacy Modal */}
      <Modal
        visible={privacyModalVisible}
        animationType="slide"
        presentationStyle="pageSheet"
        onRequestClose={() => setPrivacyModalVisible(false)}
      >
        <View style={styles.modalContainer}>
          <View style={styles.modalHeader}>
            <Text style={styles.modalTitle}>Privacy & Security</Text>
            <TouchableOpacity onPress={() => setPrivacyModalVisible(false)}>
              <Icon name="close" size={24} color={colors.textPrimary} />
            </TouchableOpacity>
          </View>

          <View style={styles.settingsContent}>
            <View style={styles.privacyInfo}>
              <Icon name="shield-checkmark" size={48} color={colors.success} />
              <Text style={styles.privacyTitle}>Your data is secure</Text>
              <Text style={styles.privacyDescription}>
                All your health data is encrypted and stored securely. We never share your personal information with third parties.
              </Text>
            </View>

            <TouchableOpacity
              style={styles.privacyLink}
              onPress={() => handleOpenLink('https://aureahealth.app/privacy')}
            >
              <Icon name="document-text-outline" size={20} color={colors.primary} />
              <Text style={styles.privacyLinkText}>Read our Privacy Policy</Text>
              <Icon name="chevron-forward" size={20} color={colors.textTertiary} />
            </TouchableOpacity>

            <TouchableOpacity
              style={styles.privacyLink}
              onPress={() => handleOpenLink('https://aureahealth.app/terms')}
            >
              <Icon name="reader-outline" size={20} color={colors.primary} />
              <Text style={styles.privacyLinkText}>Terms of Service</Text>
              <Icon name="chevron-forward" size={20} color={colors.textTertiary} />
            </TouchableOpacity>

            <TouchableOpacity
              style={[styles.privacyLink, styles.deleteAccountLink]}
              onPress={() => {
                Alert.alert(
                  'Delete Account',
                  'To delete your account, please contact support@aureahealth.app',
                  [{ text: 'OK' }]
                );
              }}
            >
              <Icon name="person-remove-outline" size={20} color={colors.error} />
              <Text style={[styles.privacyLinkText, { color: colors.error }]}>
                Delete Account
              </Text>
              <Icon name="chevron-forward" size={20} color={colors.textTertiary} />
            </TouchableOpacity>
          </View>
        </View>
      </Modal>
    </ScrollView>
  );
}

type MenuItemProps = {
  icon: string;
  iconBg: string;
  iconColor: string;
  label: string;
  subtitle: string;
  isLast?: boolean;
  onPress?: () => void;
};

function MenuItem({ icon, iconBg, iconColor, label, subtitle, isLast = false, onPress }: MenuItemProps) {
  return (
    <TouchableOpacity
      style={[styles.menuItem, isLast && styles.menuItemLast]}
      activeOpacity={0.7}
      onPress={onPress}
    >
      <View style={[styles.menuIcon, { backgroundColor: iconBg }]}>
        <Icon name={icon} size={20} color={iconColor} />
      </View>
      <View style={styles.menuContent}>
        <Text style={styles.menuLabel}>{label}</Text>
        <Text style={styles.menuSubtitle}>{subtitle}</Text>
      </View>
      <Icon name="chevron-forward" size={20} color={colors.textTertiary} />
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },

  // Profile Card
  profileCard: {
    margin: spacing.base,
    borderRadius: borderRadius.xl,
    overflow: 'hidden',
    ...shadows.lg,
  },
  profileGradient: {
    backgroundColor: colors.primary,
    padding: spacing.xl,
    alignItems: 'center',
  },
  avatarContainer: {
    position: 'relative',
    marginBottom: spacing.md,
  },
  avatar: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.white,
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 3,
    borderColor: 'rgba(255,255,255,0.3)',
  },
  avatarText: {
    fontSize: typography.fontSize['3xl'],
    fontWeight: typography.fontWeight.bold,
    color: colors.primary,
  },
  avatarBadge: {
    position: 'absolute',
    bottom: 2,
    right: 2,
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: colors.success,
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 2,
    borderColor: colors.primary,
  },
  userName: {
    fontSize: typography.fontSize.xl,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
    textTransform: 'capitalize',
  },
  userEmail: {
    fontSize: typography.fontSize.sm,
    color: 'rgba(255,255,255,0.8)',
    marginTop: spacing.xs,
  },
  statsRow: {
    flexDirection: 'row',
    marginTop: spacing.xl,
    backgroundColor: 'rgba(255,255,255,0.15)',
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    width: '100%',
  },
  statItem: {
    flex: 1,
    alignItems: 'center',
  },
  statNumber: {
    fontSize: typography.fontSize.xl,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
  },
  statLabel: {
    fontSize: typography.fontSize.xs,
    color: 'rgba(255,255,255,0.8)',
    marginTop: spacing.xs,
  },
  statDivider: {
    width: 1,
    backgroundColor: 'rgba(255,255,255,0.2)',
    marginHorizontal: spacing.sm,
  },

  // Quick Actions
  quickActions: {
    flexDirection: 'row',
    paddingHorizontal: spacing.base,
    marginBottom: spacing.lg,
    gap: spacing.sm,
  },
  quickAction: {
    flex: 1,
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    alignItems: 'center',
    ...shadows.sm,
  },
  quickActionIcon: {
    width: 44,
    height: 44,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.sm,
  },
  quickActionText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
  },

  // Sections
  section: {
    paddingHorizontal: spacing.base,
    marginBottom: spacing.lg,
  },
  sectionTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textSecondary,
    marginBottom: spacing.sm,
    marginLeft: spacing.xs,
  },
  menuCard: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    overflow: 'hidden',
    ...shadows.sm,
  },

  // Menu Items
  menuItem: {
    flexDirection: 'row',
    alignItems: 'center',
    padding: spacing.base,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  menuItemLast: {
    borderBottomWidth: 0,
  },
  menuIcon: {
    width: 40,
    height: 40,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
  },
  menuContent: {
    flex: 1,
    marginLeft: spacing.md,
  },
  menuLabel: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
  },
  menuSubtitle: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    marginTop: 2,
  },

  // Logout
  logoutButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.errorLight,
    marginHorizontal: spacing.base,
    paddingVertical: spacing.base,
    borderRadius: borderRadius.lg,
    gap: spacing.sm,
  },
  logoutText: {
    fontSize: typography.fontSize.base,
    color: colors.error,
    fontWeight: typography.fontWeight.semiBold,
  },

  // App Info
  appInfo: {
    alignItems: 'center',
    marginTop: spacing.xl,
    paddingBottom: spacing.base,
  },
  appLogo: {
    width: 32,
    height: 32,
    borderRadius: borderRadius.sm,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.sm,
  },
  appName: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textSecondary,
  },
  version: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    marginTop: spacing.xs,
  },

  // Modal Styles
  modalContainer: {
    flex: 1,
    backgroundColor: colors.background,
  },
  modalHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: spacing.base,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
    backgroundColor: colors.white,
  },
  modalTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
  },

  // Loading & Empty States
  loadingContainer: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  emptyState: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    padding: spacing.xl,
  },
  emptyText: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textSecondary,
    marginTop: spacing.md,
  },
  emptySubtext: {
    fontSize: typography.fontSize.sm,
    color: colors.textTertiary,
    marginTop: spacing.xs,
    textAlign: 'center',
  },

  // History Modal
  historyList: {
    padding: spacing.base,
  },
  historyItem: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.md,
    ...shadows.sm,
  },
  historyDate: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
    marginBottom: spacing.sm,
  },
  historyDateText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
  },
  historyIngredients: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.xs,
  },
  ingredientChip: {
    backgroundColor: colors.primaryBackground,
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs,
    borderRadius: borderRadius.full,
  },
  ingredientChipText: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
  },
  moreText: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    alignSelf: 'center',
  },
  symptomsSummary: {
    flexDirection: 'row',
    marginTop: spacing.sm,
    paddingTop: spacing.sm,
    borderTopWidth: 1,
    borderTopColor: colors.borderLight,
  },
  symptomsLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    fontWeight: typography.fontWeight.medium,
  },
  symptomsText: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
  },

  // Goals Modal
  addGoalForm: {
    padding: spacing.base,
    backgroundColor: colors.white,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  goalInput: {
    backgroundColor: colors.background,
    borderRadius: borderRadius.md,
    padding: spacing.md,
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
    marginBottom: spacing.sm,
  },
  goalTargetRow: {
    flexDirection: 'row',
    gap: spacing.sm,
  },
  goalTargetInput: {
    flex: 1,
    marginBottom: 0,
  },
  addGoalButton: {
    backgroundColor: colors.primary,
    width: 48,
    height: 48,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
  },
  goalsList: {
    padding: spacing.base,
  },
  goalItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.sm,
    ...shadows.sm,
  },
  goalCheckbox: {
    marginRight: spacing.md,
  },
  goalContent: {
    flex: 1,
  },
  goalTitle: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
  },
  goalCompleted: {
    textDecorationLine: 'line-through',
    color: colors.textTertiary,
  },
  goalTarget: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    marginTop: spacing.xs,
  },

  // Edit Profile Modal
  editProfileContent: {
    padding: spacing.xl,
    alignItems: 'center',
  },
  profileAvatarLarge: {
    width: 100,
    height: 100,
    borderRadius: 50,
    backgroundColor: colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.xl,
  },
  profileAvatarText: {
    fontSize: typography.fontSize['4xl'],
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
  },
  inputLabel: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.medium,
    color: colors.textSecondary,
    alignSelf: 'flex-start',
    marginBottom: spacing.xs,
    marginTop: spacing.md,
  },
  textInput: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.md,
    padding: spacing.md,
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
    width: '100%',
    borderWidth: 1,
    borderColor: colors.borderLight,
  },
  disabledInput: {
    backgroundColor: colors.background,
    borderRadius: borderRadius.md,
    padding: spacing.md,
    width: '100%',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  disabledInputText: {
    fontSize: typography.fontSize.base,
    color: colors.textTertiary,
  },
  saveButton: {
    backgroundColor: colors.primary,
    borderRadius: borderRadius.md,
    padding: spacing.base,
    width: '100%',
    alignItems: 'center',
    marginTop: spacing.xl,
  },
  saveButtonText: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.white,
  },

  // Settings Content
  settingsContent: {
    padding: spacing.base,
  },
  settingItem: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.sm,
    ...shadows.sm,
  },
  settingInfo: {
    flex: 1,
    marginRight: spacing.md,
  },
  settingLabel: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
  },
  settingDescription: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    marginTop: spacing.xs,
  },

  // Privacy Modal
  privacyInfo: {
    alignItems: 'center',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.xl,
    marginBottom: spacing.lg,
    ...shadows.sm,
  },
  privacyTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
    marginTop: spacing.md,
  },
  privacyDescription: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    textAlign: 'center',
    marginTop: spacing.sm,
    lineHeight: 20,
  },
  privacyLink: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    marginBottom: spacing.sm,
    ...shadows.sm,
  },
  privacyLinkText: {
    flex: 1,
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
    marginLeft: spacing.md,
  },
  deleteAccountLink: {
    marginTop: spacing.lg,
  },
});
