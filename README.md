# power_one

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Running on different system

When running this application on a different system from the one it was created on or when upon getting a "FAILURE: Build failed with an exception." message.

- First update flutter packages with

  - `flutter pub get`

- Then the flutter project with

  - `flutter clean`
  - best used from terminal with admin rights

- And finally you should be able to run the flutter application with
  - `flutter run`

## iOS

- id: com.powerofone.basketball

### M1 Mac

```bash
sudo arch -x86_64 gem install ffi
arch -x86_64 pod repo update
arch -x86_64 pod install
```

## Android

id: com.power_of_one.basketball

### Build

- [Flutter docs](https://docs.flutter.dev/deployment/android)

#### iOS

From inside the ios folder

- run `pod install`
M1
- run `arch -x86_64 pod install`
- `flutter build ipa --release`
- navigate to the ios build folder `/Users/anthonypowell/Engineering/PowerofOne_Flutter/build/ios/archive/`
- click the archive file `Runner.xcarchive`

#### Android

- run `flutter build appbundle`
- navigate to [Google Play Console release tab](https://play.google.com/console/u/0/developers/6443463758289469480/app/4976145265421419016/tracks/production?tab=releases) in the browser
- click "Create new release" button in the top right of the page
- navigate to `build\app\outputs\bundle\release` and click and drag the `app-release.aab` file to the "App bundles" section of the Google Play Console release tab from above steps.

#### Build Errors

```bash
/bin/sh: /packages/flutter_tools/bin/xcode_backend.sh: No such file or directory
Command PhaseScriptExecution failed with a nonzero exit code
```

This error appears when trying to Archive the app from within xCode. **This is not the correct way to build for ios.**

#### for development

- on physical device
  - connect device that has developer mode unlocked and usb debugging enabled
  - run `flutter install`

#### for production

##### Android

- run `flutter build appbundle`

##### iOS

- run `flutter build ipa`

### Downloads

- Flutter
- Android Studio
- xCode

## Secure config files

### Using Codemagic (Loading Firebase configuration)

- [article](https://docs.codemagic.io/variables/environment-variable-groups/#storing-sensitive-valuesfiles)

Commands

General

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("your_file_name_.extension")) | Set-Clipboard
```

Mine

- ios

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("D:\Engineering\PowerofOne_Flutter\ios\Runner\Info.plist")) | Set-Clipboard
```

- android

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("D:\Engineering\PowerofOne_Flutter\android\app\google-services.json")) | Set-Clipboard
```
