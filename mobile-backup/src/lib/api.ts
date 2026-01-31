import axios, {AxiosError} from 'axios';
import AsyncStorage from '@react-native-async-storage/async-storage';

// Configure base URL - update this for production
const API_BASE_URL = __DEV__
  ? 'http://localhost:8000'
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

export interface IngredientScore {
  name: string;
  blood_sugar_impact: number;
  inflammation_potential: number;
  gut_impact: number;
  overall_score: number;
  hormonal_relevance: {
    score: number;
    insulin_impact: string;
    estrogen_impact: string;
    cortisol_impact: string;
    details: string;
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
  search: async (query: string): Promise<IngredientScore[]> => {
    const response = await api.get(`/ingredient/search`, {
      params: {q: query, limit: 20},
    });
    return response.data;
  },

  getIngredient: async (name: string): Promise<IngredientScore> => {
    const response = await api.get(`/ingredient/${encodeURIComponent(name)}`);
    return response.data;
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
