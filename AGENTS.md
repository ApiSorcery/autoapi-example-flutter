# AGENTS.md - AutoAPI Flutter Example

## Build/Test Commands
- **Run app**: `flutter run` (debug) or `flutter run --release` (production)
- **Run tests**: `flutter test` (all) or `flutter test test/path/to/test.dart` (single test)
- **Analyze**: `flutter analyze` (uses flutter_lints)
- **Generate API code**: `dart run build_runner build` (regenerate from `.autoapirc.json`)
- **Format**: `dart format lib/`
- **Get dependencies**: `flutter pub get`

## Architecture & Structure
- **Project Type**: Flutter multi-platform app (iOS, Android, macOS, Linux, Windows, HarmonyOS)
- **API Generation**: Uses AutoAPI (v1.0.5+) configured in `.autoapirc.json`; generates to `lib/apis/auto/demo/`
- **SDK Requirements**: Dart ≥3.6.2, Flutter 3.27.4
- **Key Dependencies**: dio (HTTP), json_serializable (serialization), flutter_lints (analysis)
- **Key Directories**:
  - `lib/apis/` - Generated API client code and interceptors
  - `lib/entities/` - Data models
  - `lib/pages/` - UI screens
  - `lib/widgets/` - Reusable components
  - `lib/utils/` - Helper functions
  - `test/` - Unit/widget tests

## Code Style Guidelines
- **Imports**: Use relative imports for local files, absolute for packages
- **Naming**: Use camelCase for variables/functions, PascalCase for classes
- **Formatting**: Run `dart format` (2-space indentation, standard Dart formatting)
- **Types**: Explicit type annotations required (no var except for obvious cases)
- **Null Safety**: Enable null-safety; use `?` and `!` appropriately
- **Debug Output**: Use `debugPrint()` in `kDebugMode` blocks only (see request.dart line 8-20)
- **Linting**: Follow `flutter_lints` recommendations from `analysis_options.yaml`
- **Error Handling**: Wrap API calls with try-catch; handle null/empty states explicitly
