import React, {useState, useRef, useEffect, useCallback} from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  FlatList,
  TouchableOpacity,
  ActivityIndicator,
  ScrollView,
} from 'react-native';
import {useNavigation} from '@react-navigation/native';
import {useQuery, useQueries} from '@tanstack/react-query';
import Icon from 'react-native-vector-icons/Ionicons';
import {ingredientsApi, IngredientScore} from '../lib/api';
import {
  colors,
  typography,
  spacing,
  borderRadius,
  shadows,
  getScoreColor,
  getScoreBackgroundColor,
  getCategoryColor,
} from '../theme';

// Ingredient names to fetch (we'll get real scores from API)
const TOP_RATED_NAMES = [
  'Spinach',
  'Salmon',
  'Blueberries',
  'Avocado',
  'Broccoli',
  'Quinoa',
];
const WATCH_LIST_NAMES = [
  'Sugar',
  'White Bread',
  'Soda',
  'Processed Meat',
  'Margarine',
  'Candy',
];

// Quick category filters with search terms
const CATEGORY_DATA: Record<string, {icon: string; items: string[]}> = {
  All: {icon: 'grid-outline', items: []},
  Sweeteners: {
    icon: 'cube-outline',
    items: ['sugar', 'honey', 'stevia', 'aspartame', 'sucralose', 'maple syrup'],
  },
  'Fats & Oils': {
    icon: 'water-outline',
    items: ['olive oil', 'butter', 'coconut oil', 'avocado oil', 'canola oil'],
  },
  Fruits: {
    icon: 'nutrition-outline',
    items: [
      'apple',
      'banana',
      'orange',
      'strawberry',
      'blueberry',
      'grape',
      'mango',
      'pineapple',
    ],
  },
  Vegetables: {
    icon: 'leaf-outline',
    items: [
      'spinach',
      'broccoli',
      'carrot',
      'tomato',
      'lettuce',
      'kale',
      'cucumber',
      'pepper',
    ],
  },
  Proteins: {
    icon: 'fish-outline',
    items: [
      'chicken',
      'salmon',
      'beef',
      'egg',
      'tuna',
      'turkey',
      'tofu',
      'shrimp',
    ],
  },
  Grains: {
    icon: 'barcode-outline',
    items: [
      'rice',
      'quinoa',
      'oats',
      'wheat',
      'bread',
      'pasta',
      'barley',
      'corn',
    ],
  },
};

const CATEGORY_LABELS = Object.keys(CATEGORY_DATA);

