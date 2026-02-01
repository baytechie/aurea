# React Native Compatibility Guide

This document captures critical learnings from troubleshooting React Native build issues. Use this as a reference for future upgrades and debugging.

---

## Quick Reference: Working Version Matrix

**Last Updated:** January 2026
**React Native:** 0.81.4
**iOS SDK:** 26.2
**Xcode:** 26

```json
{
  "dependencies": {
    "react": "19.1.0",
    "react-native": "0.81.4",
    "@react-native-async-storage/async-storage": "2.1.2",
    "@react-native-community/slider": "5.0.0",
    "@react-navigation/bottom-tabs": "7.2.1",
    "@react-navigation/native": "7.0.15",
    "@react-navigation/native-stack": "7.2.1",
    "@tanstack/react-query": "5.62.0",
    "axios": "1.7.9",
    "lodash": "4.17.21",
    "react-native-gesture-handler": "2.28.0",
    "react-native-reanimated": "4.2.0",
    "react-native-safe-area-context": "5.6.2",
    "react-native-screens": "4.16.0",
    "react-native-svg": "15.13.0",
    "react-native-vector-icons": "10.2.0",
    "react-native-worklets": "0.7.2",
    "zustand": "5.0.2"
  }
}
```

---

## Critical Compatibility Rules

### 1. iOS SDK / Xcode Compatibility

| React Native | Minimum iOS | Max Xcode | iOS SDK Support |
|--------------|-------------|-----------|-----------------|
| 0.78.x | 15.1 | 16.x | iOS 18 and below |
| 0.79.x | 15.1 | 16.x | iOS 18 and below |
| 0.80.x | 15.1 | 26.x | iOS 26 |
| **0.81.x** | 15.1 | 26.x | **iOS 26** |

**Key Learning:** React Native 0.78 is NOT compatible with iOS 26 SDK / Xcode 26. If you have Xcode 26 with iOS 26 simulators, you MUST use RN 0.80+ (preferably 0.81+).

### 2. React Native Reanimated Compatibility

| Reanimated | RN 0.78 | RN 0.79 | RN 0.80 | RN 0.81 |
|------------|---------|---------|---------|---------|
| 3.x | Yes | No | No | No |
| 4.0.x | Yes | Yes | Yes | No |
| 4.1.x | Yes | Yes | Yes | Yes |
| **4.2.x** | No | No | Yes | **Yes** |

**Key Learning:** Reanimated 4.x requires `react-native-worklets` as a peer dependency.

### 3. Babel Plugin Change (CRITICAL)

For Reanimated 4.x, the babel plugin changed:

```javascript
// OLD (Reanimated 3.x) - DO NOT USE WITH REANIMATED 4
plugins: ['react-native-reanimated/plugin']

// NEW (Reanimated 4.x) - REQUIRED
plugins: ['react-native-worklets/plugin']
```

### 4. react-native-svg Compatibility

| react-native-svg | Required React Native |
|------------------|----------------------|
| 15.9.0 | NOT compatible with RN 0.78+ |
| **15.13.0+** | **RN 0.78+** |

**Key Learning:** react-native-svg 15.9.0 causes build failures with "StyleLength" errors. Must use 15.13.0+.

### 5. react-native-screens Compatibility

| react-native-screens | React Native |
|---------------------|--------------|
| 4.4.0 | RN 0.76 only |
| 4.10.0+ | RN 0.78+ |
| **4.16.0+** | **RN 0.81+** |

---

## Common Build Errors and Solutions

### Error 1: Metro Bundler Crash
```
Cannot read properties of undefined (reading 'handle')
```
**Cause:** `@react-native-community/cli` version mismatch with React Native version.
**Solution:** Ensure CLI version matches RN version (e.g., CLI 15.x for RN 0.78, CLI 16.x for RN 0.81).

### Error 2: parentShadowView Not Found
```
error: no member named 'parentShadowView' in 'facebook::react::ShadowViewMutation'
```
**Cause:** react-native-reanimated version incompatible with RN/iOS SDK.
**Solution:** Upgrade reanimated to version compatible with your RN version.

