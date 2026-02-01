import React from 'react';
import { View, Text, StyleSheet, ViewStyle } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';
import { colors, typography, spacing, borderRadius, shadows } from '../theme';

interface FeatureCardProps {
  icon: string;
  iconColor?: string;
  iconBackgroundColor?: string;
  title: string;
  description: string;
  style?: ViewStyle;
}

export const FeatureCard: React.FC<FeatureCardProps> = ({
  icon,
  iconColor = colors.primary,
  iconBackgroundColor = colors.primaryBackground,
  title,
  description,
  style,
}) => {
  return (
    <View style={[styles.container, style]}>
      <View style={[styles.iconContainer, { backgroundColor: iconBackgroundColor }]}>
        <Icon name={icon} size={24} color={iconColor} />
      </View>
      <Text style={styles.title}>{title}</Text>
      <Text style={styles.description}>{description}</Text>
    </View>
  );
};

interface NumberedStepProps {
  number: number;
  title: string;
  description: string;
  color?: string;
  style?: ViewStyle;
}

export const NumberedStep: React.FC<NumberedStepProps> = ({
  number,
  title,
  description,
  color = colors.primary,
  style,
}) => {
  return (
    <View style={[styles.stepContainer, style]}>
      <View style={[styles.numberCircle, { backgroundColor: `${color}15` }]}>
        <Text style={[styles.numberText, { color }]}>{number}</Text>
      </View>
      <Text style={styles.stepTitle}>{title}</Text>
      <Text style={styles.stepDescription}>{description}</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.lg,
    ...shadows.base,
  },
  iconContainer: {
    width: 48,
    height: 48,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.md,
  },
  title: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.sm,
  },
  description: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    lineHeight: typography.fontSize.sm * typography.lineHeight.relaxed,
  },
  // Numbered Step styles
  stepContainer: {
    alignItems: 'center',
    flex: 1,
  },
  numberCircle: {
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.md,
  },
  numberText: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
  },
  stepTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.xs,
    textAlign: 'center',
  },
  stepDescription: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: typography.fontSize.xs * typography.lineHeight.relaxed,
  },
});

export default FeatureCard;
