# architecture_sample

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

```
architecture_homework
├─ .git
│  ├─ COMMIT_EDITMSG
│  ├─ config
│  ├─ description
│  ├─ FETCH_HEAD
│  ├─ HEAD
│  ├─ hooks
│  │  ├─ applypatch-msg.sample
│  │  ├─ commit-msg.sample
│  │  ├─ fsmonitor-watchman.sample
│  │  ├─ post-update.sample
│  │  ├─ pre-applypatch.sample
│  │  ├─ pre-commit.sample
│  │  ├─ pre-merge-commit.sample
│  │  ├─ pre-push.sample
│  │  ├─ pre-rebase.sample
│  │  ├─ pre-receive.sample
│  │  ├─ prepare-commit-msg.sample
│  │  ├─ push-to-checkout.sample
│  │  └─ update.sample
│  ├─ index
│  ├─ info
│  │  └─ exclude
│  ├─ logs
│  │  ├─ HEAD
│  │  └─ refs
│  │     ├─ heads
│  │     │  └─ main
│  │     └─ remotes
│  │        └─ origin
│  │           ├─ HEAD
│  │           └─ main
│  ├─ objects
│  │  ├─ 07
│  │  │  └─ 86fe603fc6bc4e2e4b0af20f503823840463a2
│  │  ├─ 18
│  │  │  └─ a4f9016a94565f0679d88a079e03e34d89ff67
│  │  ├─ 45
│  │  │  └─ c2604a86503c8c57997796d0cbf342036e805e
│  │  ├─ 53
│  │  │  └─ ce75b6fbaaf6be5bd80da4159533cc9b4150a7
│  │  ├─ 5a
│  │  │  └─ 6c26bf29b3d43fa6d3fa37e57904b8e2688d66
│  │  ├─ 6a
│  │  │  └─ a6b0a5aaf13281a0f31ca665da311650a58467
│  │  ├─ 71
│  │  │  └─ 3d7f6e6d4a3d3479b5965d6aa5c1b72deedc7f
│  │  ├─ 86
│  │  │  └─ eb9d6be64e1326fc927c3dc7ea9d7e542903f1
│  │  ├─ 87
│  │  │  └─ 676d229531f09b10fa0b6cba04c8d73b228716
│  │  ├─ 92
│  │  │  └─ c7be38c9b670bcd8f78caeec0b6227c3e42dc6
│  │  ├─ 9f
│  │  │  └─ 4d92de9a753cdde2c86c501793121a3134e1b6
│  │  ├─ d2
│  │  │  └─ b283e8a35d0cb6dd58eacd6147064aaf7c1195
│  │  ├─ ee
│  │  │  └─ f03a6626d3e85d16975ad7b8755cb11c72bdab
│  │  ├─ fc
│  │  │  └─ 9edbd17073345debd5067f63e044e3931a6ffd
│  │  ├─ info
│  │  └─ pack
│  │     ├─ pack-cf6d2141dae624721e177db773ed6fca11f674fb.idx
│  │     └─ pack-cf6d2141dae624721e177db773ed6fca11f674fb.pack
│  ├─ ORIG_HEAD
│  ├─ packed-refs
│  └─ refs
│     ├─ heads
│     │  └─ main
│     ├─ remotes
│     │  └─ origin
│     │     ├─ HEAD
│     │     └─ main
│     └─ tags
├─ .gitignore
├─ .metadata
├─ analysis_options.yaml
├─ android
│  ├─ .gitignore
│  ├─ .gradle
│  │  ├─ 7.5
│  │  │  ├─ checksums
│  │  │  │  ├─ checksums.lock
│  │  │  │  ├─ md5-checksums.bin
│  │  │  │  └─ sha1-checksums.bin
│  │  │  ├─ dependencies-accessors
│  │  │  │  ├─ dependencies-accessors.lock
│  │  │  │  └─ gc.properties
│  │  │  ├─ executionHistory
│  │  │  │  ├─ executionHistory.bin
│  │  │  │  └─ executionHistory.lock
│  │  │  ├─ fileChanges
│  │  │  │  └─ last-build.bin
│  │  │  ├─ fileHashes
│  │  │  │  ├─ fileHashes.bin
│  │  │  │  ├─ fileHashes.lock
│  │  │  │  └─ resourceHashesCache.bin
│  │  │  ├─ gc.properties
│  │  │  └─ vcsMetadata
│  │  ├─ buildOutputCleanup
│  │  │  ├─ buildOutputCleanup.lock
│  │  │  ├─ cache.properties
│  │  │  └─ outputFiles.bin
│  │  ├─ file-system.probe
│  │  └─ vcs-1
│  │     └─ gc.properties
│  ├─ app
│  │  ├─ build.gradle
│  │  └─ src
│  │     ├─ debug
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ java
│  │     │  │  └─ io
│  │     │  │     └─ flutter
│  │     │  │        └─ plugins
│  │     │  │           └─ GeneratedPluginRegistrant.java
│  │     │  ├─ kotlin
│  │     │  │  └─ com
│  │     │  │     └─ example
│  │     │  │        └─ architecture_sample
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res
│  │     │     ├─ drawable
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable-v21
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-hdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-xxxhdpi
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ values
│  │     │     │  └─ styles.xml
│  │     │     └─ values-night
│  │     │        └─ styles.xml
│  │     └─ profile
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle
├─ appstore_credentials.env
├─ ios
│  ├─ .gitignore
│  ├─ Flutter
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  ├─ flutter_export_environment.sh
│  │  ├─ Generated.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Podfile
│  ├─ Podfile.lock
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  ├─ AppIcon.appiconset
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ GeneratedPluginRegistrant.h
│  │  ├─ GeneratedPluginRegistrant.m
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  ├─ contents.xcworkspacedata
│  │  │  └─ xcshareddata
│  │  │     ├─ IDEWorkspaceChecks.plist
│  │  │     └─ WorkspaceSettings.xcsettings
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  └─ Runner.xcworkspace
│     ├─ contents.xcworkspacedata
│     └─ xcshareddata
│        ├─ IDEWorkspaceChecks.plist
│        └─ WorkspaceSettings.xcsettings
├─ lib
│  ├─ application
│  │  └─ cats_wiki_app.dart
│  ├─ breeds_list
│  │  ├─ breeds_list_controller.dart
│  │  ├─ breeds_list_page.dart
│  │  ├─ breed_controller.dart
│  │  ├─ breed_page.dart
│  │  ├─ models
│  │  │  └─ breed.dart
│  │  └─ widgets
│  │     └─ breed_card.dart
│  ├─ main.dart
│  ├─ network
│  │  ├─ dio_client.dart
│  │  ├─ responses
│  │  │  ├─ breed_response.dart
│  │  │  └─ breed_response.g.dart
│  │  └─ services
│  │     └─ breeds_api_service.dart
│  └─ repositories
│     └─ breeds_search_repository.dart
├─ linux
│  ├─ .gitignore
│  ├─ CMakeLists.txt
│  ├─ flutter
│  │  ├─ CMakeLists.txt
│  │  ├─ ephemeral
│  │  │  └─ .plugin_symlinks
│  │  │     └─ url_launcher_linux
│  │  │        ├─ AUTHORS
│  │  │        ├─ CHANGELOG.md
│  │  │        ├─ example
│  │  │        │  ├─ integration_test
│  │  │        │  │  └─ url_launcher_test.dart
│  │  │        │  ├─ lib
│  │  │        │  │  └─ main.dart
│  │  │        │  ├─ linux
│  │  │        │  │  ├─ CMakeLists.txt
│  │  │        │  │  ├─ flutter
│  │  │        │  │  │  ├─ CMakeLists.txt
│  │  │        │  │  │  └─ generated_plugins.cmake
│  │  │        │  │  ├─ main.cc
│  │  │        │  │  ├─ my_application.cc
│  │  │        │  │  └─ my_application.h
│  │  │        │  ├─ pubspec.yaml
│  │  │        │  ├─ README.md
│  │  │        │  └─ test_driver
│  │  │        │     └─ integration_test.dart
│  │  │        ├─ lib
│  │  │        │  └─ url_launcher_linux.dart
│  │  │        ├─ LICENSE
│  │  │        ├─ linux
│  │  │        │  ├─ CMakeLists.txt
│  │  │        │  ├─ include
│  │  │        │  │  └─ url_launcher_linux
│  │  │        │  │     └─ url_launcher_plugin.h
│  │  │        │  ├─ test
│  │  │        │  │  └─ url_launcher_linux_test.cc
│  │  │        │  ├─ url_launcher_plugin.cc
│  │  │        │  └─ url_launcher_plugin_private.h
│  │  │        ├─ pubspec.yaml
│  │  │        ├─ README.md
│  │  │        └─ test
│  │  │           └─ url_launcher_linux_test.dart
│  │  ├─ generated_plugins.cmake
│  │  ├─ generated_plugin_registrant.cc
│  │  └─ generated_plugin_registrant.h
│  ├─ main.cc
│  ├─ my_application.cc
│  └─ my_application.h
├─ macos
│  ├─ .gitignore
│  ├─ Flutter
│  │  ├─ ephemeral
│  │  │  ├─ Flutter-Generated.xcconfig
│  │  │  └─ flutter_export_environment.sh
│  │  ├─ Flutter-Debug.xcconfig
│  │  ├─ Flutter-Release.xcconfig
│  │  └─ GeneratedPluginRegistrant.swift
│  ├─ Podfile
│  ├─ Runner
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets
│  │  │  └─ AppIcon.appiconset
│  │  │     ├─ app_icon_1024.png
│  │  │     ├─ app_icon_128.png
│  │  │     ├─ app_icon_16.png
│  │  │     ├─ app_icon_256.png
│  │  │     ├─ app_icon_32.png
│  │  │     ├─ app_icon_512.png
│  │  │     ├─ app_icon_64.png
│  │  │     └─ Contents.json
│  │  ├─ Base.lproj
│  │  │  └─ MainMenu.xib
│  │  ├─ Configs
│  │  │  ├─ AppInfo.xcconfig
│  │  │  ├─ Debug.xcconfig
│  │  │  ├─ Release.xcconfig
│  │  │  └─ Warnings.xcconfig
│  │  ├─ DebugProfile.entitlements
│  │  ├─ Info.plist
│  │  ├─ MainFlutterWindow.swift
│  │  └─ Release.entitlements
│  ├─ Runner.xcodeproj
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace
│  │  │  └─ xcshareddata
│  │  │     └─ IDEWorkspaceChecks.plist
│  │  └─ xcshareddata
│  │     └─ xcschemes
│  │        └─ Runner.xcscheme
│  └─ Runner.xcworkspace
│     ├─ contents.xcworkspacedata
│     └─ xcshareddata
│        └─ IDEWorkspaceChecks.plist
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md
├─ test
│  └─ widget_test.dart
├─ web
│  ├─ favicon.png
│  ├─ icons
│  │  ├─ Icon-192.png
│  │  ├─ Icon-512.png
│  │  ├─ Icon-maskable-192.png
│  │  └─ Icon-maskable-512.png
│  ├─ index.html
│  └─ manifest.json
└─ windows
   ├─ .gitignore
   ├─ CMakeLists.txt
   ├─ flutter
   │  ├─ CMakeLists.txt
   │  ├─ ephemeral
   │  │  └─ .plugin_symlinks
   │  │     └─ url_launcher_windows
   │  │        ├─ AUTHORS
   │  │        ├─ CHANGELOG.md
   │  │        ├─ example
   │  │        │  ├─ integration_test
   │  │        │  │  └─ url_launcher_test.dart
   │  │        │  ├─ lib
   │  │        │  │  └─ main.dart
   │  │        │  ├─ pubspec.yaml
   │  │        │  ├─ README.md
   │  │        │  ├─ test_driver
   │  │        │  │  └─ integration_test.dart
   │  │        │  └─ windows
   │  │        │     ├─ CMakeLists.txt
   │  │        │     ├─ flutter
   │  │        │     │  ├─ CMakeLists.txt
   │  │        │     │  └─ generated_plugins.cmake
   │  │        │     └─ runner
   │  │        │        ├─ CMakeLists.txt
   │  │        │        ├─ flutter_window.cpp
   │  │        │        ├─ flutter_window.h
   │  │        │        ├─ main.cpp
   │  │        │        ├─ resource.h
   │  │        │        ├─ resources
   │  │        │        │  └─ app_icon.ico
   │  │        │        ├─ runner.exe.manifest
   │  │        │        ├─ Runner.rc
   │  │        │        ├─ run_loop.cpp
   │  │        │        ├─ run_loop.h
   │  │        │        ├─ utils.cpp
   │  │        │        ├─ utils.h
   │  │        │        ├─ win32_window.cpp
   │  │        │        └─ win32_window.h
   │  │        ├─ lib
   │  │        │  ├─ src
   │  │        │  │  └─ messages.g.dart
   │  │        │  └─ url_launcher_windows.dart
   │  │        ├─ LICENSE
   │  │        ├─ pigeons
   │  │        │  ├─ copyright.txt
   │  │        │  └─ messages.dart
   │  │        ├─ pubspec.yaml
   │  │        ├─ README.md
   │  │        ├─ test
   │  │        │  └─ url_launcher_windows_test.dart
   │  │        └─ windows
   │  │           ├─ CMakeLists.txt
   │  │           ├─ include
   │  │           │  └─ url_launcher_windows
   │  │           │     └─ url_launcher_windows.h
   │  │           ├─ messages.g.cpp
   │  │           ├─ messages.g.h
   │  │           ├─ system_apis.cpp
   │  │           ├─ system_apis.h
   │  │           ├─ test
   │  │           │  └─ url_launcher_windows_test.cpp
   │  │           ├─ url_launcher_plugin.cpp
   │  │           ├─ url_launcher_plugin.h
   │  │           └─ url_launcher_windows.cpp
   │  ├─ generated_plugins.cmake
   │  ├─ generated_plugin_registrant.cc
   │  └─ generated_plugin_registrant.h
   └─ runner
      ├─ CMakeLists.txt
      ├─ flutter_window.cpp
      ├─ flutter_window.h
      ├─ main.cpp
      ├─ resource.h
      ├─ resources
      │  └─ app_icon.ico
      ├─ runner.exe.manifest
      ├─ Runner.rc
      ├─ utils.cpp
      ├─ utils.h
      ├─ win32_window.cpp
      └─ win32_window.h

```