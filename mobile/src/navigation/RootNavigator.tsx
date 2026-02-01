import React from 'react';
import { View, Text, ActivityIndicator, StyleSheet, TouchableOpacity } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import { useNavigation } from '@react-navigation/native';
import { useSafeAreaInsets } from 'react-native-safe-area-context';
import Icon from 'react-native-vector-icons/Ionicons';

import { useAuth } from '../hooks/useAuth';
import { colors, typography, spacing, borderRadius } from '../theme';

// Auth Screens
import LoginScreen from '../screens/LoginScreen';
import SignupScreen from '../screens/SignupScreen';
import WelcomeScreen from '../screens/WelcomeScreen';

// Main Screens
import HomeScreen from '../screens/HomeScreen';
import SearchScreen from '../screens/SearchScreen';
import LogScreen from '../screens/LogScreen';
import InsightsScreen from '../screens/InsightsScreen';
import ProfileScreen from '../screens/ProfileScreen';
import IngredientDetailScreen from '../screens/IngredientDetailScreen';

// Components
import { AnimatedTabBar } from '../components';

// Custom Header Component for consistent branding
function AureaHeader({ title }: { title?: string }) {
  const insets = useSafeAreaInsets();

  return (
    <View style={[styles.headerContainer, { paddingTop: insets.top + spacing.sm }]}>
      <View style={styles.headerLogoRow}>
        <View style={styles.headerLogoIcon}>
          <Icon name="leaf" size={18} color={colors.primary} />
        </View>
        <Text style={styles.headerLogoText}>{title || 'Aurea'}</Text>
      </View>
    </View>
  );
}

// Custom Header with Back Button
function AureaHeaderWithBack({ title }: { title?: string }) {
  const navigation = useNavigation();
  const insets = useSafeAreaInsets();

  return (
    <View style={[styles.headerContainer, { paddingTop: insets.top + spacing.sm }]}>
      <View style={styles.headerLogoRow}>
        <TouchableOpacity
          onPress={() => navigation.goBack()}
          style={styles.backButton}
          accessibilityLabel="Go back"
        >
          <Icon name="chevron-back" size={24} color={colors.textPrimary} />
        </TouchableOpacity>
        <View style={styles.headerLogoIcon}>
          <Icon name="leaf" size={18} color={colors.primary} />
        </View>
        <Text style={styles.headerLogoText}>{title || 'Aurea'}</Text>
      </View>
    </View>
  );
}

// Type definitions
export type RootStackParamList = {
  Welcome: undefined;
  Login: undefined;
  Signup: undefined;
  MainTabs: undefined;
};

export type HomeStackParamList = {
  HomeMain: undefined;
  IngredientDetail: { name: string };
};

export type SearchStackParamList = {
  SearchMain: undefined;
  IngredientDetail: { name: string };
};

export type MainTabsParamList = {
  Home: undefined;
  Search: undefined;
  Log: undefined;
  Insights: undefined;
  Profile: undefined;
};

const RootStack = createNativeStackNavigator<RootStackParamList>();
const HomeStackNav = createNativeStackNavigator<HomeStackParamList>();
const SearchStackNav = createNativeStackNavigator<SearchStackParamList>();
const Tab = createBottomTabNavigator<MainTabsParamList>();

// Home Stack - includes detail screens so tab bar stays visible
function HomeStack() {
  return (
    <HomeStackNav.Navigator
      screenOptions={{
        headerShown: true,
        animation: 'slide_from_right',
      }}
    >
      <HomeStackNav.Screen
        name="HomeMain"
        component={HomeScreen}
        options={{
          header: () => <AureaHeader title="Aurea" />,
        }}
      />
      <HomeStackNav.Screen
        name="IngredientDetail"
        component={IngredientDetailScreen}
        options={{
          header: () => <AureaHeaderWithBack title="Details" />,
        }}
      />
    </HomeStackNav.Navigator>
  );
}

// Search Stack - includes detail screens so tab bar stays visible
function SearchStack() {
  return (
    <SearchStackNav.Navigator
      screenOptions={{
        headerShown: true,
        animation: 'slide_from_right',
      }}
    >
      <SearchStackNav.Screen
        name="SearchMain"
        component={SearchScreen}
        options={{
          header: () => <AureaHeader title="Search" />,
        }}
      />
      <SearchStackNav.Screen
        name="IngredientDetail"
        component={IngredientDetailScreen}
        options={{
          header: () => <AureaHeaderWithBack title="Details" />,
        }}
      />
    </SearchStackNav.Navigator>
  );
}

// Main Tab Navigator
function MainTabs() {
  return (
    <Tab.Navigator
      tabBar={(props) => <AnimatedTabBar {...props} />}
      screenOptions={{
        headerShown: false,
      }}
    >
      <Tab.Screen name="Home" component={HomeStack} />
      <Tab.Screen name="Search" component={SearchStack} />
      <Tab.Screen
        name="Log"
        component={LogScreen}
        options={{
          headerShown: true,
          header: () => <AureaHeader title="Log" />,
        }}
      />
      <Tab.Screen
        name="Insights"
        component={InsightsScreen}
        options={{
          headerShown: true,
          header: () => <AureaHeader title="Insights" />,
        }}
      />
      <Tab.Screen
        name="Profile"
        component={ProfileScreen}
        options={{
          headerShown: true,
          header: () => <AureaHeader title="Profile" />,
        }}
      />
    </Tab.Navigator>
  );
}

// Loading Screen Component
function LoadingScreen() {
  return (
    <View style={styles.loadingContainer}>
      <ActivityIndicator size="large" color={colors.primary} />
    </View>
  );
}

export default function RootNavigator() {
  const { isAuthenticated, isLoading } = useAuth();

  if (isLoading) {
    return <LoadingScreen />;
  }

  return (
    <RootStack.Navigator
      screenOptions={{
        headerShown: false,
        animation: 'slide_from_right',
      }}
    >
      {isAuthenticated ? (
        <RootStack.Screen name="MainTabs" component={MainTabs} />
      ) : (
        <>
          <RootStack.Screen name="Welcome" component={WelcomeScreen} />
          <RootStack.Screen
            name="Login"
            component={LoginScreen}
            options={{
              headerShown: true,
              headerShadowVisible: false,
              header: () => <AureaHeaderWithBack title="Log In" />,
            }}
          />
          <RootStack.Screen
            name="Signup"
            component={SignupScreen}
            options={{
              headerShown: true,
              headerShadowVisible: false,
              header: () => <AureaHeaderWithBack title="Sign Up" />,
            }}
          />
        </>
      )}
    </RootStack.Navigator>
  );
}

const styles = StyleSheet.create({
  loadingContainer: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: colors.white,
  },
  headerContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: spacing.lg,
    paddingBottom: spacing.md,
    backgroundColor: colors.white,
    borderBottomWidth: 1,
    borderBottomColor: colors.borderLight,
  },
  headerLogoRow: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  headerLogoIcon: {
    width: 32,
    height: 32,
    borderRadius: borderRadius.md,
    backgroundColor: colors.primaryBackground,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: spacing.sm,
  },
  headerLogoText: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.textPrimary,
  },
  backButton: {
    marginRight: spacing.sm,
    padding: spacing.xs,
  },
});
