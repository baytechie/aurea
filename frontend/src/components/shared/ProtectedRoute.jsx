import { Navigate, useLocation } from 'react-router-dom';
import useAuthStore from '../../store/authStore';

function ProtectedRoute({ children }) {
  const { isAuthenticated } = useAuthStore();
  const location = useLocation();

  // Check for token in localStorage as fallback
  const token = localStorage.getItem('aurea_token');

  // Allow access if authenticated via store OR has valid token
  if (!isAuthenticated && !token) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  return children;
}

export default ProtectedRoute;
