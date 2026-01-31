import axios from 'axios';

// API base URL from environment variable
const API_BASE_URL = import.meta.env.VITE_API_URL || 'https://api.aureahealth.app';

// Create axios instance with default config
const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Request interceptor to add auth token
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('aurea_token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor for error handling
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('aurea_token');
      localStorage.removeItem('aurea_user');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

// Auth API
export const authApi = {
  signup: async (email, password) => {
    const response = await api.post('/auth/signup', { email, password });
    return response.data;
  },

  login: async (email, password) => {
    const response = await api.post('/auth/login', { email, password });
    return response.data;
  },

  logout: () => {
    localStorage.removeItem('aurea_token');
    localStorage.removeItem('aurea_user');
  },
};

// Ingredient API
export const ingredientApi = {
  // Get full ingredient score
  getScore: async (name) => {
    const response = await api.get(`/ingredient/${encodeURIComponent(name)}`);
    return response.data;
  },

  // Autocomplete search
  search: async (query, limit = 10) => {
    const response = await api.get('/ingredient/search', {
      params: { q: query, limit }
    });
    return response.data;
  },
};

// Logs API
export const logsApi = {
  create: async (data) => {
    const response = await api.post('/logs', data);
    return response.data;
  },

  getAll: async () => {
    const response = await api.get('/logs');
    return response.data;
  },

  getByDate: async (date) => {
    const response = await api.get(`/logs/${date}`);
    return response.data;
  },

  delete: async (logId) => {
    const response = await api.delete(`/logs/${logId}`);
    return response.data;
  },
};

// Predictions API
export const predictionsApi = {
  getAll: async () => {
    const response = await api.get('/predictions');
    return response.data;
  },

  create: async (data) => {
    const response = await api.post('/predictions', data);
    return response.data;
  },
};

// Insights API
export const insightsApi = {
  get: async () => {
    const response = await api.get('/insights');
    return response.data;
  },
};

// Health check
export const healthApi = {
  check: async () => {
    const response = await api.get('/health');
    return response.data;
  },
};

export default api;
