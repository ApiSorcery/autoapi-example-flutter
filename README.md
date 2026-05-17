# ApiSorcery - Flutter Example

This is a Flutter cross-platform application that demonstrates API integration using AutoAPI. It can be compiled to multiple platforms including iOS, Android, Web, Windows, macOS, Linux, and HarmonyOS.

## Features

- ✅ User Management (CRUD operations)
- ✅ Search and Filter
- ✅ Pagination
- ✅ Form Validation
- ✅ Image Upload
- ✅ Status Management
- ✅ Type-safe API calls with AutoAPI
- ✅ Multi-platform support (iOS, Android, Web, Desktop, HarmonyOS)

## Tech Stack

- **Flutter 3.27.4** - Cross-platform UI framework
- **Dart 3.6.2** - Programming language
- **Castor Flutter** - UI component library
- **Dio** - HTTP client
- **AutoAPI** - API code generation
- **JSON Serialization** - Type-safe JSON handling

## Supported Platforms

- 📱 iOS
- 📱 Android
- 🌐 Web
- 💻 Windows
- 💻 macOS
- 💻 Linux
- 📱 HarmonyOS (OpenHarmony)

## Prerequisites

- Flutter SDK >= 3.27.4
- Dart SDK >= 3.6.2
- Node.js >= 22.0.0 (for AutoAPI)
- Platform-specific tools:
  - iOS: Xcode
  - Android: Android Studio
  - HarmonyOS: DevEco Studio

## Getting Started

### 1. Install Flutter Dependencies

```bash
flutter pub get
```

### 2. Generate API Client Code

```bash
npm run swagger
```

This will generate Dart API client code from the OpenAPI specification.

### 3. Run the Application

#### iOS
```bash
flutter run -d ios
```

#### Android
```bash
flutter run -d android
```

#### Web
```bash
flutter run -d chrome
```

#### Desktop (macOS/Windows/Linux)
```bash
flutter run -d macos    # macOS
flutter run -d windows  # Windows
flutter run -d linux    # Linux
```

#### HarmonyOS
```bash
flutter run -d ohos
```

## Available Scripts

### Flutter Commands

| Command | Description |
|---------|-------------|
| `flutter pub get` | Install dependencies |
| `flutter run` | Run in debug mode |
| `flutter build ios` | Build for iOS |
| `flutter build apk` | Build Android APK |
| `flutter build web` | Build for web |
| `flutter build macos` | Build for macOS |
| `flutter build windows` | Build for Windows |
| `flutter build linux` | Build for Linux |
| `flutter test` | Run tests |
| `flutter analyze` | Analyze code |

### AutoAPI Commands

| Command | Description |
|---------|-------------|
| `npm run swagger` | Generate API client code |

## Project Structure

```
autoapi_example_flutter/
├── lib/
│   ├── apis/              # Auto-generated API code
│   │   └── auto/
│   │       └── demo/
│   │           ├── api_user.dart
│   │           ├── api_file.dart
│   │           └── models/
│   ├── pages/             # Application pages
│   │   └── user/          # User management pages
│   ├── widgets/           # Reusable widgets
│   ├── utils/             # Utility functions
│   ├── constants/         # Constants
│   └── main.dart          # Application entry
├── assets/                # Static assets
│   └── fonts/             # Custom fonts
├── android/               # Android platform code
├── ios/                   # iOS platform code
├── web/                   # Web platform code
├── windows/               # Windows platform code
├── macos/                 # macOS platform code
├── linux/                 # Linux platform code
├── ohos/                  # HarmonyOS platform code
├── .apisorceryrc.json        # AutoAPI configuration
├── pubspec.yaml           # Flutter dependencies
└── package.json           # Node.js dependencies (for AutoAPI)
```

## API Configuration

The application uses AutoAPI to generate type-safe API client code. Configuration is in `.apisorceryrc.json`:

```json
{
  "application": {
    "language": "dart",
    "outputDir": "./lib/apis/auto"
  },
  "servers": [
    {
      "code": "demo",
      "token": "your_token",
      "version": 3,
      "enabled": true,
      "source": "https://apisorcery.com/demo-api/swagger-json"
    }
  ]
}
```

## Dependencies

### Main Dependencies (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  castor_flutter: ^1.0.6        # UI components
  dio: ^5.9.1                    # HTTP client
  json_annotation: ^4.9.0        # JSON serialization
  intl: ^0.19.0                  # Internationalization
  toastification: ^3.0.3         # Toast notifications
  flutter_slidable: ^4.0.0       # Slidable list items
  flutter_spinkit: ^5.1.0        # Loading indicators
  path_provider: ^2.1.5          # File system paths
  permission_handler: ^12.0.1    # Permissions
```

### Dev Dependencies

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0          # Linting rules
  build_runner: ^2.4.14          # Code generation
  json_serializable: ^6.9.4      # JSON serialization
```

## Development

### Flutter Widget Structure

Flutter uses a widget-based architecture:

```dart
class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Management')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return UserListItem(user: users[index]);
        },
      ),
    );
  }
}
```

### API Usage

