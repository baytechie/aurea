import React, {
  createContext,
  useContext,
  useState,
  useEffect,
  ReactNode,
} from 'react';
import {Platform} from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import {
  appleAuth,
  AppleRequestResponse,
} from '@invertase/react-native-apple-authentication';
import {authApi, AuthResponse, AppleAuthResponse, User} from '../lib/api';

interface AuthContextType {
  user: User | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  login: (email: string, password: string) => Promise<void>;
  signup: (email: string, password: string) => Promise<void>;
  loginWithApple: () => Promise<void>;
  logout: () => Promise<void>;
  error: string | null;
  isAppleSignInAvailable: boolean;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({children}: {children: ReactNode}) {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [isAppleSignInAvailable, setIsAppleSignInAvailable] = useState(false);

  // Check for existing token on mount and Apple Sign-In availability
  useEffect(() => {
    checkAuthStatus();
    checkAppleSignInAvailability();
  }, []);

  // Listen for Apple credential revocation (iOS only)
  useEffect(() => {
    if (Platform.OS !== 'ios' || !appleAuth.isSupported) {
      return;
    }

    // Subscribe to credential revoked events
    const unsubscribe = appleAuth.onCredentialRevoked(async () => {
      // User has revoked their Apple credentials
      // Log them out of the app
      console.warn('Apple credentials revoked, logging out');
      await logout();
    });

    return () => {
      // Cleanup subscription on unmount
      unsubscribe();
    };
  }, []);

  const checkAppleSignInAvailability = async () => {
    // Apple Sign-In is only available on iOS 13+
    if (Platform.OS === 'ios') {
      const isSupported = appleAuth.isSupported;
      setIsAppleSignInAvailable(isSupported);
    }
  };

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

  const loginWithApple = async () => {
    setError(null);
    try {
      // Perform Apple Sign-In request
      const appleAuthResponse: AppleRequestResponse = await appleAuth.performRequest({
        requestedOperation: appleAuth.Operation.LOGIN,
        requestedScopes: [appleAuth.Scope.EMAIL, appleAuth.Scope.FULL_NAME],
      });

      // Verify the credential state
      const credentialState = await appleAuth.getCredentialStateForUser(
        appleAuthResponse.user,
      );

      if (credentialState !== appleAuth.State.AUTHORIZED) {
        throw new Error('Apple Sign-In was not authorized');
      }

      // Extract the identity token and authorization code
      const {identityToken, authorizationCode, email, fullName} = appleAuthResponse;

      if (!identityToken || !authorizationCode) {
        throw new Error('Apple Sign-In failed: Missing credentials');
      }

      // Build user name from fullName components
      let userName: string | null = null;
      if (fullName?.givenName || fullName?.familyName) {
        userName = [fullName.givenName, fullName.familyName]
          .filter(Boolean)
          .join(' ');
      }

      // Send to backend for verification
      const response: AppleAuthResponse = await authApi.appleSignIn({
        identity_token: identityToken,
        authorization_code: authorizationCode,
        user: email || userName ? {
          email: email,
          name: userName,
        } : null,
      });

      // Store token and set user
      await AsyncStorage.setItem('auth_token', response.token);
      setUser({
        user_id: response.user_id,
        email: response.email,
      });
    } catch (err: any) {
      // Handle user cancellation
      if (err.code === appleAuth.Error.CANCELED) {
        return; // User cancelled, don't show error
      }

      const message =
        err.response?.data?.detail ||
        err.message ||
        'Apple Sign-In failed. Please try again.';
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
        loginWithApple,
        logout,
        error,
        isAppleSignInAvailable,
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
