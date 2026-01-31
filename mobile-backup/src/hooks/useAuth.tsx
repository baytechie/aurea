import React, {
  createContext,
  useContext,
  useState,
  useEffect,
  ReactNode,
} from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';
import {authApi, AuthResponse, User} from '../lib/api';

interface AuthContextType {
  user: User | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  login: (email: string, password: string) => Promise<void>;
  signup: (email: string, password: string) => Promise<void>;
  logout: () => Promise<void>;
  error: string | null;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({children}: {children: ReactNode}) {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Check for existing token on mount
  useEffect(() => {
    checkAuthStatus();
  }, []);

  const checkAuthStatus = async () => {
    try {
      const token = await AsyncStorage.getItem('auth_token');
      if (token) {
        const profile = await authApi.getProfile();
        setUser(profile);
      }
    } catch (err) {
      await AsyncStorage.removeItem('auth_token');
    } finally {
      setIsLoading(false);
    }
  };

  const login = async (email: string, password: string) => {
    setError(null);
    try {
      const response: AuthResponse = await authApi.login(email, password);
      await AsyncStorage.setItem('auth_token', response.token);
      setUser({
        user_id: response.user_id,
        email: response.email,
      });
    } catch (err: any) {
      const message =
        err.response?.data?.detail || 'Login failed. Please try again.';
      setError(message);
      throw new Error(message);
    }
  };

  const signup = async (email: string, password: string) => {
    setError(null);
    try {
      const response: AuthResponse = await authApi.signup(email, password);
      await AsyncStorage.setItem('auth_token', response.token);
      setUser({
        user_id: response.user_id,
        email: response.email,
      });
    } catch (err: any) {
      const message =
        err.response?.data?.detail || 'Signup failed. Please try again.';
      setError(message);
      throw new Error(message);
    }
  };

  const logout = async () => {
    await AsyncStorage.removeItem('auth_token');
    setUser(null);
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        isAuthenticated: !!user,
        isLoading,
        login,
        signup,
        logout,
        error,
      }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
