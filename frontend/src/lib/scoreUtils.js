/**
 * Score utility functions for ingredient health scoring.
 * Based on Aurea design system specifications.
 */

// Score color thresholds from design tokens
const SCORE_COLORS = {
  excellent: '#10B981', // 90-100
  good: '#84CC16',      // 70-89
  moderate: '#F59E0B',  // 50-69
  concerning: '#EF9B54', // 30-49
  highRisk: '#DC2626',  // 0-29
};

// Simplified 3-tier score colors (as per new requirements)
const SCORE_COLORS_SIMPLE = {
  good: '#22C55E',      // 70-100 Green
  moderate: '#EAB308',  // 40-69 Yellow
  caution: '#EF4444',   // 0-39 Red
};

// Confidence level colors
const CONFIDENCE_COLORS = {
  high: '#22C55E',      // Green
  medium: '#3B82F6',    // Blue
  low: '#EAB308',       // Yellow
  emerging: '#9333EA',  // Purple
};

/**
 * Get the color for a given score.
 * @param {number} score - Score from 0-100
 * @returns {string} Hex color code
 */
export const getScoreColor = (score) => {
  if (score >= 90) return SCORE_COLORS.excellent;
  if (score >= 70) return SCORE_COLORS.good;
  if (score >= 50) return SCORE_COLORS.moderate;
  if (score >= 30) return SCORE_COLORS.concerning;
  return SCORE_COLORS.highRisk;
};

/**
 * Get a human-readable label for a score.
 * @param {number} score - Score from 0-100
 * @returns {string} Label like "Excellent", "Good", etc.
 */
export const getScoreLabel = (score) => {
  if (score >= 90) return 'Excellent';
  if (score >= 70) return 'Good';
  if (score >= 50) return 'Moderate';
  if (score >= 30) return 'Concerning';
  return 'High Risk';
};

/**
 * Get risk level based on overall score.
 * @param {number} score - Score from 0-100
 * @returns {string} Risk level description
 */
export const getRiskLevel = (score) => {
  if (score >= 70) return 'Low Concern';
  if (score >= 50) return 'Moderate Concern';
  return 'High Concern';
};

/**
 * Get CSS class name for score-based styling.
 * @param {number} score - Score from 0-100
 * @returns {string} CSS class name
 */
export const getScoreClass = (score) => {
  if (score >= 90) return 'score-excellent';
  if (score >= 70) return 'score-good';
  if (score >= 50) return 'score-moderate';
  if (score >= 30) return 'score-concerning';
  return 'score-high-risk';
};

/**
 * Get gradient for score bar.
 * Uses the 5-color gradient from design system.
 */
export const SCORE_BAR_GRADIENT = 'linear-gradient(90deg, #F87171, #FB923C, #FBBF24, #A3E635, #34D399)';

/**
 * Design token colors for reference.
 */
export const DESIGN_TOKENS = {
  brandGreen: '#2D7D5E',
  brandGreenDark: '#246047',
  brandGreenLight: '#E0F0EC',
  warmBeige: '#E8DCC8',
  cream: '#F5F3F0',
  textPrimary: '#1F2937',
  textSecondary: '#6B7280',
  textMuted: '#9CA3AF',
  border: '#E5E7EB',
};

/**
 * Get simplified 3-tier score color.
 * @param {number} score - Score from 0-100
 * @returns {string} Hex color code
 */
export const getSimpleScoreColor = (score) => {
  if (score >= 70) return SCORE_COLORS_SIMPLE.good;
  if (score >= 40) return SCORE_COLORS_SIMPLE.moderate;
  return SCORE_COLORS_SIMPLE.caution;
};

/**
 * Get simplified 3-tier score label.
 * @param {number} score - Score from 0-100
 * @returns {string} Label like "Good", "Moderate", "Caution"
 */
export const getSimpleScoreLabel = (score) => {
  if (score >= 70) return 'Good';
  if (score >= 40) return 'Moderate';
  return 'Caution';
};

/**
 * Get confidence level color.
 * @param {string} level - Confidence level (high, medium, low, emerging)
 * @returns {string} Hex color code
 */
