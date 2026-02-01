import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Alert,
} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';
import { useAuth } from '../hooks/useAuth';
import { colors, typography, spacing, borderRadius } from '../theme';

export default function ProfileScreen() {
  const { user, logout } = useAuth();

  const handleLogout = () => {
    Alert.alert('Logout', 'Are you sure you want to log out?', [
      { text: 'Cancel', style: 'cancel' },
      { text: 'Logout', style: 'destructive', onPress: logout },
    ]);
  };

  return (
    <ScrollView style={styles.container}>
      {/* Profile Header */}
      <View style={styles.header}>
        <View style={styles.avatar}>
          <Icon name="person" size={40} color={colors.primary} />
        </View>
        <Text style={styles.email}>{user?.email}</Text>
      </View>

      {/* Settings Sections */}
      <View style={styles.section}>
        <Text style={styles.sectionTitle}>ACCOUNT</Text>

        <MenuItem icon="person-outline" label="Edit Profile" />
        <MenuItem icon="notifications-outline" label="Notifications" />
        <MenuItem icon="shield-outline" label="Privacy" isLast />
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>DATA</Text>

        <MenuItem icon="download-outline" label="Export Data" />
        <MenuItem icon="trash-outline" label="Delete All Logs" isLast />
      </View>

      <View style={styles.section}>
        <Text style={styles.sectionTitle}>SUPPORT</Text>

        <MenuItem icon="help-circle-outline" label="Help Center" />
        <MenuItem icon="chatbubble-outline" label="Contact Us" />
        <MenuItem icon="document-text-outline" label="Terms of Service" isLast />
      </View>

      {/* Logout Button */}
      <TouchableOpacity style={styles.logoutButton} onPress={handleLogout}>
        <Icon name="log-out-outline" size={22} color={colors.error} />
        <Text style={styles.logoutText}>Log Out</Text>
      </TouchableOpacity>

      {/* App Version */}
      <Text style={styles.version}>Aurea v1.0.0</Text>

      <View style={{ height: 40 }} />
    </ScrollView>
  );
}

function MenuItem({
  icon,
  label,
  isLast = false,
}: {
  icon: string;
  label: string;
  isLast?: boolean;
}) {
  return (
    <TouchableOpacity style={[styles.menuItem, isLast && styles.menuItemLast]}>
      <Icon name={icon} size={22} color={colors.textSecondary} />
      <Text style={styles.menuText}>{label}</Text>
      <Icon name="chevron-forward" size={20} color={colors.textTertiary} />
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    backgroundColor: colors.white,
    alignItems: 'center',
    paddingVertical: spacing['2xl'],
    marginBottom: spacing.base,
  },
  avatar: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.md,
  },
  email: {
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
  },
  section: {
    backgroundColor: colors.white,
    marginBottom: spacing.base,
    paddingVertical: spacing.sm,
  },
  sectionTitle: {
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textTertiary,
    textTransform: 'uppercase',
    paddingHorizontal: spacing.base,
    paddingVertical: spacing.sm,
    letterSpacing: 0.5,
  },
  menuItem: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: spacing.md,
    paddingHorizontal: spacing.base,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  menuItemLast: {
    borderBottomWidth: 0,
  },
  menuText: {
    flex: 1,
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
    marginLeft: spacing.md,
  },
  logoutButton: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.white,
    paddingVertical: spacing.base,
    marginHorizontal: spacing.base,
    borderRadius: borderRadius.md,
    gap: spacing.sm,
  },
  logoutText: {
    fontSize: typography.fontSize.base,
    color: colors.error,
    fontWeight: typography.fontWeight.semiBold,
  },
  version: {
    textAlign: 'center',
    color: colors.textTertiary,
    fontSize: typography.fontSize.xs,
    marginTop: spacing.xl,
  },
});
