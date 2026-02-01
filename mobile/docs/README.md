# Aurea Mobile Documentation

Documentation for the Aurea React Native mobile application.

---

## Quick Links

| Document | Description |
|----------|-------------|
| [IOS_BUILD_GUIDE.md](./IOS_BUILD_GUIDE.md) | How to build and run the iOS app |
| [API_CONFIGURATION.md](./API_CONFIGURATION.md) | Backend API connection and endpoints |
| [REACT_NATIVE_COMPATIBILITY.md](./REACT_NATIVE_COMPATIBILITY.md) | Version compatibility matrix and upgrade guide |
| [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) | Common errors and solutions |

---

## Current Stack

| Technology | Version | Purpose |
|------------|---------|---------|
| React Native | 0.81.4 | Mobile framework |
| React | 19.1.0 | UI library |
| TypeScript | 5.7.2 | Type safety |
| React Navigation | 7.x | Navigation |
| React Query | 5.62.0 | Data fetching |
| Zustand | 5.0.2 | State management |
| Reanimated | 4.2.0 | Animations |

---

## Project Structure

```
mobile/
├── App.tsx              # Root component
├── index.js             # Entry point
├── app.json             # App metadata
├── package.json         # Dependencies
├── babel.config.js      # Babel config (worklets plugin)
├── metro.config.js      # Metro bundler config
├── tsconfig.json        # TypeScript config
├── src/
│   ├── assets/          # Images, fonts
│   ├── components/      # Reusable components
│   ├── hooks/           # Custom hooks (useAuth, etc.)
│   ├── lib/             # Utilities (API client, etc.)
│   ├── navigation/      # Navigation setup
│   └── screens/         # Screen components
├── ios/                 # iOS native project
│   ├── Podfile          # CocoaPods deps
│   └── AureaMobile/     # iOS app files
├── android/             # Android native project
└── docs/                # Documentation (you are here)
```

---

## Getting Started

```bash
# Install dependencies
npm install

# Install iOS pods
cd ios && pod install && cd ..

# Start Metro bundler
npm start

# Run on iOS simulator
npm run ios
```

---

## Key Files to Know

### Configuration
- `babel.config.js` - Must use `react-native-worklets/plugin` for Reanimated 4
- `ios/Podfile` - iOS dependencies, platform version
- `ios/AureaMobile/Info.plist` - iOS permissions, vector icon fonts

### Source Code
- `App.tsx` - Providers setup (GestureHandler, SafeArea, Navigation, Query)
- `src/navigation/RootNavigator.tsx` - Screen routing
- `src/lib/api.ts` - Backend API configuration
- `src/hooks/useAuth.tsx` - Authentication state

---

## Before Upgrading

1. Read [REACT_NATIVE_COMPATIBILITY.md](./REACT_NATIVE_COMPATIBILITY.md)
2. Check official React Native release notes
3. Verify all native module compatibility
4. Consider fresh project approach for major upgrades

---

## Support

For build issues, see [TROUBLESHOOTING.md](./TROUBLESHOOTING.md).