export const getConfidenceColor = (level) => {
  const normalized = (level || '').toLowerCase();
  return CONFIDENCE_COLORS[normalized] || CONFIDENCE_COLORS.low;
};

/**
 * Get confidence level background color (lighter version).
 * @param {string} level - Confidence level
 * @returns {string} Hex color code for background
 */
export const getConfidenceBackgroundColor = (level) => {
  const normalized = (level || '').toLowerCase();
  const bgColors = {
    high: '#DCFCE7',      // Light green
    medium: '#DBEAFE',    // Light blue
    low: '#FEF9C3',       // Light yellow
    emerging: '#F3E8FF',  // Light purple
  };
  return bgColors[normalized] || bgColors.low;
};

/**
 * Format confidence level for display.
 * @param {string} level - Confidence level
 * @returns {string} Formatted label
 */
export const formatConfidenceLevel = (level) => {
  if (!level) return 'Unknown';
  return level.charAt(0).toUpperCase() + level.slice(1).toLowerCase();
};

/**
 * Get Tailwind CSS classes for score-based text color.
 * @param {number} score - Score from 0-100
 * @returns {string} Tailwind class string
 */
export const getScoreTailwindColor = (score) => {
  if (score == null) return 'text-gray-400';
  if (score >= 70) return 'text-green-600';
  if (score >= 40) return 'text-amber-500';
  return 'text-red-500';
};

/**
 * Get Tailwind CSS classes for score-based background color.
 * @param {number} score - Score from 0-100
 * @returns {string} Tailwind class string
 */
export const getScoreTailwindBg = (score) => {
  if (score == null) return 'bg-gray-100';
  if (score >= 70) return 'bg-green-100';
  if (score >= 40) return 'bg-amber-100';
  return 'bg-red-100';
};

/**
 * Category colors for ingredient badges.
 */
export const CATEGORY_COLORS = {
  'sweeteners': { color: '#9333EA', bgColor: '#F3E8FF', label: 'Sweeteners' },
  'fats_oils': { color: '#0891B2', bgColor: '#CFFAFE', label: 'Fats & Oils' },
  'fats & oils': { color: '#0891B2', bgColor: '#CFFAFE', label: 'Fats & Oils' },
  'preservatives': { color: '#DC2626', bgColor: '#FEE2E2', label: 'Preservatives' },
  'emulsifiers': { color: '#D97706', bgColor: '#FEF3C7', label: 'Emulsifiers' },
  'colorings': { color: '#DB2777', bgColor: '#FCE7F3', label: 'Colorings' },
  'flavor_enhancers': { color: '#7C3AED', bgColor: '#EDE9FE', label: 'Flavor Enhancers' },
  'flavor enhancers': { color: '#7C3AED', bgColor: '#EDE9FE', label: 'Flavor Enhancers' },
  'thickeners': { color: '#0D9488', bgColor: '#CCFBF1', label: 'Thickeners' },
  'proteins': { color: '#EA580C', bgColor: '#FFEDD5', label: 'Proteins' },
  'fiber_prebiotics': { color: '#16A34A', bgColor: '#DCFCE7', label: 'Fiber & Prebiotics' },
  'fiber & prebiotics': { color: '#16A34A', bgColor: '#DCFCE7', label: 'Fiber & Prebiotics' },
  'dairy': { color: '#2563EB', bgColor: '#DBEAFE', label: 'Dairy' },
  'grains': { color: '#CA8A04', bgColor: '#FEF9C3', label: 'Grains' },
  'vegetables': { color: '#15803D', bgColor: '#DCFCE7', label: 'Vegetables' },
  'fruits': { color: '#E11D48', bgColor: '#FFE4E6', label: 'Fruits' },
  'nuts_seeds': { color: '#A16207', bgColor: '#FEF3C7', label: 'Nuts & Seeds' },
  'nuts & seeds': { color: '#A16207', bgColor: '#FEF3C7', label: 'Nuts & Seeds' },
  'legumes': { color: '#65A30D', bgColor: '#ECFCCB', label: 'Legumes' },
  'additives': { color: '#6366F1', bgColor: '#E0E7FF', label: 'Additives' },
  'beverages': { color: '#06B6D4', bgColor: '#CFFAFE', label: 'Beverages' },
  'default': { color: '#6B7280', bgColor: '#F3F4F6', label: 'Other' },
};

