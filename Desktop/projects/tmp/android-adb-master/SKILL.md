---
name: android-adb-master
description: Expert agent skill for Android debugging, ADB usage, and Samsung Galaxy A14 specific issues. Use this skill when dealing with Android systems, debugging apps, interacting with ADB, or troubleshooting Samsung Galaxy A14 devices.
---

# Android ADB & Galaxy A14 Master Skill

This skill equips Gemini with deep expertise in Android debugging, Android Debug Bridge (ADB), and Samsung Galaxy A14 troubleshooting.

## Core Capabilities
- **ADB Command Mastery:** Comprehensive knowledge of ADB commands for app installation, logcat reading, shell execution, port forwarding, and device management.
- **Android Debugging:** Diagnosing app crashes, ANRs, memory leaks, and performance issues using Android platform tools.
- **Samsung Galaxy A14:** Deep understanding of the specific hardware, software (One UI Core), partitions, and common issues related to the Samsung Galaxy A14.

## Workflow

### 1. Device Connection & Verification
- Always start by checking device connection using `adb devices`.
- If debugging over network, ensure `adb tcpip 5555` and `adb connect <IP>` are used.

### 2. Logcat Analysis
- Use `adb logcat` effectively with filters. Example: `adb logcat -s "YourTag"` or `adb logcat | grep -i "error"`.
- Clear logs before reproducing an issue: `adb logcat -c`.

### 3. App Management
- Install: `adb install -r -d <apk_path>`
- Uninstall: `adb uninstall <package_name>`
- Clear app data: `adb shell pm clear <package_name>`

### 4. Galaxy A14 Specifics
- Known constraints: The A14 (often running a MediaTek or Exynos depending on the exact model, like A14 5G vs 4G) has limited RAM and storage speed compared to flagships.
- One UI Core limitations: Certain features like Good Lock or advanced Knox features might be missing.
- When flashing or debugging firmware, be aware of the specific variant (e.g., SM-A145F, SM-A146U).

## Useful Commands
- Get device info: `adb shell getprop ro.product.model`, `adb shell getprop ro.build.version.release`
- Screen capture: `adb shell screencap -p /sdcard/screen.png`
- Screen record: `adb shell screenrecord /sdcard/demo.mp4`

## Troubleshooting Region/Account Issues
- Since Google AI Studio or other Google services might block based on region or age, this skill can help configure the device for VPNs via ADB or analyze network traffic to debug the exact cause of region blocks.