### Error 3: StyleLength Unit Error
```
error: no member named 'unit' in 'facebook::yoga::StyleLength'
```
**Cause:** react-native-safe-area-context or react-native-svg using outdated Yoga API.
**Solution:** Upgrade to latest compatible versions (safe-area-context 5.3.0+, svg 15.13.0+).

### Error 4: RNWorklets Not Found
```
Unable to find a specification for `RNWorklets` depended upon by `RNReanimated`
```
**Cause:** Missing react-native-worklets dependency required by Reanimated 4.
**Solution:** Add `"react-native-worklets": "0.7.2"` to dependencies.

### Error 5: Simulator Not Found
```
Unable to find a device matching the provided destination specifier
```
**Cause:** Specified simulator doesn't exist.
**Solution:** Run `xcrun simctl list devices` to see available simulators.

---

## Recommended Upgrade Process

When upgrading React Native versions:

1. **Research First**
   - Check React Native release notes
   - Check compatibility docs for each native module:
     - [Reanimated Compatibility](https://docs.swmansion.com/react-native-reanimated/docs/guides/compatibility/)
     - [react-native-screens Releases](https://github.com/software-mansion/react-native-screens/releases)
     - [react-native-svg Compatibility](https://github.com/software-mansion/react-native-svg)

2. **Fresh Project Approach (Recommended for Major Upgrades)**
   ```bash
   # Backup source
   mkdir -p backup && cp -r src App.tsx backup/

   # Create fresh project
   npx @react-native-community/cli@latest init AppName --version X.XX.X

   # Restore source
   cp -r backup/src . && cp backup/App.tsx .
   ```

3. **Always Clean After Dependency Changes**
   ```bash
   # Clean everything
   rm -rf node_modules ios/Pods ios/Podfile.lock ios/build
   npm install
   cd ios && pod install && cd ..

   # Reset Metro cache
   npm start -- --reset-cache
   ```

---

## iOS-Specific Configuration

### Vector Icons Setup

Add to `ios/[AppName]/Info.plist`:
```xml
<key>UIAppFonts</key>
<array>
  <string>Ionicons.ttf</string>
  <string>MaterialIcons.ttf</string>
  <string>MaterialCommunityIcons.ttf</string>
  <string>FontAwesome.ttf</string>
  <string>FontAwesome5_Brands.ttf</string>
  <string>FontAwesome5_Regular.ttf</string>
  <string>FontAwesome5_Solid.ttf</string>
</array>
```

### Minimum iOS Version

Set in `ios/Podfile`:
```ruby
platform :ios, '15.1'  # Minimum for RN 0.76+
```

---

## Troubleshooting Commands

```bash
# Check available simulators
xcrun simctl list devices

# Clean iOS build
cd ios && rm -rf Pods Podfile.lock build && pod install && cd ..

# Reset Metro cache
npx react-native start --reset-cache

# Full nuclear clean
watchman watch-del-all
rm -rf node_modules ios/Pods ios/Podfile.lock ios/build
rm -rf ~/Library/Developer/Xcode/DerivedData
npm install
cd ios && pod install && cd ..

# Check React Native doctor
npx react-native doctor
```

---

## Version Support Status

As of January 2026:
- **RN 0.78.x** - End of Life (unsupported)
- **RN 0.79.x** - End of Life (unsupported)
- **RN 0.80.x** - Maintenance
- **RN 0.81.x** - Current (recommended)

Check [React Native Releases Support](https://github.com/reactwg/react-native-releases/blob/main/docs/support.md) for latest status.

---

## Lessons Learned

1. **Don't fight version incompatibility** - If something isn't working after multiple attempts, research compatibility matrices instead of trying quick fixes.

2. **iOS SDK version matters** - Your Xcode/iOS SDK version constrains which RN versions you can use.

3. **Fresh project > upgrade in place** - For major RN upgrades, creating a fresh project and copying source is faster and more reliable.

4. **Native modules are the pain point** - Most build issues come from native modules (reanimated, screens, svg) not being compatible with RN version.

5. **Babel config changes break silently** - Wrong babel plugin causes Metro to crash with unhelpful errors.

6. **Always check peer dependencies** - `npm ls` and careful reading of warnings during install reveals version conflicts.