/**
 * Get category styling.
 * @param {string} category - Category name
 * @returns {Object} Object with color, bgColor, and label
 */
export const getCategoryStyle = (category) => {
  if (!category) return CATEGORY_COLORS.default;
  const key = category.toLowerCase().replace(/[_\s]+/g, '_');
  // Check for exact match first
  if (CATEGORY_COLORS[key]) return CATEGORY_COLORS[key];
  // Check for space-separated version
  const spaceKey = category.toLowerCase();
  if (CATEGORY_COLORS[spaceKey]) return CATEGORY_COLORS[spaceKey];
  return CATEGORY_COLORS.default;
};

/**
 * Format category name for display.
 * @param {string} category - Raw category name
 * @returns {string} Formatted category name
 */
export const formatCategoryName = (category) => {
  if (!category) return 'Uncategorized';
  // Check if we have a predefined label
  const style = getCategoryStyle(category);
  if (style.label && style.label !== 'Other') return style.label;
  // Otherwise format the string
  return category
    .replace(/_/g, ' ')
    .replace(/\b\w/g, (c) => c.toUpperCase());
};

/**
 * Health category metadata.
 */
export const HEALTH_CATEGORIES = {
  blood_sugar: {
    key: 'blood_sugar',
    label: 'Blood Sugar Impact',
    shortLabel: 'Blood Sugar',
    icon: 'activity',
    description: 'How this ingredient affects blood glucose levels and insulin response',
    inverted: false,
  },
  inflammation: {
    key: 'inflammation',
    label: 'Anti-inflammatory Score',
    shortLabel: 'Anti-inflammatory',
    icon: 'flame',
    description: 'Higher score indicates less inflammatory potential',
    inverted: true, // DB stores inflammation potential (higher = more inflammatory)
  },
  gut_impact: {
    key: 'gut_impact',
    label: 'Gut Health Impact',
    shortLabel: 'Gut Health',
    icon: 'heart',
    description: 'Effect on digestive health and gut microbiome balance',
    inverted: false,
  },
  disease_links: {
    key: 'disease_links',
    label: 'Disease Risk Profile',
    shortLabel: 'Disease Risk',
    icon: 'shield',
    description: 'Association with chronic disease risk based on research',
    inverted: false,
  },
  hormonal: {
    key: 'hormonal',
    label: 'Hormonal Impact',
    shortLabel: 'Hormonal',
    icon: 'zap',
    description: 'Potential effects on hormonal balance and endocrine function',
    inverted: false,
  },
};

/**
 * Transform inflammation score for display.
 * In the DB, higher = more inflammatory, but we want to show
 * "Anti-inflammatory Score" where higher = better.
 * @param {number} dbScore - Score from database (0-100, higher = more inflammatory)
 * @returns {number} Display score (0-100, higher = less inflammatory)
 */
export const transformInflammationScore = (dbScore) => {
  if (dbScore == null) return null;
  return 100 - dbScore;
};

/**
 * Get inverted score bar gradient (for inflammation display).
 * Shows green on left (good) and red on right (bad).
 */
export const INVERTED_SCORE_BAR_GRADIENT = 'linear-gradient(90deg, #EF4444, #FB923C, #FBBF24, #A3E635, #34D399)';

export default {
  getScoreColor,
  getScoreLabel,
  getRiskLevel,
  getScoreClass,
  getSimpleScoreColor,
  getSimpleScoreLabel,
  getConfidenceColor,
  getConfidenceBackgroundColor,
  formatConfidenceLevel,
  getScoreTailwindColor,
  getScoreTailwindBg,
  getCategoryStyle,
  formatCategoryName,
  transformInflammationScore,
  SCORE_BAR_GRADIENT,
  INVERTED_SCORE_BAR_GRADIENT,
  DESIGN_TOKENS,
  CATEGORY_COLORS,
  HEALTH_CATEGORIES,
};
