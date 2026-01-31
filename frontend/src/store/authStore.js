import { create } from 'zustand';
import { persist } from 'zustand/middleware';

const useAuthStore = create(
  persist(
    (set, get) => ({
      user: null,
      token: null,
      isAuthenticated: false,

      setAuth: (user, token) => {
        localStorage.setItem('aurea_token', token);
        set({ user, token, isAuthenticated: true });
      },

      logout: () => {
        localStorage.removeItem('aurea_token');
        set({ user: null, token: null, isAuthenticated: false });
      },

      checkAuth: () => {
        const token = localStorage.getItem('aurea_token');
        const storedUser = get().user;

        if (token && storedUser) {
          // Check if token is expired
          try {
            const payload = JSON.parse(atob(token.split('.')[1]));
            if (payload.exp * 1000 < Date.now()) {
              // Token expired, clear auth state
              localStorage.removeItem('aurea_token');
              set({ user: null, token: null, isAuthenticated: false });
              return false;
            }
          } catch {
            // Invalid token format, clear auth state
            localStorage.removeItem('aurea_token');
            set({ user: null, token: null, isAuthenticated: false });
            return false;
          }

          set({ isAuthenticated: true, token });
          return true;
        }

        // Clear stale data if token is missing but user exists
        if (!token && storedUser) {
          set({ user: null, isAuthenticated: false });
        }
        return false;
      },
    }),
    {
      name: 'aurea_auth',
      partialize: (state) => ({ user: state.user, token: state.token }),
    }
  )
);

export default useAuthStore;
