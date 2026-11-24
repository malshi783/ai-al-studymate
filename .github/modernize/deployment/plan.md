# Deployment Readiness Plan

## Scope

Review the Flutter application for deployability without introducing a server container or unrelated source changes. The repository contains one Flutter client, with Firebase Authentication/Core as its hosted dependency. The Java/Spring Boot and MySQL components described in the README are planned architecture only and are not present in this repository.

## Deployment type

Client application deployment:

- Android: release APK/AAB, using the existing Gradle/Flutter project.
- Web: static Flutter web output, if web hosting is required.
- iOS/desktop: supported by the generated Flutter platform folders, but release signing and platform-specific validation require their respective toolchains.
- No Dockerfile, Kubernetes manifest, Bicep/Terraform, or Azure Container Apps deployment is planned because Flutter mobile binaries are not server containers and no backend service exists here.

## Existing configuration to preserve

- `pubspec.yaml` and `pubspec.lock` define the Flutter/Dart dependencies.
- `lib/firebase_options.dart` provides Firebase project configuration for web, Android, iOS, macOS, and Windows; Linux is intentionally unsupported.
- `firebase.json` is present and should be reviewed for Firebase hosting/deploy settings.
- Existing platform projects under `android/`, `ios/`, `web/`, `windows/`, `macos/`, and `linux/` remain the build entry points.

## Files to create or change

Only deployment-readiness documentation/configuration that is clearly missing:

1. Add `.github/workflows/flutter.yml` to run dependency resolution, static analysis, tests, and a web release build on pushes and pull requests.
2. Add `.github/modernize/deployment/summary.md` with findings, blockers, and validation results.
3. Add/update `.github/modernize/deployment/progress.md` after each phase.

Do not modify application source, Firebase credentials/configuration, generated platform files, or dependency versions.

## Required validation

1. `flutter --version`
2. `flutter pub get`
3. `flutter analyze`
4. `flutter test`
5. `flutter build web --release`
6. Confirm the workflow YAML and deployment tracking files are present.

## Blockers to report

- Release signing credentials and app-store identities are not repository configuration and must be supplied through secure CI secrets.
- Firebase Authentication providers, authorized domains, security rules, and production project settings must be confirmed in Firebase.
- The backend/API and MySQL described in `README.md` are absent, so the complete planned architecture cannot be deployed from this repository.
- API/backend environment configuration is not currently represented in this Flutter client.
