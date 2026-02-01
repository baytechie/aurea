import React, { useState, useCallback } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  FlatList,
  TouchableOpacity,
  ActivityIndicator,
} from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { useQuery } from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import { ingredientsApi } from '../lib/api';
import debounce from 'lodash/debounce';
import { colors, typography, spacing, borderRadius, shadows, getScoreColor } from '../theme';

export default function SearchScreen() {
  const [query, setQuery] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  const navigation = useNavigation<any>();

  const { data: results, isLoading } = useQuery({
    queryKey: ['ingredientSearch', searchTerm],
    queryFn: () => ingredientsApi.search(searchTerm),
    enabled: searchTerm.length >= 2,
  });

  const debouncedSearch = useCallback(
    debounce((text: string) => {
      setSearchTerm(text);
    }, 300),
    [],
  );

  const handleSearch = (text: string) => {
    setQuery(text);
    debouncedSearch(text);
  };

  const renderItem = ({ item }: { item: any }) => (
    <TouchableOpacity
      style={styles.resultCard}
      onPress={() => navigation.navigate('IngredientDetail', { name: item.name })}
      accessibilityLabel={`View details for ${item.name}`}
    >
      <View style={styles.resultContent}>
        <Text style={styles.ingredientName}>{item.name}</Text>
        {item.category && (
          <Text style={styles.category}>{item.category}</Text>
        )}
      </View>
      <View
        style={[
          styles.scoreBadge,
          { backgroundColor: getScoreColor(item.overall_score || 50) },
        ]}
      >
        <Text style={styles.scoreText}>{item.overall_score || '?'}</Text>
      </View>
      <Icon name="chevron-forward" size={20} color={colors.textTertiary} />
    </TouchableOpacity>
  );

  return (
    <View style={styles.container}>
      {/* Search Bar */}
      <View style={styles.searchContainer}>
        <Icon name="search" size={20} color={colors.textTertiary} style={styles.searchIcon} />
        <TextInput
          style={styles.searchInput}
          placeholder="Search ingredients..."
          placeholderTextColor={colors.textTertiary}
          value={query}
          onChangeText={handleSearch}
          autoCapitalize="none"
          autoCorrect={false}
          accessibilityLabel="Search ingredients"
          accessibilityHint="Type at least 2 characters to search"
        />
        {query.length > 0 && (
          <TouchableOpacity
            onPress={() => {
              setQuery('');
              setSearchTerm('');
            }}
            accessibilityLabel="Clear search"
          >
            <Icon name="close-circle" size={20} color={colors.textTertiary} />
          </TouchableOpacity>
        )}
      </View>

      {/* Results */}
      {isLoading ? (
        <View style={styles.loadingContainer}>
          <ActivityIndicator size="large" color={colors.primary} />
          <Text style={styles.loadingText}>Searching...</Text>
        </View>
      ) : query.length < 2 ? (
        <View style={styles.emptyState}>
          <View style={styles.emptyIconContainer}>
            <Icon name="search" size={32} color={colors.textTertiary} />
          </View>
          <Text style={styles.emptyTitle}>Search for Ingredients</Text>
          <Text style={styles.emptySubtitle}>
            Type at least 2 characters to search
          </Text>
        </View>
      ) : results && results.length > 0 ? (
        <FlatList
          data={results}
          renderItem={renderItem}
          keyExtractor={(item, index) => `${item.name}-${index}`}
          contentContainerStyle={styles.resultsList}
          showsVerticalScrollIndicator={false}
        />
      ) : (
        <View style={styles.emptyState}>
          <View style={styles.emptyIconContainer}>
            <Icon name="leaf-outline" size={32} color={colors.textTertiary} />
          </View>
          <Text style={styles.emptyTitle}>No Results</Text>
          <Text style={styles.emptySubtitle}>
            Try searching for a different ingredient
          </Text>
        </View>
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  searchContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    margin: spacing.base,
    paddingHorizontal: spacing.base,
    borderRadius: borderRadius.md,
    ...shadows.sm,
  },
  searchIcon: {
    marginRight: spacing.md,
  },
  searchInput: {
    flex: 1,
    paddingVertical: spacing.md,
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
  },
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  loadingText: {
    marginTop: spacing.md,
    color: colors.textSecondary,
    fontSize: typography.fontSize.sm,
  },
  resultsList: {
    paddingHorizontal: spacing.base,
  },
  resultCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    padding: spacing.base,
    borderRadius: borderRadius.lg,
    marginBottom: spacing.sm,
  },
  resultContent: {
    flex: 1,
  },
  ingredientName: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    textTransform: 'capitalize',
  },
  category: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    marginTop: spacing.xs,
    textTransform: 'capitalize',
  },
  scoreBadge: {
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: spacing.sm,
  },
  scoreText: {
    color: colors.white,
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
  },
  emptyState: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: spacing['2xl'],
  },
  emptyIconContainer: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.white,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.lg,
  },
  emptyTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textSecondary,
  },
  emptySubtitle: {
    fontSize: typography.fontSize.sm,
    color: colors.textTertiary,
    marginTop: spacing.sm,
    textAlign: 'center',
  },
});
