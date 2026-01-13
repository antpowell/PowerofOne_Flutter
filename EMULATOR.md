# How to run Power of One on an emulator

[Android Developer Instructions](https://developer.android.com/studio/run/emulator)

# Testing on Android Emulator

This guide provides instructions for setting up and running the application on an Android emulator using Windows.

## Prerequisites

- Android SDK installed on your machine
- Android Studio installed (for creating emulators via GUI)
- VS Code with appropriate Android development extensions
- Java Development Kit (JDK) installed

## Step 1: Create an Android Virtual Device (AVD)

### Option A: Create via Android Studio (Recommended for Beginners)

1. Open Android Studio
2. Click on the **AVD Manager** icon in the toolbar (or go to **Tools > Device Manager**)
3. Click the **Create Device** button
4. Select a device (e.g., Pixel 4, Pixel 5, or similar)
5. Click **Next**
6. Select an Android API level (e.g., API 30 or higher)
7. Click **Next**
8. Review the configuration and click **Finish**
9. Note the AVD name (you'll need this to launch it from the terminal)

### Option B: Create via Terminal

If you prefer using the command line, you first need to list available system images, then create the AVD.

#### Step 1: List Available System Images

Run the following command to see all available system images:

```bash
sdkmanager --list | findstr "system-image"
```

This will display output similar to:

```
system-images;windows;google_apis;android-30
system-images;windows;google_apis;android-31
system-images;windows;google_apis;android-32
system-images;windows;google_apis_playstore;android-30
system-images;windows;default;android-30
```

#### Step 2: Create the AVD

Once you've chosen your desired system image from the list above, run:

```bash
avdmanager create avd -n <avd_name> -k "system-images;windows;google_apis;<api_level>"
```

Replace the following:
- `<avd_name>`: Your desired AVD name (e.g., `Pixel_4_API_30`)
- `google_apis`: Choose from the options in your system image list (e.g., `google_apis`, `google_apis_playstore`, or `default`)
- `<api_level>`: The API level (e.g., `android-30`, `android-31`, `android-32`)

**Example:**

```bash
avdmanager create avd -n MyEmulator -k "system-images;windows;google_apis;android-30"
```

#### Available Options Reference

**Common API Levels:**
- `android-28` (Android 9)
- `android-29` (Android 10)
- `android-30` (Android 11)
- `android-31` (Android 12)
- `android-32` (Android 13)
- `android-33` (Android 14)
- `android-34` (Android 15)

**System Image Variants:**
- `google_apis` - Includes Google Play Services
- `google_apis_playstore` - Includes Google Play Store
- `default` - Stock Android without Google apps

## Step 2: Start the Emulator

### Launch from Android Studio

1. Open Android Studio's AVD Manager
2. Click the **Play** button next to your created AVD
3. Wait for the emulator to fully load (this may take a few minutes)

### Launch from Terminal

Open a terminal (Command Prompt or PowerShell) and run:

```bash
emulator -avd <avd_name>
```

Replace `<avd_name>` with your AVD's name. For example:

```bash
emulator -avd Pixel_4_API_30
```

**To find your AVD name**, run:

```bash
emulator -list-avds
```

#### Setting Up for Easy Terminal Access (Optional)

Add the Android SDK emulator to your system PATH:

1. Open **Environment Variables** in Windows
2. Add the following path to your `PATH` variable: `C:\Users\[YourUsername]\AppData\Local\Android\Sdk\emulator`
3. Restart your terminal for changes to take effect

Once set up, you can launch the emulator from any directory:

```bash
emulator -avd Pixel_4_API_30
```

## Step 3: Run Your Application on the Emulator

### From VS Code

1. Ensure the emulator is running
2. Open the integrated terminal in VS Code
3. Run your project using your build command (e.g., `npm start`, `flutter run`, `react-native run-android`, etc.)
4. The app should automatically detect the running emulator and install/run on it

### From Terminal

1. Ensure the emulator is running
2. Navigate to your project directory
3. Run your application with your project's run command:

```bash
npm start
```

or for Flutter:

```bash
flutter run
```

or for React Native:

```bash
react-native run-android
```

## Useful Emulator Commands

### Launch with additional options:

```bash
# Allocate more RAM
emulator -avd <avd_name> -memory 2048

# Enable GPU acceleration
emulator -avd <avd_name> -gpu on

# Disable audio
emulator -avd <avd_name> -no-audio

# Combine options
emulator -avd <avd_name> -memory 2048 -gpu on -no-audio
```

### Other helpful commands:

```bash
# List all available AVDs
emulator -list-avds

# Kill all running emulators
adb emu kill
```

## Troubleshooting

- **Emulator won't start:** Ensure virtualization is enabled in your BIOS/UEFI settings
- **App won't install:** Check that the emulator is fully booted by checking `adb devices`
- **Slow emulator:** Try enabling GPU acceleration with `-gpu on` or allocating more memory with `-memory 2048`
- **Port already in use:** Kill existing emulator processes and restart

## Additional Resources

- [Android Studio Documentation](https://developer.android.com/studio)
- [Android Emulator Documentation](https://developer.android.com/studio/run/emulator)
- [ADB (Android Debug Bridge) Guide](https://developer.android.com/studio/command-line/adb)