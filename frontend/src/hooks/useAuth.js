import { useMutation } from '@tanstack/react-query';
import { useNavigate } from 'react-router-dom';
import { authApi } from '../lib/api';
import useAuthStore from '../store/authStore';

export function useAuth() {
  const navigate = useNavigate();
  const { user, isAuthenticated, setAuth, logout: storeLogout, checkAuth } = useAuthStore();

  const loginMutation = useMutation({
    mutationFn: ({ email, password }) => authApi.login(email, password),
    onSuccess: (data) => {
      setAuth(data.user || { id: data.user_id, email: data.email }, data.token);
      navigate('/dashboard');
    },
  });

  const signupMutation = useMutation({
    mutationFn: ({ email, password }) => authApi.signup(email, password),
    onSuccess: (data) => {
      setAuth(data.user || { id: data.user_id, email: data.email }, data.token);
      navigate('/dashboard');
    },
  });

  const login = (email, password) => {
    loginMutation.mutate({ email, password });
  };

  const signup = (email, password) => {
    signupMutation.mutate({ email, password });
  };

  const logout = () => {
    authApi.logout();
    storeLogout();
    navigate('/');
  };

  return {
    user,
    isAuthenticated,
    login,
    signup,
    logout,
    checkAuth,
    isLoggingIn: loginMutation.isPending,
    isSigningUp: signupMutation.isPending,
    loginError: loginMutation.error,
    signupError: signupMutation.error,
  };
}

export default useAuth;