export default function SearchScreen() {
  const [query, setQuery] = useState('');
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState('All');
  const navigation = useNavigation<any>();

  const {data: results, isLoading} = useQuery({
    queryKey: ['ingredientSearch', searchTerm],
    queryFn: () => ingredientsApi.search(searchTerm),
    enabled: searchTerm.length >= 2,
  });

  // Search for category items when category is selected
  const categorySearchTerm =
    selectedCategory !== 'All' ? selectedCategory.toLowerCase() : '';
  const {data: categoryResults, isLoading: isLoadingCategory} = useQuery({
    queryKey: ['categorySearch', categorySearchTerm],
    queryFn: () => ingredientsApi.search(categorySearchTerm),
    enabled: selectedCategory !== 'All' && categorySearchTerm.length >= 2,
    staleTime: 1000 * 60 * 60, // Cache for 1 hour
  });

  // Process category data
  const categoryIngredients = (categoryResults || [])
    .filter((item: any) => item.overall_score !== undefined)
    .map((item: any) => ({
      name: item.name,
      score: item.overall_score,
      category: item.category || 'Food',
      is_trusted: item.is_trusted,
    }))
    .sort((a: any, b: any) => (b.score || 0) - (a.score || 0))
    .slice(0, 12);

  const handleCategorySelect = (categoryLabel: string) => {
    setSelectedCategory(categoryLabel);
    // Clear the search when selecting a category
    if (categoryLabel !== 'All') {
      setQuery('');
      setSearchTerm('');
    }
  };

  // Fetch real scores for top rated ingredients
  const topRatedQueries = useQueries({
    queries: TOP_RATED_NAMES.map(name => ({
      queryKey: ['ingredient', name],
      queryFn: () => ingredientsApi.getIngredient(name),
      staleTime: 1000 * 60 * 60, // Cache for 1 hour
    })),
  });

  // Fetch real scores for watch list ingredients
  const watchListQueries = useQueries({
    queries: WATCH_LIST_NAMES.map(name => ({
      queryKey: ['ingredient', name],
      queryFn: () => ingredientsApi.getIngredient(name),
      staleTime: 1000 * 60 * 60, // Cache for 1 hour
    })),
  });

  // Process fetched data into display format
  const topRatedData = topRatedQueries
    .filter(q => q.data)
    .map(q => ({
      name: q.data!.name,
      score: q.data!.overall_score,
      category: (q.data as any)?.category || 'Food',
      is_trusted: (q.data as IngredientScore)?.is_trusted,
    }))
    .sort((a, b) => (b.score || 0) - (a.score || 0));

  const watchListData = watchListQueries
    .filter(q => q.data)
    .map(q => ({
      name: q.data!.name,
      score: q.data!.overall_score,
      category: (q.data as any)?.category || 'Food',
      is_trusted: (q.data as IngredientScore)?.is_trusted,
    }))
    .sort((a, b) => (a.score || 0) - (b.score || 0));

  const isLoadingLists =
    topRatedQueries.some(q => q.isLoading) ||
    watchListQueries.some(q => q.isLoading);

  // Use timeout ref for debouncing to avoid hook issues
  const timeoutRef = useRef<NodeJS.Timeout | null>(null);

  // Cleanup timeout on unmount
  useEffect(() => {
    return () => {
      if (timeoutRef.current) {
        clearTimeout(timeoutRef.current);
      }
    };
  }, []);

  const handleSearch = useCallback((text: string) => {
    setQuery(text);

    // Clear previous timeout
    if (timeoutRef.current) {
      clearTimeout(timeoutRef.current);
    }

    // Set new debounced search
    timeoutRef.current = setTimeout(() => {
      setSearchTerm(text);
    }, 300);
  }, []);

  const handleIngredientPress = (name: string) => {
    navigation.navigate('IngredientDetail', {name});
  };

  const getScoreLabel = (score: number | undefined) => {
    if (!score) return null;
    if (score >= 70) return 'Good';
    if (score >= 40) return 'Moderate';
    return 'Caution';
  };

  const renderResultItem = ({item}: {item: any}) => {
    const score = item.overall_score;
    const hasScore = score !== undefined && score !== null;
    const categoryColors = getCategoryColor(item.category || 'Food');
    const isTrusted = item.is_trusted === 1;

    return (
      <TouchableOpacity
        style={styles.resultCard}
        onPress={() => handleIngredientPress(item.name)}
        accessibilityLabel={`View details for ${item.name}`}
        activeOpacity={0.7}>
        <View style={styles.resultLeft}>
          <View
            style={[
              styles.resultIcon,
              {
                backgroundColor: hasScore
                  ? getScoreBackgroundColor(score)
                  : colors.primaryBackground,
              },
            ]}>
            <Icon
              name="leaf"
              size={20}
              color={hasScore ? getScoreColor(score) : colors.primary}
            />
          </View>
        </View>

        <View style={styles.resultContent}>
          <View style={styles.resultNameRow}>
            <Text style={styles.ingredientName}>{item.name}</Text>
            {item.is_trusted !== undefined && (
              <Icon
                name={isTrusted ? 'checkmark-circle' : 'alert-circle-outline'}
                size={14}
                color={isTrusted ? colors.success : colors.warning}
                style={styles.trustIcon}
              />
            )}
          </View>
          {item.category && (
            <View
              style={[
                styles.categoryTag,
                {backgroundColor: categoryColors.backgroundColor},
              ]}>
              <Text
                style={[
                  styles.categoryText,
                  {color: categoryColors.textColor},
                ]}>
                {item.category.replace(/_/g, ' ')}
              </Text>
            </View>
          )}
        </View>

        <View style={styles.resultRight}>
          {hasScore ? (
            <View style={styles.scoreContainer}>
              <Text style={[styles.scoreNumber, {color: getScoreColor(score)}]}>
                {score}
              </Text>
              <Text style={[styles.scoreLabel, {color: getScoreColor(score)}]}>
                {getScoreLabel(score)}
              </Text>
            </View>
          ) : (
            <View style={styles.noScoreContainer}>
              <Icon
                name="information-circle-outline"
                size={16}
                color={colors.textTertiary}
              />
              <Text style={styles.noScoreText}>View</Text>
            </View>
          )}
          <Icon name="chevron-forward" size={18} color={colors.textTertiary} />
        </View>
      </TouchableOpacity>
    );
  };

  const renderRatedCard = (
    item: {
      name: string;
      score: number;
      category: string;
      is_trusted?: number;
    },
    isGood: boolean
  ) => {
    const scoreColor =
      item.score >= 70
        ? colors.success
        : item.score >= 40
        ? colors.warning
        : colors.error;
    const categoryColors = getCategoryColor(item.category);
    const isTrusted = item.is_trusted === 1;

    return (
      <TouchableOpacity
        key={item.name}
        style={[styles.ratedCard, isGood ? styles.goodCard : styles.cautionCard]}
        onPress={() => handleIngredientPress(item.name)}
        activeOpacity={0.7}>
        <View style={styles.ratedCardHeader}>
          <View style={[styles.ratedScoreBadge, {backgroundColor: scoreColor}]}>
            <Text style={styles.ratedScoreText}>{item.score}</Text>
          </View>
          {item.is_trusted !== undefined && (
            <Icon
              name={isTrusted ? 'checkmark-circle' : 'alert-circle-outline'}
              size={12}
              color={isTrusted ? colors.success : colors.warning}
            />
          )}
        </View>
        <Text style={styles.ratedName} numberOfLines={1}>
          {item.name}
        </Text>
        <View
          style={[
            styles.ratedCategoryBadge,
            {backgroundColor: categoryColors.backgroundColor},
          ]}>
          <Text
            style={[
              styles.ratedCategoryText,
              {color: categoryColors.textColor},
            ]}
            numberOfLines={1}>
            {item.category.replace(/_/g, ' ')}
          </Text>
        </View>
      </TouchableOpacity>
    );
  };

  const renderEmptyState = () => (
    <ScrollView
      style={styles.emptyStateScroll}
      showsVerticalScrollIndicator={false}
      contentContainerStyle={styles.emptyStateContent}>
      {/* Top Rated Section */}
      <View style={styles.ratedSection}>
        <View style={styles.sectionHeader}>
          <View style={styles.sectionIconGood}>
            <Icon name="trophy" size={18} color={colors.success} />
          </View>
          <View>
            <Text style={styles.sectionTitle}>Top Rated</Text>
            <Text style={styles.sectionSubtitle}>Healthiest choices</Text>
          </View>
        </View>
        {isLoadingLists && topRatedData.length === 0 ? (
          <View style={styles.loadingCards}>
            <ActivityIndicator size="small" color={colors.primary} />
          </View>
        ) : (
          <ScrollView
            horizontal
            showsHorizontalScrollIndicator={false}
            contentContainerStyle={styles.ratedScroll}>
            {topRatedData.map(item => renderRatedCard(item, true))}
          </ScrollView>
        )}
      </View>

      {/* Watch List Section */}
      <View style={styles.ratedSection}>
        <View style={styles.sectionHeader}>
          <View style={styles.sectionIconCaution}>
            <Icon name="warning" size={18} color={colors.error} />
          </View>
          <View>
            <Text style={styles.sectionTitle}>Use with Caution</Text>
            <Text style={styles.sectionSubtitle}>Limit these ingredients</Text>
          </View>
        </View>
        {isLoadingLists && watchListData.length === 0 ? (
          <View style={styles.loadingCards}>
            <ActivityIndicator size="small" color={colors.primary} />
          </View>
        ) : (
          <ScrollView
            horizontal
            showsHorizontalScrollIndicator={false}
            contentContainerStyle={styles.ratedScroll}>
            {watchListData.map(item => renderRatedCard(item, false))}
          </ScrollView>
        )}
      </View>

      {/* Category Filters */}
      <View style={styles.categoriesSection}>
        <Text style={styles.browseSectionTitle}>Browse by Category</Text>
        <ScrollView
          horizontal
          showsHorizontalScrollIndicator={false}
          contentContainerStyle={styles.categoriesScroll}>
          {CATEGORY_LABELS.map(label => (
            <TouchableOpacity
              key={label}
              style={[
                styles.categoryChip,
                selectedCategory === label && styles.categoryChipActive,
              ]}
              onPress={() => handleCategorySelect(label)}>
              <Icon
                name={CATEGORY_DATA[label].icon}
                size={16}
                color={
                  selectedCategory === label ? colors.white : colors.primary
                }
              />
              <Text
                style={[
                  styles.categoryChipText,
                  selectedCategory === label && styles.categoryChipTextActive,
                ]}>
                {label}
              </Text>
            </TouchableOpacity>
          ))}
        </ScrollView>
      </View>

      {/* Category Results */}
      {selectedCategory !== 'All' && (
        <View style={styles.categoryResultsSection}>
          <Text style={styles.categoryResultsTitle}>{selectedCategory}</Text>
          {isLoadingCategory ? (
            <View style={styles.loadingCards}>
              <ActivityIndicator size="small" color={colors.primary} />
              <Text style={styles.loadingText}>
                Loading {selectedCategory.toLowerCase()}...
              </Text>
            </View>
          ) : categoryIngredients.length > 0 ? (
            <View style={styles.categoryGrid}>
              {categoryIngredients.map(item => {
                const categoryColors = getCategoryColor(item.category);
                const isTrusted = item.is_trusted === 1;
                return (
                  <TouchableOpacity
                    key={item.name}
                    style={styles.categoryResultCard}
                    onPress={() => handleIngredientPress(item.name)}
                    activeOpacity={0.7}>
                    <View style={styles.categoryResultHeader}>
                      <View
                        style={[
                          styles.categoryResultScore,
                          {
                            backgroundColor:
                              item.score >= 70
                                ? colors.success
                                : item.score >= 40
                                ? colors.warning
                                : colors.error,
                          },
                        ]}>
                        <Text style={styles.categoryResultScoreText}>
                          {item.score}
                        </Text>
                      </View>
                      {item.is_trusted !== undefined && (
                        <Icon
                          name={
                            isTrusted
                              ? 'checkmark-circle'
                              : 'alert-circle-outline'
                          }
                          size={12}
                          color={isTrusted ? colors.success : colors.warning}
                        />
                      )}
                    </View>
                    <Text
                      style={styles.categoryResultName}
                      numberOfLines={1}>
                      {item.name}
                    </Text>
                    <View
                      style={[
                        styles.categoryResultCategoryBadge,
                        {backgroundColor: categoryColors.backgroundColor},
                      ]}>
                      <Text
                        style={[
                          styles.categoryResultLabel,
                          {color: categoryColors.textColor},
                        ]}
                        numberOfLines={1}>
                        {item.category.replace(/_/g, ' ')}
                      </Text>
                    </View>
                  </TouchableOpacity>
                );
              })}
            </View>
          ) : (
            <View style={styles.noCategoryResults}>
              <Icon
                name="leaf-outline"
                size={24}
                color={colors.textTertiary}
              />
              <Text style={styles.noCategoryText}>
                No {selectedCategory.toLowerCase()} found
              </Text>
            </View>
          )}
        </View>
      )}

      {/* Score Legend */}
      <View style={styles.legendSection}>
        <Text style={styles.legendTitle}>Score Guide</Text>
        <View style={styles.legendContainer}>
          <View style={styles.legendItem}>
            <View
              style={[styles.legendDot, {backgroundColor: colors.success}]}
            />
            <Text style={styles.legendLabel}>70-100</Text>
            <Text style={styles.legendText}>Good Choice</Text>
          </View>
          <View style={styles.legendItem}>
            <View
              style={[styles.legendDot, {backgroundColor: colors.warning}]}
            />
            <Text style={styles.legendLabel}>40-69</Text>
            <Text style={styles.legendText}>Moderate</Text>
          </View>
          <View style={styles.legendItem}>
            <View style={[styles.legendDot, {backgroundColor: colors.error}]} />
            <Text style={styles.legendLabel}>0-39</Text>
            <Text style={styles.legendText}>Use Caution</Text>
          </View>
        </View>
      </View>

      {/* Trust Indicator Legend */}
      <View style={styles.trustLegendSection}>
        <Text style={styles.legendTitle}>Source Indicators</Text>
        <View style={styles.trustLegendContainer}>
          <View style={styles.trustLegendItem}>
            <Icon name="checkmark-circle" size={18} color={colors.success} />
            <Text style={styles.trustLegendText}>Researched - Verified scientific sources</Text>
          </View>
          <View style={styles.trustLegendItem}>
            <Icon name="alert-circle-outline" size={18} color={colors.warning} />
            <Text style={styles.trustLegendText}>Public Source - General information</Text>
          </View>
        </View>
      </View>

      {/* Quick Search Tips */}
      <View style={styles.tipsSection}>
        <View style={styles.tipCard}>
          <Icon name="bulb-outline" size={20} color={colors.primary} />
          <Text style={styles.tipText}>
            Search for any ingredient to see its health score and detailed
            analysis
          </Text>
        </View>
      </View>
    </ScrollView>
  );

  const renderNoResults = () => (
    <View style={styles.noResultsContainer}>
      <View style={styles.noResultsIcon}>
        <Icon name="search-outline" size={32} color={colors.textTertiary} />
      </View>
      <Text style={styles.noResultsTitle}>No ingredients found</Text>
      <Text style={styles.noResultsSubtitle}>
        Try a different spelling or search term
      </Text>
      <TouchableOpacity
        style={styles.clearButton}
        onPress={() => {
          setQuery('');
          setSearchTerm('');
        }}>
        <Text style={styles.clearButtonText}>Clear Search</Text>
      </TouchableOpacity>
    </View>
  );

  return (
    <View style={styles.container}>
      {/* Search Bar */}
      <View style={styles.searchSection}>
        <View style={styles.searchContainer}>
          <Icon name="search" size={20} color={colors.textTertiary} />
          <TextInput
            style={styles.searchInput}
            placeholder="Search any ingredient..."
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
              style={styles.clearIcon}
              accessibilityLabel="Clear search">
              <Icon name="close-circle" size={20} color={colors.textTertiary} />
            </TouchableOpacity>
          )}
        </View>
      </View>

      {/* Results */}
      {isLoading ? (
        <View style={styles.loadingContainer}>
          <ActivityIndicator size="large" color={colors.primary} />
          <Text style={styles.loadingText}>Searching ingredients...</Text>
        </View>
      ) : query.length < 2 ? (
        renderEmptyState()
      ) : results && results.length > 0 ? (
        <FlatList
          data={results}
          renderItem={renderResultItem}
          keyExtractor={(item, index) => `${item.name}-${index}`}
          contentContainerStyle={styles.resultsList}
          showsVerticalScrollIndicator={false}
          ListHeaderComponent={
            <Text style={styles.resultsCount}>
              {results.length} ingredient{results.length !== 1 ? 's' : ''} found
            </Text>
          }
        />
      ) : (
        renderNoResults()
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },

  // Search Section
  searchSection: {
    backgroundColor: colors.white,
    paddingHorizontal: spacing.base,
    paddingVertical: spacing.md,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  searchContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.background,
    paddingHorizontal: spacing.base,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.lg,
    borderWidth: 1,
    borderColor: colors.border,
  },
  searchInput: {
    flex: 1,
    marginLeft: spacing.md,
    fontSize: typography.fontSize.base,
    color: colors.textPrimary,
    paddingVertical: spacing.xs,
  },
  clearIcon: {
    padding: spacing.xs,
  },

  // Loading
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

  // Results List
  resultsList: {
    padding: spacing.base,
  },
  resultsCount: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginBottom: spacing.md,
  },

  // Result Card
  resultCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    padding: spacing.base,
    borderRadius: borderRadius.lg,
    marginBottom: spacing.sm,
    ...shadows.sm,
  },
  resultLeft: {
    marginRight: spacing.md,
  },
  resultIcon: {
    width: 44,
    height: 44,
    borderRadius: borderRadius.md,
    alignItems: 'center',
    justifyContent: 'center',
  },
  resultContent: {
    flex: 1,
  },
  resultNameRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.xs,
  },
  ingredientName: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    textTransform: 'capitalize',
  },
  trustIcon: {
    marginLeft: spacing.xs,
  },
  categoryTag: {
    alignSelf: 'flex-start',
    paddingHorizontal: spacing.sm,
    paddingVertical: 2,
    borderRadius: borderRadius.sm,
  },
  categoryText: {
    fontSize: typography.fontSize.xs,
    textTransform: 'capitalize',
  },
  resultRight: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.sm,
  },
  scoreContainer: {
    alignItems: 'flex-end',
    marginRight: spacing.xs,
  },
  scoreNumber: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
  },
  scoreLabel: {
    fontSize: typography.fontSize.xs,
  },
  noScoreContainer: {
    alignItems: 'center',
    marginRight: spacing.xs,
  },
  noScoreText: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
  },

  // Empty State
  emptyStateScroll: {
    flex: 1,
  },
  emptyStateContent: {
    paddingBottom: spacing['2xl'],
  },

  // Rated Sections (Top Rated & Watch List)
  ratedSection: {
    paddingTop: spacing.lg,
    paddingBottom: spacing.sm,
  },
  sectionHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: spacing.base,
    marginBottom: spacing.md,
    gap: spacing.md,
  },
  sectionIconGood: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: colors.successLight,
    alignItems: 'center',
    justifyContent: 'center',
  },
  sectionIconCaution: {
    width: 36,
    height: 36,
    borderRadius: 18,
    backgroundColor: colors.errorLight,
    alignItems: 'center',
    justifyContent: 'center',
  },
  sectionTitle: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
  },
  sectionSubtitle: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
  },
  ratedScroll: {
    paddingHorizontal: spacing.base,
    gap: spacing.md,
  },
  loadingCards: {
    height: 120,
    justifyContent: 'center',
    alignItems: 'center',
  },
  ratedCard: {
    width: 110,
    padding: spacing.md,
    borderRadius: borderRadius.lg,
    alignItems: 'center',
    ...shadows.sm,
  },
  goodCard: {
    backgroundColor: colors.white,
    borderWidth: 1,
    borderColor: colors.successLight,
  },
  cautionCard: {
    backgroundColor: colors.white,
    borderWidth: 1,
    borderColor: colors.errorLight,
  },
  ratedCardHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.xs,
    marginBottom: spacing.sm,
  },
  ratedScoreBadge: {
    width: 40,
    height: 40,
    borderRadius: 20,
    alignItems: 'center',
    justifyContent: 'center',
  },
  ratedScoreText: {
    color: colors.white,
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.bold,
  },
  ratedName: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    textAlign: 'center',
    marginBottom: spacing.xs,
  },
  ratedCategoryBadge: {
    paddingHorizontal: spacing.sm,
    paddingVertical: 2,
    borderRadius: borderRadius.sm,
  },
  ratedCategoryText: {
    fontSize: typography.fontSize.xs,
    textTransform: 'capitalize',
  },

  // Categories
  categoriesSection: {
    paddingHorizontal: spacing.base,
    paddingTop: spacing.lg,
    marginBottom: spacing.md,
  },
  browseSectionTitle: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.md,
  },
  categoriesScroll: {
    gap: spacing.sm,
  },
  categoryChip: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.white,
    paddingHorizontal: spacing.base,
    paddingVertical: spacing.sm,
    borderRadius: borderRadius.full,
    borderWidth: 1,
    borderColor: colors.primary,
    gap: spacing.xs,
    marginRight: spacing.sm,
  },
  categoryChipActive: {
    backgroundColor: colors.primary,
  },
  categoryChipText: {
    fontSize: typography.fontSize.sm,
    color: colors.primary,
    fontWeight: typography.fontWeight.medium,
  },
  categoryChipTextActive: {
    color: colors.white,
  },

  // Category Results
  categoryResultsSection: {
    paddingHorizontal: spacing.base,
    paddingTop: spacing.md,
    paddingBottom: spacing.lg,
  },
  categoryResultsTitle: {
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.md,
  },
  categoryGrid: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    gap: spacing.sm,
  },
  categoryResultCard: {
    width: '31%',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.md,
    alignItems: 'center',
    ...shadows.sm,
  },
  categoryResultHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.xs,
    marginBottom: spacing.sm,
  },
  categoryResultScore: {
    width: 44,
    height: 44,
    borderRadius: 22,
    alignItems: 'center',
    justifyContent: 'center',
  },
  categoryResultScoreText: {
    color: colors.white,
    fontSize: typography.fontSize.base,
    fontWeight: typography.fontWeight.bold,
  },
  categoryResultName: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.medium,
    color: colors.textPrimary,
    textAlign: 'center',
    marginBottom: spacing.xs,
  },
  categoryResultCategoryBadge: {
    paddingHorizontal: spacing.sm,
    paddingVertical: 2,
    borderRadius: borderRadius.sm,
  },
  categoryResultLabel: {
    fontSize: typography.fontSize.xs,
    textTransform: 'capitalize',
  },
  noCategoryResults: {
    alignItems: 'center',
    padding: spacing.xl,
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    ...shadows.sm,
  },
  noCategoryText: {
    marginTop: spacing.sm,
    fontSize: typography.fontSize.sm,
    color: colors.textTertiary,
  },

  // Legend Section
  legendSection: {
    paddingHorizontal: spacing.base,
    paddingTop: spacing.lg,
  },
  legendTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.md,
  },
  legendContainer: {
    flexDirection: 'row',
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    justifyContent: 'space-around',
    ...shadows.sm,
  },
  legendItem: {
    alignItems: 'center',
    gap: spacing.xs,
  },
  legendDot: {
    width: 24,
    height: 24,
    borderRadius: 12,
  },
  legendLabel: {
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
  },
  legendText: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
  },

  // Trust Legend Section
  trustLegendSection: {
    paddingHorizontal: spacing.base,
    paddingTop: spacing.lg,
  },
  trustLegendContainer: {
    backgroundColor: colors.white,
    borderRadius: borderRadius.lg,
    padding: spacing.base,
    ...shadows.sm,
  },
  trustLegendItem: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: spacing.md,
    paddingVertical: spacing.sm,
  },
  trustLegendText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    flex: 1,
  },

  // Tips Section
  tipsSection: {
    paddingHorizontal: spacing.base,
    paddingTop: spacing.md,
  },
  tipCard: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: colors.primaryBackground,
    padding: spacing.base,
    borderRadius: borderRadius.lg,
    gap: spacing.md,
  },
  tipText: {
    flex: 1,
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    lineHeight: typography.fontSize.sm * 1.5,
  },

  // No Results
  noResultsContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: spacing['2xl'],
  },
  noResultsIcon: {
    width: 64,
    height: 64,
    borderRadius: 32,
    backgroundColor: colors.background,
    alignItems: 'center',
    justifyContent: 'center',
    marginBottom: spacing.lg,
  },
  noResultsTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.textPrimary,
    marginBottom: spacing.sm,
  },
  noResultsSubtitle: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    textAlign: 'center',
    marginBottom: spacing.lg,
  },
  clearButton: {
    paddingHorizontal: spacing.lg,
    paddingVertical: spacing.md,
    backgroundColor: colors.primaryBackground,
    borderRadius: borderRadius.full,
  },
  clearButtonText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.semiBold,
    color: colors.primary,
  },
});
