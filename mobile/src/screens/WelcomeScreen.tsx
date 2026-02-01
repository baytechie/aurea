import React from 'react';
import {
  View,
  Text,
  StyleSheet,
  SafeAreaView,
  Dimensions,
} from 'react-native';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';
import { RootStackParamList } from '../navigation/RootNavigator';
import Icon from 'react-native-vector-icons/Ionicons';
import { colors, typography, spacing, borderRadius } from '../theme';
import { Button } from '../components';

type Props = {
  navigation: NativeStackNavigationProp<RootStackParamList, 'Welcome'>;
};

const { height } = Dimensions.get('window');

export default function WelcomeScreen({ navigation }: Props) {
  return (
    <SafeAreaView style={styles.container}>
      <View style={styles.content}>
        {/* Header Logo */}
        <View style={styles.header}>
          <View style={styles.logoRow}>
            <View style={styles.logoIcon}>
              <Icon name="leaf" size={20} color={colors.primary} />
            </View>
            <Text style={styles.logoText}>Aurea</Text>
          </View>
        </View>

        {/* Hero Section */}
        <View style={styles.hero}>
          <View style={styles.badge}>
            <Icon name="flash" size={12} color={colors.primary} />
            <Text style={styles.badgeText}>AI-Powered Health Insights</Text>
          </View>

          <Text style={styles.heroTitle}>
            Discover What Your{'\n'}
            <Text style={styles.heroTitleAccent}>Ingredients</Text>
            {'\n'}Really Do
          </Text>

          <Text style={styles.heroSubtitle}>
            Track what you eat and get personalized insights to feel your best.
          </Text>
        </View>

        {/* Features - Simple List */}
        <View style={styles.features}>
          <FeatureRow icon="search-outline" text="Search any ingredient" />
          <FeatureRow icon="pulse-outline" text="Track your symptoms daily" />
          <FeatureRow icon="sparkles-outline" text="Get AI-powered insights" />
        </View>

        {/* CTA Section */}
        <View style={styles.ctaSection}>
          <Button
            title="Get Started"
            onPress={() => navigation.navigate('Signup')}
            variant="primary"
            size="lg"
            showArrow
            style={styles.primaryButton}
            accessibilityLabel="Get started"
            accessibilityHint="Create a new account"
          />

          <Button
            title="I already have an account"
            onPress={() => navigation.navigate('Login')}
            variant="ghost"
            size="md"
            accessibilityLabel="Log in"
            accessibilityHint="Go to login screen"
          />
        </View>
      </View>
    </SafeAreaView>
  );
}

// Simple Feature Row Component
function FeatureRow({ icon, text }: { icon: string; text: string }) {
  return (
    <View style={styles.featureRow}>
      <View style={styles.featureIconCircle}>
        <Icon name={icon} size={18} color={colors.primary} />
      </View>
      <Text style={styles.featureText}>{text}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.white,
  },
  content: {
    flex: 1,
    paddingHorizontal: spacing.xl,
    justifyContent: 'space-between',
  },

  // Header
  header: {
    paddingTop: spacing.lg,
  },
  logoRow: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  logoIcon: {
    width: 36,
    height: 36,
    borderRadius: borderRadius.md,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: spacing.sm,
  },
  logoText: {
    fontSize: typography.fontSize.xl,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
  },

  // Hero
  hero: {
    alignItems: 'center',
    paddingVertical: spacing['2xl'],
  },
  badge: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.primaryBackground,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.full,
    marginBottom: spacing.xl,
  },
  badgeText: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
    marginLeft: spacing.xs,
  },
  heroTitle: {
    fontSize: height > 700 ? 38 : 32,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
    textAlign: 'center',
    lineHeight: height > 700 ? 48 : 40,
    marginBottom: spacing.lg,
  },
  heroTitleAccent: {
    color: colors.primary,
  },
  heroSubtitle: {
    fontSize: typography.fontSize.base,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: typography.fontSize.base * typography.lineHeight.relaxed,
    maxWidth: 280,
  },

  // Features
  features: {
    gap: spacing.base,
    paddingVertical: spacing.lg,
  },
  featureRow: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  featureIconCircle: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: spacing.md,
  },
  featureText: {
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
    fontWeight: typography.fontWeight.medium,
  },

  // CTA Section
  ctaSection: {
    paddingBottom: spacing['3xl'],
    gap: spacing.md,
  },
  primaryButton: {
    width: '100%',
  },
});
