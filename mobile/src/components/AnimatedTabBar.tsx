import React, { useEffect } from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
  Dimensions,
} from 'react-native';
import Animated, {
  useSharedValue,
  useAnimatedStyle,
  withSpring,
  withTiming,
  interpolate,
  Extrapolation,
} from 'react-native-reanimated';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import Icon from 'react-native-vector-icons/Ionicons';
import { colors, typography, spacing, borderRadius, shadows } from '../theme';

const { width } = Dimensions.get('window');
const TAB_WIDTH = width / 5;

type TabConfig = {
  name: string;
  label: string;
  icon: string;
  iconFocused: string;
};

const TABS: TabConfig[] = [
  { name: 'Home', label: 'Home', icon: 'home-outline', iconFocused: 'home' },
  { name: 'Search', label: 'Search', icon: 'search-outline', iconFocused: 'search' },
  { name: 'Log', label: 'Log', icon: 'add-circle-outline', iconFocused: 'add-circle' },
  { name: 'Insights', label: 'Insights', icon: 'analytics-outline', iconFocused: 'analytics' },
  { name: 'Profile', label: 'Profile', icon: 'person-outline', iconFocused: 'person' },
];

type AnimatedTabItemProps = {
  tab: TabConfig;
  index: number;
  isFocused: boolean;
  onPress: () => void;
  onLongPress: () => void;
};

function AnimatedTabItem({ tab, index, isFocused, onPress, onLongPress }: AnimatedTabItemProps) {
  const scale = useSharedValue(1);
  const translateY = useSharedValue(0);
  const opacity = useSharedValue(isFocused ? 1 : 0.6);

  useEffect(() => {
    opacity.value = withTiming(isFocused ? 1 : 0.6, { duration: 200 });
    translateY.value = withSpring(isFocused ? -2 : 0, {
      damping: 15,
      stiffness: 150,
    });
  }, [isFocused]);

  const handlePressIn = () => {
    scale.value = withSpring(0.9, { damping: 15, stiffness: 400 });
  };

  const handlePressOut = () => {
    scale.value = withSpring(1, { damping: 15, stiffness: 400 });
  };

  const animatedStyle = useAnimatedStyle(() => ({
    transform: [
      { scale: scale.value },
      { translateY: translateY.value },
    ],
    opacity: opacity.value,
  }));

  const iconAnimatedStyle = useAnimatedStyle(() => ({
    transform: [
      {
        scale: interpolate(
          translateY.value,
          [-2, 0],
          [1.1, 1],
          Extrapolation.CLAMP
        ),
      },
    ],
  }));

  const isLogTab = tab.name === 'Log';

  return (
    <TouchableOpacity
      onPress={onPress}
      onLongPress={onLongPress}
      onPressIn={handlePressIn}
      onPressOut={handlePressOut}
      style={styles.tabItem}
      accessibilityRole="button"
      accessibilityState={{ selected: isFocused }}
      accessibilityLabel={tab.label}
    >
      <Animated.View style={[styles.tabContent, animatedStyle]}>
        {isLogTab ? (
          <Animated.View style={[styles.logTabIcon, iconAnimatedStyle]}>
            <View style={[styles.logIconContainer, isFocused && styles.logIconContainerActive]}>
              <Icon
                name={isFocused ? tab.iconFocused : tab.icon}
                size={28}
                color={colors.white}
              />
            </View>
          </Animated.View>
        ) : (
          <>
            <Animated.View style={iconAnimatedStyle}>
              <Icon
                name={isFocused ? tab.iconFocused : tab.icon}
                size={24}
                color={isFocused ? colors.primary : colors.textTertiary}
              />
            </Animated.View>
            <Text
              style={[
                styles.tabLabel,
                isFocused && styles.tabLabelActive,
              ]}
            >
              {tab.label}
            </Text>
          </>
        )}

        {/* Active indicator dot */}
        {isFocused && !isLogTab && (
          <Animated.View style={styles.activeIndicator} />
        )}
      </Animated.View>
    </TouchableOpacity>
  );
}

type AnimatedTabBarProps = {
  state: any;
  descriptors: any;
  navigation: any;
};

export default function AnimatedTabBar({ state, descriptors, navigation }: AnimatedTabBarProps) {
  const insets = useSafeAreaInsets();
  const indicatorPosition = useSharedValue(state.index * TAB_WIDTH);

  useEffect(() => {
    indicatorPosition.value = withSpring(state.index * TAB_WIDTH, {
      damping: 20,
      stiffness: 200,
    });
  }, [state.index]);

  const indicatorStyle = useAnimatedStyle(() => ({
    transform: [{ translateX: indicatorPosition.value }],
  }));

  return (
    <View style={[styles.container, { paddingBottom: Math.max(insets.bottom, 12) }]}>
      {/* Sliding background indicator */}
      <Animated.View style={[styles.slidingIndicator, indicatorStyle]} />

      {/* Tab items */}
      <View style={styles.tabsContainer}>
        {state.routes.map((route: any, index: number) => {
          const { options } = descriptors[route.key];
          const isFocused = state.index === index;
          const tab = TABS[index];

          const onPress = () => {
            const event = navigation.emit({
              type: 'tabPress',
              target: route.key,
              canPreventDefault: true,
            });

            if (!isFocused && !event.defaultPrevented) {
              navigation.navigate(route.name);
            }
          };

          const onLongPress = () => {
            navigation.emit({
              type: 'tabLongPress',
              target: route.key,
            });
          };

          return (
            <AnimatedTabItem
              key={route.key}
              tab={tab}
              index={index}
              isFocused={isFocused}
              onPress={onPress}
              onLongPress={onLongPress}
            />
          );
        })}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: colors.white,
    borderTopWidth: 0,
    paddingTop: 8,
    ...shadows.lg,
    shadowOffset: { width: 0, height: -4 },
    shadowOpacity: 0.08,
    shadowRadius: 12,
    elevation: 20,
  },
  tabsContainer: {
    flexDirection: 'row',
    height: 56,
  },
  slidingIndicator: {
    position: 'absolute',
    top: 0,
    width: TAB_WIDTH,
    height: 3,
    backgroundColor: colors.primary,
    borderBottomLeftRadius: 3,
    borderBottomRightRadius: 3,
  },
  tabItem: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  tabContent: {
    alignItems: 'center',
    justifyContent: 'center',
    paddingVertical: spacing.xs,
  },
  tabLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.textTertiary,
    marginTop: 4,
    fontWeight: typography.fontWeight.medium,
  },
  tabLabelActive: {
    color: colors.primary,
    fontWeight: typography.fontWeight.semiBold,
  },
  activeIndicator: {
    position: 'absolute',
    bottom: -8,
    width: 4,
    height: 4,
    borderRadius: 2,
    backgroundColor: colors.primary,
  },
  logTabIcon: {
    marginTop: -20,
  },
  logIconContainer: {
    width: 56,
    height: 56,
    borderRadius: 28,
    backgroundColor: colors.primary,
    alignItems: 'center',
    justifyContent: 'center',
    ...shadows.md,
  },
  logIconContainerActive: {
    backgroundColor: colors.primaryDark,
    transform: [{ scale: 1.05 }],
  },
});
