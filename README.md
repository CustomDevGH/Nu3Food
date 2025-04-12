# Nu3Food - Flutter Setup on Windows

This guide covers the basic steps to set up a Flutter development environment on a Windows machine from scratch.

## 1. Get the Flutter SDK

1.  Download the latest stable release of the Flutter SDK installation bundle from the [Flutter SDK releases page](https://docs.flutter.dev/get-started/install/windows#get-the-flutter-sdk).
2.  Extract the zip file and place the contained `flutter` folder in a desired installation location (e.g., `C:\src\flutter`). **Do not** install Flutter in a directory like `C:\Program Files\` that requires elevated privileges.

## 2. Change flutter version to 3.24.2

1. Navigate to the installation path (e.g, `C:\src\flutter`) and open terminal here.
2. Run this command:
```bash
git checkout 3.24.2
``` 
To change version to 3.24.2


## 2. Update Your Path Environment Variable

To run Flutter commands in the regular Windows console, you need to add the Flutter directory to your `PATH` environment variable:

1.  In the Start search bar, type 'env' and select **Edit the system environment variables**.
2.  Under **User variables**, check if there is an entry called `Path`:
    *   If the entry exists, append the full path to `flutter\bin` using `;` as a separator from existing values (e.g., `;C:\src\flutter\bin`).
    *   If the entry does not exist, create a new user variable named `Path` with the full path to `flutter\bin` as its value (e.g., `C:\src\flutter\bin`).
3.  You need to close and reopen any existing console windows for these changes to take effect.

## 3. Run Flutter Doctor

Open a new Command Prompt or PowerShell window and run the following command to see if there are any platform dependencies you need to complete the setup:

```bash
flutter doctor
```

This command checks your environment and displays a report. Look for the output to see if any additional software is required or tasks need to be performed (often indicated by `[!]` or `[X]`).

## 4. Android Setup

To develop Flutter apps for Android, you need Android Studio.

1.  Download and install [Android Studio](https://developer.android.com/studio).
2.  Run Android Studio. Go through the 'Android Studio Setup Wizard'. This installs the latest Android SDK, Android SDK Command-line Tools, and Android SDK Build-Tools, which are required by Flutter when developing for Android.
3.  Run `flutter doctor` again to confirm that Flutter has located your Android Studio installation. If Flutter cannot locate it, run `flutter config --android-studio-dir <directory>` to set the directory where Android Studio is installed.
4.  **Android Licenses:** Run `flutter doctor --android-licenses` and follow the prompts to accept the necessary licenses.
5.  **Set up an Android device:**
    *   **Emulator:** In Android Studio, go to **Tools > Device Manager** (or the corresponding icon) and create a new Virtual Device (AVD).
    *   **Physical Device:** Enable Developer options and USB debugging on your device. Install the Google USB Driver if necessary. Connect the device to your computer via USB. Authorize your computer to access the device if prompted.

## 5. Install Visual Studio Code

1.  Download and install [Visual Studio Code](https://code.visualstudio.com/).
2.  Install the **Flutter** extension from the VS Code Marketplace (this will also install the required **Dart** extension).

## 6. Verify Setup

Run `flutter doctor` one last time. If it reports no issues (`[✓]`), you're ready to start developing with Flutter! You should see at least checkmarks for Flutter, Windows version, Android toolchain, Chrome (if installed), and Connected device.

## 7. Run application
1. Get packages (only needed once)
```bash
flutter pub get
```
2. Run application 
```bash
flutter run
```