```dart
import 'package:autoapi_example_flutter/apis/auto/demo/api_user.dart';

// Get paginated user list
final response = await ApiUser.getUserPaged(
  pagination: Pagination(page: 1, limit: 10),
  code: 'search-term',
);

// Create user
await ApiUser.addUser(
  UserAddRequest(
    code: 'user001',
    name: 'John Doe',
    email: 'john@example.com',
  ),
);
```

### State Management

This project uses StatefulWidget for state management:

```dart
class _UserPageState extends State<UserPage> {
  List<User> users = [];
  bool isLoading = false;

  Future<void> loadUsers() async {
    setState(() => isLoading = true);
    try {
      final response = await ApiUser.getUserPaged();
      setState(() {
        users = response.results;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      // Handle error
    }
  }
}
```

### Platform-Specific Code

Use conditional imports for platform-specific code:

```dart
import 'package:flutter/foundation.dart' show kIsWeb;

if (kIsWeb) {
  // Web-specific code
} else if (Platform.isIOS) {
  // iOS-specific code
} else if (Platform.isAndroid) {
  // Android-specific code
}
```

### Code Style

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check code quality
- Format code with `dart format`
- Use meaningful variable and function names

## Building for Production

### iOS
```bash
flutter build ios --release
```

### Android
```bash
flutter build apk --release
flutter build appbundle --release  # For Google Play
```

### Web
```bash
flutter build web --release
./deploy_web.sh  # Deploy script
```

### Desktop

#### macOS
```bash
flutter build macos --release
```

#### Windows
```bash
flutter build windows --release
```

#### Linux
```bash
flutter build linux --release
```

### HarmonyOS
```bash
flutter build ohos --release
```

## HarmonyOS Support

This project includes special support for HarmonyOS (OpenHarmony):

### HarmonyOS Dependencies

The project uses HarmonyOS-adapted Flutter plugins:

```yaml
dependency_overrides:
  image_picker:
    git:
      url: https://gitee.com/openharmony-sig/flutter_packages.git
      path: packages/image_picker/image_picker
      ref: master

  path_provider:
    git:
      url: https://gitee.com/openharmony-sig/flutter_packages.git
      path: packages/path_provider/path_provider

  permission_handler_ohos:
    git:
      url: https://gitcode.com/openharmony-sig/flutter_permission_handler.git
      path: permission_handler_ohos
      ref: br_permission_handler_v11.3.1_ohos
```

### Building for HarmonyOS

1. Install DevEco Studio
2. Configure HarmonyOS SDK
3. Build the project:
   ```bash
   flutter build ohos --release
   ```

## Testing

### Run Tests
```bash
flutter test
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### Widget Tests

```dart
testWidgets('User list displays correctly', (WidgetTester tester) async {
  await tester.pumpWidget(MyApp());
  expect(find.text('User Management'), findsOneWidget);
});
```

## Deployment

### iOS App Store

1. Build release version: `flutter build ios --release`
2. Open `ios/Runner.xcworkspace` in Xcode
3. Archive and upload to App Store Connect

### Google Play Store

1. Build app bundle: `flutter build appbundle --release`
2. Upload to Google Play Console
3. Complete store listing and publish

### Web Deployment

```bash
flutter build web --release
./deploy_web.sh
```

The built files will be in `build/web/`.

## Troubleshooting

### Common Issues

1. **Dependencies Error**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Build Failed**
   ```bash
   flutter clean
   rm -rf build/
   flutter pub get
   flutter build <platform>
   ```

3. **Platform-Specific Issues**
   - iOS: Check Xcode version and CocoaPods
   - Android: Check Android SDK and Gradle
   - HarmonyOS: Check DevEco Studio and SDK

4. **API Connection Issues**
   - Verify backend service is running
   - Check API base URL configuration
   - Verify network permissions in platform manifests

### Platform Permissions

#### iOS (Info.plist)
```xml
<key>NSPhotoLibraryUsageDescription</key>
<string>Need photo library access to upload avatar</string>
<key>NSCameraUsageDescription</key>
<string>Need camera access to take photos</string>
```

#### Android (AndroidManifest.xml)
```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
```

## Performance Optimization

### Tips

1. **Use const constructors** for widgets that don't change
2. **Implement ListView.builder** for long lists
3. **Use cached network images** for better performance
4. **Minimize rebuilds** with proper state management
5. **Profile your app** with Flutter DevTools

### Build Optimization

```bash
flutter build <platform> --release --split-debug-info=./debug-info --obfuscate
```

## Resources

### Official Documentation
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)
- [AutoAPI Documentation](https://apisorcery.com/)

### UI Components
- [Castor Flutter](https://pub.dev/packages/castor_flutter)
- [Material Design](https://material.io/design)

### Platform-Specific
- [iOS Development](https://developer.apple.com/)
- [Android Development](https://developer.android.com/)
- [HarmonyOS Development](https://developer.harmonyos.com/)

## Version Information

- Flutter: 3.27.4
- Dart: 3.6.2
- AutoAPI: 1.0.5+
- Castor Flutter: 1.0.6

## License

MIT
