import { useEffect, useState } from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import useAuthStore from '../../store/authStore';

function ProtectedRoute({ children }) {
  const { isAuthenticated, checkAuth, logout } = useAuthStore();
  const location = useLocation();
  const [isChecking, setIsChecking] = useState(true);

  useEffect(() => {
    const token = localStorage.getItem('aurea_token');

    if (token) {
      // Validate token and check expiration
      try {
        const payload = JSON.parse(atob(token.split('.')[1]));
        if (payload.exp * 1000 < Date.now()) {
          // Token expired
          logout();
        } else {
          // Token valid, sync auth state
          checkAuth();
        }
      } catch {
        // Invalid token format
        logout();
      }
    }

    setIsChecking(false);
  }, [checkAuth, logout]);

  if (isChecking) {
    return <div className="flex items-center justify-center min-h-screen">Loading...</div>;
  }

  if (!isAuthenticated && !localStorage.getItem('aurea_token')) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  return children;
}

export default ProtectedRoute;
