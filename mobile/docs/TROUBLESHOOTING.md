# Troubleshooting Guide

Quick reference for common React Native build issues.

---

## Build Fails Immediately

### Metro Crashes on Start
```
Cannot read properties of undefined (reading 'handle')
```
**Fix:** CLI version mismatch. Reinstall with matching versions:
```bash
rm -rf node_modules package-lock.json
npm install
```

### Pod Install Fails
```
Unable to find a specification for `RNWorklets`
```
**Fix:** Missing worklets dependency for Reanimated 4:
```bash
npm install react-native-worklets
cd ios && pod install
```

---

## iOS Build Errors

### parentShadowView Error
```
no member named 'parentShadowView' in 'facebook::react::ShadowViewMutation'
```
**Fix:** Incompatible react-native-reanimated. Check version matrix in REACT_NATIVE_COMPATIBILITY.md.

### StyleLength Unit Error
```
no member named 'unit' in 'facebook::yoga::StyleLength'
```
**Fix:** Upgrade react-native-safe-area-context to 5.3.0+ and react-native-svg to 15.13.0+.

### Simulator Not Found
```
Unable to find a device matching the provided destination specifier
```
**Fix:** List available simulators and use correct name:
```bash
xcrun simctl list devices
npx react-native run-ios --simulator="iPhone 17 Pro"
```

---

## Runtime Errors

### Icons Show as "?"
**Fix:** Vector icon fonts not linked. Add to Info.plist:
```xml
<key>UIAppFonts</key>
<array>
  <string>Ionicons.ttf</string>
</array>
```
Then rebuild.

### Safe Area Returns 0
**Fix:** Known issue with certain RN/safe-area-context versions. Upgrade to latest compatible version.

### Navigation Crashes
**Fix:** Missing dependencies. Ensure all peer deps installed:
```bash
npm install react-native-screens react-native-safe-area-context react-native-gesture-handler
cd ios && pod install
```

---

## Nuclear Options

### Full Clean (Try This First)
```bash
npm run clean
# or manually:
watchman watch-del-all
rm -rf node_modules ios/Pods ios/Podfile.lock ios/build
npm install
cd ios && pod install && cd ..
npm start -- --reset-cache
```

### Clear Xcode Derived Data
```bash
rm -rf ~/Library/Developer/Xcode/DerivedData
```

### Fresh Project (Last Resort)
If nothing works, create fresh RN project and copy source:
```bash
# Backup
cp -r src ../src-backup
cp App.tsx ../App-backup.tsx

# Fresh init
cd ..
npx @react-native-community/cli@latest init NewApp --version 0.81.4

# Restore
cp -r src-backup NewApp/src
cp App-backup.tsx NewApp/App.tsx
```

---

## Quick Diagnostic Commands

```bash
# Check RN version
npx react-native --version

# Check installed packages
npm ls react-native react-native-reanimated react-native-screens

# Check peer dependency issues
npm ls 2>&1 | grep "peer dep"

# Check iOS build config
xcodebuild -showBuildSettings -workspace ios/*.xcworkspace -scheme Aurea | grep -E "(IPHONEOS|SDK)"

# Check available simulators
xcrun simctl list devices available
```

---

## When to Start Fresh

Consider rebuilding from scratch when:
- Multiple incompatible native modules
- Upgrading more than 2 minor RN versions
- Spent more than 2 hours debugging build errors
- Error messages reference internal RN files

See REACT_NATIVE_COMPATIBILITY.md for the fresh project approach.
