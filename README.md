# aStorage

**aStorage** is a Swift-based application (iOS/macOS) following a structured architecture. It features a clear separation of concerns through layers such as App, Core, Models, Services, ViewModels, and Views, along with unit and UI testing.

---

## Table of Contents

- [Features](#features)  
- [Architecture](#architecture)  
- [Getting Started](#getting-started)  
- [Requirements](#requirements)  
- [Project Structure](#project-structure)  
- [Testing](#testing)  
- [License](#license)

---

## Features

- Modular project layout designed for maintainability and scalability.  
- Core logic separated into dedicated modules (Core, Services, ViewModels).  
- MVVM-friendly design for better UI/state management separation.  
- XCTest suite setup for both unit and UI testing.

---

## Architecture

The project is organized into clear, logical layers:

- `App`: Entry point and application lifecycle control.  
- `Core`: Shared utilities and fundamental components.  
- `Models`: Domain entities and data models.  
- `Services`: Networking, data persistence, and other service abstractions.  
- `ViewModels`: UI logic and state mediation.  
- `Views`: User interface components and screens.  
- `aStorage.xcodeproj`: Xcode project.  
- `Assets.xcassets`: Images, icons, and visual assets.  
- `aStorageTests` & `aStorageUITests`: Testing suites for both logic and UI.

---

## Getting Started

1. **Clone the repository**  
   ```bash
   git clone https://github.com/habibakij/aStorage.git
   cd aStorage
2. **Open the project in Xcode**
  - Double-click aStorage.xcodeproj
  - or open via command:
    ```bash
    open aStorage/aStorage.xcodeproj

3. **Build and run**
  - Select a simulator or device.
  - Build (⌘B) and run (⌘R).

## Project Structure

   ```bash
   aStorage/
   ├── App/                # App delegate, scene setup, initial config
   ├── Core/               # Utilities, extensions, constants, shared services
   ├── Models/             # Data types and business entities
   ├── Services/           # Networking, persistence, provider classes
   ├── ViewModels/         # ViewModel layer for binding data to views
   ├── Views/              # UI components (SwiftUI or UIKit)
   ├── aStorage.xcodeproj  # Xcode project file
   ├── Assets.xcassets/    # Images, icons, assets
   ├── aStorageTests/      # Unit test target
   └── aStorageUITests/    # UI test target
```

## Requirements

- Xcode (latest recommended version supporting Swift)
- iOS/macOS deployment target (set within project settings)
- Any additional dependencies (e.g., CocoaPods, Swift Package Manager) — specify if used


## Directory Roles

- App: Hosts the app delegate / scene setup and initial configuration.
- Core: Core utilities, extensions, constants, or shared services.
- Models: Plain data types (e.g., structs, enums) representing business entities.
- Services: API clients, data managers, or provider classes.
- ViewModels: Bind data and user actions to Views.
- Views: UI layer (SwiftUI or UIKit components).
- Tests: Targeted logic and UI testing.

## Testing

- Unit Tests: Run using Xcode’s test navigator or ⌘U.
- UI Tests: Automate interface flows and UI logic.
- Extend test cases as the app evolves — structured support is already included.

## License

- Add your preferred license here, e.g., MIT, Apache, or custom terms.


