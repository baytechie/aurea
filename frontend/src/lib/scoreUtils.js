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

export default {
  getScoreColor,
  getScoreLabel,
  getRiskLevel,
  getScoreClass,
  SCORE_BAR_GRADIENT,
  DESIGN_TOKENS,
};
