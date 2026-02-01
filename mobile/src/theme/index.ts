/**
 * Aurea Design System
 * Aligned with web PWA design for brand consistency
 */

export const colors = {
  // Primary Brand Colors (Teal)
  primary: '#14B8A6',
  primaryDark: '#0D9488',
  primaryLight: '#5EEAD4',
  primaryBackground: '#F0FDFA',

  // Secondary/Accent Colors
  accent: '#06B6D4', // Cyan
  accentLight: '#E0F7FA',

  // Semantic Colors
  success: '#10B981',
  successLight: '#D1FAE5',
  warning: '#F59E0B',
  warningLight: '#FEF3C7',
  error: '#EF4444',
  errorLight: '#FEE2E2',

  // Score Colors (for health scores)
  scoreHigh: '#10B981',    // Green - good
  scoreMedium: '#F59E0B',  // Orange - moderate
  scoreLow: '#EF4444',     // Red - concern

  // Category Badge Colors
  categoryDefault: '#F0FDFA',
  categorySweeteners: '#FEF3C7', // Amber/Orange background
  categorySweetenersText: '#D97706',
  categoryFatsOils: '#DBEAFE', // Blue background
  categoryFatsOilsText: '#2563EB',

  // Neutral Colors
  white: '#FFFFFF',
  background: '#F8FAFC',
  surface: '#FFFFFF',
  border: '#E2E8F0',
  borderLight: '#F1F5F9',

  // Text Colors
  textPrimary: '#1E293B',
  textSecondary: '#64748B',
  textTertiary: '#94A3B8',
  textInverse: '#FFFFFF',

  // Gradient Colors (for CTA sections)
  gradientStart: '#14B8A6',
  gradientEnd: '#06B6D4',
};

export const typography = {
  // Font Families (using system fonts, can be replaced with custom)
  fontFamily: {
    regular: 'System',
    medium: 'System',
    semiBold: 'System',
    bold: 'System',
  },

  // Font Sizes
  fontSize: {
    xs: 12,
    sm: 14,
    base: 16,
    lg: 18,
    xl: 20,
    '2xl': 24,
    '3xl': 30,
    '4xl': 36,
    '5xl': 48,
  },

  // Font Weights
  fontWeight: {
    regular: '400' as const,
    medium: '500' as const,
    semiBold: '600' as const,
    bold: '700' as const,
  },

  // Line Heights
  lineHeight: {
    tight: 1.25,
    normal: 1.5,
    relaxed: 1.75,
  },
};

export const spacing = {
  xs: 4,
  sm: 8,
  md: 12,
  base: 16,
  lg: 20,
  xl: 24,
  '2xl': 32,
  '3xl': 40,
  '4xl': 48,
  '5xl': 64,
};

export const borderRadius = {
  sm: 6,
  base: 8,
  md: 12,
  lg: 16,
  xl: 20,
  '2xl': 24,
  full: 9999,
};

export const shadows = {
  sm: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  base: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 4,
    elevation: 2,
  },
  md: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  lg: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.12,
    shadowRadius: 16,
    elevation: 8,
  },
};

// Helper function to get score color
export const getScoreColor = (score: number): string => {
  if (score >= 70) return colors.scoreHigh;
  if (score >= 40) return colors.scoreMedium;
  return colors.scoreLow;
};

// Helper function to get score background color
export const getScoreBackgroundColor = (score: number): string => {
  if (score >= 70) return colors.successLight;
  if (score >= 40) return colors.warningLight;
  return colors.errorLight;
};

// Helper function to get confidence level color
export const getConfidenceColor = (
  confidenceLevel: 'High' | 'Medium' | 'Low' | 'Emerging' | string
): string => {
  switch (confidenceLevel) {
    case 'High':
      return colors.success;
    case 'Medium':
      return colors.warning;
    case 'Low':
    case 'Emerging':
    default:
      return colors.textTertiary;
  }
};

// Helper function to get category badge colors
export const getCategoryColor = (
  category: string
): {backgroundColor: string; textColor: string} => {
  const normalizedCategory = category?.toLowerCase().replace(/[_\s&]+/g, '') || '';

  if (normalizedCategory.includes('sweetener')) {
    return {
      backgroundColor: colors.categorySweeteners,
      textColor: colors.categorySweetenersText,
    };
  }

  if (normalizedCategory.includes('fat') || normalizedCategory.includes('oil')) {
    return {
      backgroundColor: colors.categoryFatsOils,
      textColor: colors.categoryFatsOilsText,
    };
  }

  // Default category color
  return {
    backgroundColor: colors.categoryDefault,
    textColor: colors.primary,
  };
};

export default {
  colors,
  typography,
  spacing,
  borderRadius,
  shadows,
  getScoreColor,
  getScoreBackgroundColor,
  getConfidenceColor,
  getCategoryColor,
};
