# Carport

A Flutter car-maintenance tracker that helps you monitor your vehicle's service history, track fuel efficiency, and stay on top of maintenance reminders.

## Features

- **Maintenance Logging**: Track service items, repairs, and maintenance for your vehicles
- **Fuel Economy Tracking**: Monitor MPG and fuel costs over time
- **Automated Reminders**: Set up recurring reminders for scheduled maintenance (daily, weekly, monthly, yearly)
- **Portal Sync**: Connect to the [Carport Monitor](https://github.com/MarlonS05/carport-monitor) for cloud sync and data persistence
- **Attachment Support**: Attach photos and documents to service records
- **Multi-Vehicle Support**: Track multiple vehicles in one app
- **Web Portal Access**: Grant family members or trusted contacts access to your vehicle data via the web portal

## Setup

### Prerequisites

- Flutter 3.11.0 or higher
- Dart 3.11.0 or higher
- Android SDK for Android development
- Xcode for iOS development (macOS only)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/MarlonS05/carport.git
   cd carport
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Generate code (for Freezed models and build_runner):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Testing with Local Monitor

To connect the app to a local [Carport Monitor](https://github.com/MarlonS05/carport-monitor) instance during development:

1. Start your monitor on `localhost:PORT` (e.g., `localhost:8080`)

2. When scanning the QR code in the app's connectivity settings, use:
   - **For Android Emulator**: `http://10.0.2.2:PORT`
   - **For iOS Simulator**: `http://localhost:PORT`
   - **For Physical Device**: `http://<your-machine-ip>:PORT`

   **Note**: Use `http://` (not `https://`) for local development unless your monitor specifically requires HTTPS.

3. Example for Android emulator with monitor on port 8080:
   ```
   http://10.0.2.2:8080
   ```

### Running Tests

Run all tests:
```bash
flutter test
```

Run architecture tests:
```bash
flutter test test/architecture/layer_import_test.dart
```

### Code Analysis

Check code quality:
```bash
flutter analyze
```

## Architecture

The project follows a layered architecture with clear separation of concerns:

- **Domain**: Pure business logic, entities, use cases, and repository interfaces (no Flutter dependencies)
- **Data**: Repository implementations and database access
- **Presentation**: BLoCs, views, and routing
- **Platform**: OS and plugin adapters (notifications, biometrics, file access, HTTP calls)

For detailed architecture documentation, see [docs/architecture.md](docs/architecture.md).

## Documentation

- [Architecture Guide](docs/architecture.md)
- [Project Structure](docs/project-structure.md)
- [Design Language](docs/design-language.md)
- [Connectivity Design](docs/connectivity-design-spec.md)
- [Reminders Design](docs/reminders-design-spec.md)

## Related Projects

- **[Carport Monitor](https://github.com/MarlonS05/carport-monitor)** - Web portal and backend API for Carport
