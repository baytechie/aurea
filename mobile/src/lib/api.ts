import axios, {AxiosError} from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';
import {Platform} from 'react-native';

// API Configuration
// Production: https://api.aureahealth.app
// Development: Local backend at port 8000
//
// Note: iOS Simulator uses Mac's localhost, Android Emulator uses 10.0.2.2
const getDevApiUrl = () => {
  if (Platform.OS === 'android') {
    return 'http://10.0.2.2:8000'; // Android emulator localhost alias
  }
  return 'http://127.0.0.1:8000'; // iOS simulator uses Mac's localhost
};

// Set to true to use production API even in development
const USE_PRODUCTION_API = true;

const API_BASE_URL = __DEV__ && !USE_PRODUCTION_API
  ? getDevApiUrl()
  : 'https://api.aureahealth.app';

const api = axios.create({
  baseURL: API_BASE_URL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Add auth token to requests
api.interceptors.request.use(async config => {
  const token = await AsyncStorage.getItem('auth_token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

// Handle auth errors
api.interceptors.response.use(
  response => response,
  async (error: AxiosError) => {
    if (error.response?.status === 401) {
      await AsyncStorage.removeItem('auth_token');
    }
    return Promise.reject(error);
  },
);

// Types
export interface User {
  user_id: string;
  email: string;
  name?: string;
  cycle_enabled?: boolean;
}

export interface AuthResponse {
  user_id: string;
  email: string;
  token: string;
}

// Health score detail with confidence information
export interface HealthScoreDetail {
  score: number;
  confidence: number;
  confidence_level: 'High' | 'Medium' | 'Low' | 'Emerging';
  description: string;
}

// Nested health scores object
export interface HealthScores {
  blood_sugar: HealthScoreDetail;
  inflammation: HealthScoreDetail;
  gut_impact: HealthScoreDetail;
  disease_links: HealthScoreDetail;
  hormonal: HealthScoreDetail;
}

export interface IngredientScore {
  name: string;
  blood_sugar_impact: number;
  inflammation_potential: number;
  gut_impact: number;
  overall_score: number;
  // New fields from enhanced API
  category?: string;
  is_trusted?: number; // 1 = researched, 0 = public sources
  disease_links?: number;
  // Detailed breakdown for each health category
  blood_sugar_details?: HealthScoreDetail;
  inflammation_details?: HealthScoreDetail;
  gut_impact_details?: HealthScoreDetail;
  disease_links_details?: HealthScoreDetail;
  // Nested health scores object (alternative structure)
  health_scores?: HealthScores;
  hormonal_relevance: {
    score: number;
    confidence?: number;
    confidence_level?: 'High' | 'Medium' | 'Low' | 'Emerging';
    insulin_impact: string;
    estrogen_impact: string;
    cortisol_impact: string;
    details: string;
    description?: string;
  };
  evidence_confidence: 'high' | 'medium' | 'low';
  sources: Array<{name: string; url?: string}>;
}

export interface DailyLog {
  id: string;
  date: string;
  ingredients: string[];
  symptoms: {
    energy: number;
    bloating: number;
    focus: number;
    mood: number;
    sleep: number;
  };
  cycle_phase?: string;
}

export interface Insight {
  top_triggers: Array<{
    ingredient: string;
    correlation: number;
    affected_symptoms: string[];
  }>;
  phase_analysis: Record<string, any>;
  lag_analysis: Record<string, any>;
  recommendations: string[];
}

// Search parameters
export interface IngredientSearchParams {
  q: string;
  limit?: number;
  category?: string;
  sort_by?: 'name' | 'overall_score' | 'blood_sugar' | 'inflammation' | 'gut_impact';
}

// Category response
export interface CategoryInfo {
  name: string;
  count: number;
}

// Auth API
export const authApi = {
  login: async (email: string, password: string): Promise<AuthResponse> => {
    const response = await api.post('/auth/login', {email, password});
    return response.data;
  },

  signup: async (email: string, password: string): Promise<AuthResponse> => {
    const response = await api.post('/auth/signup', {email, password});
    return response.data;
  },

  getProfile: async (): Promise<User> => {
    const response = await api.get('/users/me');
    return response.data;
  },

  updateProfile: async (data: Partial<User>): Promise<User> => {
    const response = await api.patch('/users/me', data);
    return response.data;
  },
};

// Ingredients API
export const ingredientsApi = {
  search: async (
    query: string,
    options?: {category?: string; sort_by?: string; limit?: number}
  ): Promise<IngredientScore[]> => {
    const params: Record<string, any> = {q: query, limit: options?.limit || 20};
    if (options?.category) {
      params.category = options.category;
    }
    if (options?.sort_by) {
      params.sort_by = options.sort_by;
    }
    const response = await api.get(`/ingredient/search`, {params});
    // API returns {results: [...], total: N} with ingredient_name field
    // Map to expected format with name field
    const results = response.data.results || [];
    return results.map((item: any) => ({
      ...item,
      name: item.ingredient_name || item.name,
    }));
  },

  getIngredient: async (name: string): Promise<IngredientScore> => {
    const response = await api.get(`/ingredient/${encodeURIComponent(name)}`);
    return response.data;
  },

  getIngredientsList: async (options?: {
    category?: string;
    sort_by?: string;
    limit?: number;
    offset?: number;
  }): Promise<{results: IngredientScore[]; total: number}> => {
    const params: Record<string, any> = {};
    if (options?.category) {
      params.category = options.category;
    }
    if (options?.sort_by) {
      params.sort_by = options.sort_by;
    }
    if (options?.limit) {
      params.limit = options.limit;
    }
    if (options?.offset) {
      params.offset = options.offset;
    }
    const response = await api.get('/ingredients', {params});
    const results = (response.data.results || []).map((item: any) => ({
      ...item,
      name: item.ingredient_name || item.name,
    }));
    return {results, total: response.data.total || results.length};
  },

  getCategories: async (): Promise<CategoryInfo[]> => {
    const response = await api.get('/ingredients/categories');
    return response.data.categories || response.data || [];
  },
};

// Logs API
export const logsApi = {
  getLogs: async (): Promise<DailyLog[]> => {
    const response = await api.get('/logs');
    return response.data;
  },

  getLogByDate: async (date: string): Promise<DailyLog> => {
    const response = await api.get(`/logs/${date}`);
    return response.data;
  },

  createLog: async (data: {
    ingredients: string[];
    symptoms: Record<string, number>;
    cycle_phase?: string;
    date?: string;
  }): Promise<DailyLog> => {
    const response = await api.post('/logs', data);
    return response.data;
  },

  deleteLog: async (logId: string): Promise<void> => {
    await api.delete(`/logs/${logId}`);
  },
};

// Insights API
export const insightsApi = {
  getInsights: async (): Promise<Insight> => {
    const response = await api.get('/insights');
    return response.data;
  },
};

// Predictions API
export const predictionsApi = {
  predict: async (data: {
    ingredients: string[];
    cycle_phase?: string;
  }): Promise<{
    bloating_probability: number;
    confidence: string;
    interpretation: string;
  }> => {
    const response = await api.post('/predictions', data);
    return response.data;
  },
};

export default api;
