import React from 'react';
import { View, StyleSheet, ViewStyle } from 'react-native';
import { colors, borderRadius, shadows, spacing } from '../theme';

interface CardProps {
  children: React.ReactNode;
  variant?: 'elevated' | 'outlined' | 'filled';
  padding?: 'none' | 'sm' | 'md' | 'lg';
  style?: ViewStyle;
}

export const Card: React.FC<CardProps> = ({
  children,
  variant = 'elevated',
  padding = 'md',
  style,
}) => {
  const getCardStyle = (): ViewStyle => {
    const baseStyle: ViewStyle = {
      ...styles.base,
      ...styles[`padding_${padding}`],
    };

    switch (variant) {
      case 'elevated':
        return {
          ...baseStyle,
          backgroundColor: colors.white,
          ...shadows.base,
        };
      case 'outlined':
        return {
          ...baseStyle,
          backgroundColor: colors.white,
          borderWidth: 1,
          borderColor: colors.border,
        };
      case 'filled':
        return {
          ...baseStyle,
          backgroundColor: colors.background,
        };
      default:
        return baseStyle;
    }
  };

  return (
    <View style={[getCardStyle(), style]}>
      {children}
    </View>
  );
};

const styles = StyleSheet.create({
  base: {
    borderRadius: borderRadius.lg,
  },
  padding_none: {
    padding: 0,
  },
  padding_sm: {
    padding: spacing.md,
  },
  padding_md: {
    padding: spacing.base,
  },
  padding_lg: {
    padding: spacing.xl,
  },
});

export default Card;
