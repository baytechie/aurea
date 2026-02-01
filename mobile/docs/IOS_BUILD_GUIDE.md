# iOS Build Guide

Step-by-step instructions for building and running the Aurea iOS app.

---

## Prerequisites

- **macOS** (required for iOS development)
- **Xcode 26** or later (with iOS 26 SDK)
- **Node.js 18+** (recommend using fnm or nvm for version management)
- **CocoaPods** (`sudo gem install cocoapods`)
- **Watchman** (`brew install watchman`)

---

## Initial Setup

### 1. Install Dependencies

```bash
cd /Users/bala/aurea/mobile
npm install
```

### 2. Install iOS Pods

```bash
cd ios
pod install
cd ..
```

### 3. Start Metro Bundler

```bash
npm start
```

### 4. Build and Run (in separate terminal)

```bash
npm run ios
# or specify simulator:
npx react-native run-ios --simulator="iPhone 17 Pro"
```

---

## Available Simulators

List available simulators:
```bash
xcrun simctl list devices available
```

Common options (iOS 26.2):
- iPhone 17 Pro
- iPhone 17 Pro Max
- iPhone 17
- iPhone 16e
- iPad Pro 13-inch (M5)

---

## Build Commands

| Command | Description |
|---------|-------------|
| `npm run ios` | Build and run on default simulator |
| `npm run start` | Start Metro bundler |
| `npm run start:reset` | Start Metro with cache reset |
| `npm run pod-install` | Install CocoaPods dependencies |
| `npm run clean:ios` | Clean iOS build and reinstall pods |
| `npm run clean` | Full clean (node_modules, pods, watchman) |

---

## Building for Release

```bash
# Build release configuration
npx react-native build-ios --mode Release

# Or using Xcode:
# 1. Open ios/AureaMobile.xcworkspace in Xcode
# 2. Select "Any iOS Device" as target
# 3. Product > Archive
```

---

## Configuration Files

| File | Purpose |
|------|---------|
| `ios/Podfile` | CocoaPods dependencies |
| `ios/AureaMobile/Info.plist` | iOS app configuration |
| `app.json` | React Native app metadata |
| `babel.config.js` | Babel transpiler config |
| `metro.config.js` | Metro bundler config |

---

## Minimum Requirements

- **iOS Deployment Target:** 15.1
- **React Native:** 0.81.4
- **Xcode:** 26+
- **Node.js:** 18+

---

## Troubleshooting

### Build fails after pulling changes
```bash
npm run clean
npm run ios
```

### Pods out of sync
```bash
npm run clean:ios
```

### Metro cache issues
```bash
npm run start:reset
```

### Xcode build errors
1. Open `ios/AureaMobile.xcworkspace` in Xcode
2. Product > Clean Build Folder (Cmd+Shift+K)
3. Build (Cmd+B)

See [TROUBLESHOOTING.md](./TROUBLESHOOTING.md) for more solutions.

---

## Development Workflow

1. Start Metro: `npm start`
2. Run app: `npm run ios` (or press `i` in Metro terminal)
3. Enable Fast Refresh in app (shake device or Cmd+D)
4. Make changes - app reloads automatically

### Debugging

- **Chrome DevTools:** Cmd+D in simulator > "Debug with Chrome"
- **React DevTools:** `npx react-devtools`
- **Console Logs:** Visible in Metro terminal

---

## Version Info

| Component | Version |
|-----------|---------|
| React Native | 0.81.4 |
| React | 19.1.0 |
| iOS SDK | 26.2 |
| Min iOS | 15.1 |

See [REACT_NATIVE_COMPATIBILITY.md](./REACT_NATIVE_COMPATIBILITY.md) for full version matrix.
