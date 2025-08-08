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
