# Advanced Task Manager

This project is a technical challenge for a job application as a Flutter Developer.

## Description

Advanced Task Manager is a small sample app meant to show a clear separation of concerns using Clean Architecture. It's intentionally simple but practical:

- Domain layer: entities, repository abstractions, use cases, and failures.
- Infrastructure layer: data sources and repository implementations (local/remote).
- Presentation layer: pages, widgets, and Riverpod notifiers.

Key tech:

- Flutter
- Riverpod
- Freezed & JSON Serializable
- HTTP and GraphQL
- Sqflite & Path Provider

## Getting Started

1. Clone the repository

```bash
git clone git@github.com:harolCalzada/advance-task-manager.git
cd advance-task-manager
```

2. Install dependencies (with FVM)

```bash
fvm flutter pub get
```

If you're not using FVM, run:

```bash
flutter pub get
```

3. Run the app

```bash
fvm flutter run
```

4. Run tests

```bash
fvm flutter test
```

5. Code generation (Freezed/JSON)

```bash
# One-off build
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode
fvm flutter pub run build_runner watch --delete-conflicting-outputs
```

6. Analyze and format

```bash
# Static analysis
fvm flutter analyze

# Format (dry-run)
fvm flutter format . --set-exit-if-changed

# Format (apply changes)
fvm flutter format .
```

7. Useful maintenance

```bash
# Clean build artifacts
fvm flutter clean && fvm flutter pub get

# Check dependency status
fvm flutter pub outdated
```

### Without FVM

If you don't use FVM, just replace `fvm flutter` with `flutter` in the commands above.

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```

## Troubleshooting

- **SDK mismatch (json_serializable / freezed)**
  - If you see SDK version warnings, make sure `environment.sdk` in `pubspec.yaml` matches your local Dart. This project targets `">=3.4.0 <4.0.0"`.
  - After changing SDK or dependency versions, it's a good idea to run: `fvm flutter clean && fvm flutter pub get` and then regenerate code.

## Architecture

Project structure under `lib/`:

- `core/`

  - `di/`: Dependency injection setup (providers and a small service locator).

- `domain/`

  - `entities/`: Core business models (plain Dart, framework-agnostic).
  - `repositories/`: Abstract contracts implemented by infrastructure.
  - `usecases/`: App-specific business rules (aka interactors).
  - `failures/`: Error models used across the domain layer.

- `infrastructure/`

  - `datasources/`: Local/remote data providers (e.g. Sqflite, HTTP, GraphQL).
  - `repositories/`: Concrete implementations of the domain repositories.

- `presentation/`
  - `pages/`: UI screens (Flutter widgets).
  - `widgets/`: Reusable UI components.
  - `state/`: Riverpod notifiers/providers for UI state management.
