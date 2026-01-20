import { clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

// Merge Tailwind classes with clsx
export function cn(...inputs) {
  return twMerge(clsx(inputs));
}

// Format date for display
export function formatDate(date) {
  return new Date(date).toLocaleDateString('en-US', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  });
}

// Format date for API (YYYY-MM-DD)
export function formatDateForApi(date) {
  return new Date(date).toISOString().split('T')[0];
}

// Get today's date in YYYY-MM-DD format
export function getToday() {
  return formatDateForApi(new Date());
}

// Score color based on value (0-100)
export function getScoreColor(score) {
  if (score >= 70) return 'text-green-600';
  if (score >= 40) return 'text-yellow-600';
  return 'text-red-600';
}

// Score background color based on value
export function getScoreBgColor(score) {
  if (score >= 70) return 'bg-green-100';
  if (score >= 40) return 'bg-yellow-100';
  return 'bg-red-100';
}

// Symptom labels
export const SYMPTOM_LABELS = {
  energy: 'Energy Level',
  bloating: 'Bloating',
  focus: 'Mental Focus',
  mood: 'Mood',
  sleep: 'Sleep Quality',
};

// Cycle phases
export const CYCLE_PHASES = [
  { value: '', label: 'Not tracking / N/A' },
  { value: 'menstruation', label: 'Menstruation' },
  { value: 'follicular', label: 'Follicular' },
  { value: 'ovulation', label: 'Ovulation' },
  { value: 'luteal', label: 'Luteal' },
];

// Debounce function for search
export function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}
