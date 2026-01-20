import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { ingredientApi, logsApi, predictionsApi, insightsApi } from '../lib/api';

// Hook for searching ingredients
export function useIngredientSearch(name, options = {}) {
  return useQuery({
    queryKey: ['ingredient', name],
    queryFn: () => ingredientApi.search(name),
    enabled: !!name && name.length >= 2,
    staleTime: 5 * 60 * 1000, // Cache for 5 minutes
    ...options,
  });
}

// Hook for fetching user logs
export function useLogs() {
  return useQuery({
    queryKey: ['logs'],
    queryFn: logsApi.getAll,
    staleTime: 60 * 1000, // 1 minute
  });
}

// Hook for fetching a single log by date
export function useLogByDate(date) {
  return useQuery({
    queryKey: ['log', date],
    queryFn: () => logsApi.getByDate(date),
    enabled: !!date,
  });
}

// Hook for creating a log
export function useCreateLog() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: logsApi.create,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['logs'] });
      queryClient.invalidateQueries({ queryKey: ['insights'] });
    },
  });
}

// Hook for deleting a log
export function useDeleteLog() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: logsApi.delete,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['logs'] });
      queryClient.invalidateQueries({ queryKey: ['insights'] });
    },
  });
}

// Hook for fetching predictions
export function usePredictions() {
  return useQuery({
    queryKey: ['predictions'],
    queryFn: predictionsApi.getAll,
    staleTime: 5 * 60 * 1000,
  });
}

// Hook for creating a prediction
export function useCreatePrediction() {
  const queryClient = useQueryClient();

  return useMutation({
    mutationFn: predictionsApi.create,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['predictions'] });
    },
  });
}

// Hook for fetching insights
export function useInsights() {
  return useQuery({
    queryKey: ['insights'],
    queryFn: insightsApi.get,
    staleTime: 5 * 60 * 1000,
  });
}

export default {
  useIngredientSearch,
  useLogs,
  useLogByDate,
  useCreateLog,
  useDeleteLog,
  usePredictions,
  useCreatePrediction,
  useInsights,
};
