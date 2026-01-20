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
          set({ isAuthenticated: true, token });
          return true;
        }
        return false;
      },
    }),
    {
      name: 'aurea_auth',
      partialize: (state) => ({ user: state.user }),
    }
  )
);

export default useAuthStore;
