# Advanced Task Manager

A foundational Flutter project scaffold implementing Clean Architecture concepts with Riverpod for state management, and set up for REST and GraphQL integrations.

## Description

Advanced Task Manager is a sample application intended to demonstrate a clean separation of concerns using Clean Architecture:

- Domain layer with entities, repositories (abstractions), use cases, and failures.
- Infrastructure layer with data sources and repository implementations.
- Presentation layer with pages, widgets, and Riverpod notifiers.

Key technologies:

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

If you are not using FVM, run:

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

Reemplaza `fvm flutter` por `flutter` si no usas FVM.

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run
```

## Troubleshooting

* __SDK mismatch (json_serializable / freezed)__
  - Si ves advertencias de versión de SDK, asegúrate de que `environment.sdk` en `pubspec.yaml` sea compatible con tu Dart local. Este proyecto está configurado para `">=3.4.0 <4.0.0"`.
  - Tras cambiar el SDK o versiones de dependencias, ejecuta: `fvm flutter clean && fvm flutter pub get` y luego vuelve a generar código.

## Architecture

Project structure under `lib/`:

- `core/`

  - `di/`: Dependency injection setup (providers and service locators).

- `domain/`

  - `entities/`: Core business models (pure Dart, framework-agnostic).
  - `repositories/`: Abstract contracts to be implemented by infrastructure.
  - `usecases/`: Application-specific business rules (interactors).
  - `failures/`: Error models used by the domain layer.

- `infrastructure/`

  - `datasources/`: Local/remote data providers (e.g., Sqflite, HTTP, GraphQL).
  - `repositories/`: Concrete implementations of domain repositories.

- `presentation/`
  - `pages/`: UI screens (Flutter widgets).
  - `widgets/`: Reusable UI components.
  - `state/`: Riverpod notifiers/providers for UI state management.

This skeleton is intentionally minimal so you can evolve it following Clean Architecture principles.
