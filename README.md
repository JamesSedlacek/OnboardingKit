# OnboardingKit

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![GitHub stars](https://img.shields.io/github/stars/JamesSedlacek/OnboardingKit.svg)](https://github.com/JamesSedlacek/OnboardingKit/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JamesSedlacek/OnboardingKit.svg?color=blue)](https://github.com/JamesSedlacek/OnboardingKit/network)
[![GitHub contributors](https://img.shields.io/github/contributors/JamesSedlacek/OnboardingKit.svg?color=blue)](https://github.com/JamesSedlacek/OnboardingKit/network)
<a href="https://github.com/JamesSedlacek/OnboardingKit/pulls"><img src="https://img.shields.io/github/issues-pr/JamesSedlacek/OnboardingKit" alt="Pull Requests Badge"/></a>
<a href="https://github.com/JamesSedlacek/OnboardingKit/issues"><img src="https://img.shields.io/github/issues/JamesSedlacek/OnboardingKit" alt="Issues Badge"/></a>

https://github.com/user-attachments/assets/ce319597-e5ba-434a-ab45-c66a6a7e501a

## Description
OnboardingKit is a SwiftUI library that provides an Apple-like app onboarding experience.

## Features

- ✅ **Swift 6.0 Compatible** - Built for the latest Swift standards
- 🌍 **Multi-language Support** - 10 languages included out of the box
- ♿ **Accessibility First** - Full Dynamic Type support and accessibility features
- 🎨 **Highly Customizable** - Flexible configuration options
- 📱 **Cross-platform** - iOS and macOS support
- 🔄 **Modern SwiftUI** - Uses latest SwiftUI APIs and patterns
- 💾 **Automatic State Management** - Built-in AppStorage integration
- 🌗 **Light and Dark Mode** - Fully supports both light and dark appearance

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Supported Languages](#supported-languages)
- [Usage](#usage)
  - [Basic Setup](#basic-setup)
  - [Advanced Usage](#advanced-usage)
- [Configuration Options](#configuration-options)
- [Contributing](#contributing)
- [License](#license)
- [Author](#author)

## Requirements

- **iOS**: 18.0 or later
- **macOS**: 15.0 or later
- **Swift**: 6.0 or later

## Installation

You can install `OnboardingKit` using the Swift Package Manager.

1. In Xcode, select "File" > "Add Package Dependencies"
2. Copy & paste the following into the "Search or Enter Package URL" search bar:
```https://github.com/JamesSedlacek/OnboardingKit.git```
3. Xcode will fetch the repository & the "OnboardingKit" library will be added to your project

## Supported Languages

OnboardingKit includes localization for the following languages:

- **English (en)**
- **German (de)** 
- **Spanish (es)**
- **French (fr)**
- **Italian (it)**
- **Japanese (ja)**
- **Korean (ko)**
- **Portuguese (pt)**
- **Russian (ru)**
- **Chinese Simplified (zh-Hans)**

## Usage

### Basic Setup

1. **Create your onboarding configuration:**
```swift
import OnboardingKit
import SwiftUI

extension OnboardingConfiguration {
    static let production = OnboardingConfiguration(
        accentColor: .blue,
        appDisplayName: "My Amazing App",
        features: [
            FeatureInfo(
                image: Image(systemName: "star.fill"),
                title: "Amazing Features",
                content: "Discover powerful tools that make your life easier."
            ),
            FeatureInfo(
                image: Image(systemName: "shield.fill"),
                title: "Privacy First",
                content: "Your data stays private and secure on your device."
            ),
            FeatureInfo(
                image: Image(systemName: "bolt.fill"),
                title: "Lightning Fast",
                content: "Optimized performance for the best user experience."
            )
        ],
        titleSectionAlignment: .center
    )
}
```

2. **Add onboarding to your app's root view:**
```swift
import OnboardingKit
import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .showOnboardingIfNeeded(
                    config: .production,
                    appIcon: Image("AppIcon"),
                    dataPrivacyContent: {
                        PrivacyPolicyView()
                    }
                )
        }
    }
}
```

### Advanced Usage

#### Custom Continue Action

You can provide a custom action to perform when the user taps "Continue":
```swift
ContentView()
    .showOnboardingIfNeeded(
        config: .production,
        appIcon: Image("AppIcon"),
        continueAction: {
            // Perform analytics, API calls, etc.
            Analytics.track("onboarding_completed")
            // Note: Onboarding completion is handled automatically
        },
        dataPrivacyContent: {
            PrivacyPolicyView()
        }
    )
```

#### Custom Storage

Use a custom AppStorage key for tracking onboarding state:
```swift
@AppStorage("myCustomOnboardingKey") private var customOnboardingState = false

ContentView()
    .showOnboardingIfNeeded(
        storage: $customOnboardingState,
        config: .production,
        appIcon: Image("AppIcon"),
        dataPrivacyContent: {
            PrivacyPolicyView()
        }
    )
```

#### Manual State Management

Access the convenient AppStorage extension for manual control:
```swift
import OnboardingKit

struct SettingsView: View {
    @AppStorage(.onboardingKey) private var isOnboardingCompleted = false
    
    var body: some View {
        VStack {
            Button("Reset Onboarding") {
                isOnboardingCompleted = false
            }
        }
    }
}
```

## Configuration Options

### OnboardingConfiguration

- `accentColor`: Primary color used throughout the onboarding (default: `.blue`)
- `appDisplayName`: Your app's display name shown in the welcome section
- `features`: Array of `FeatureInfo` objects to showcase
- `titleSectionAlignment`: Horizontal alignment for the title (`.leading`, `.center`, `.trailing`)

### FeatureInfo

- `image`: Icon representing the feature (typically SF Symbols)
- `title`: Brief, descriptive title
- `content`: Detailed description of the feature

## Contributing

We welcome contributions! 
Please feel free to submit a Pull Request. 
For major changes, please open an issue first to discuss what you would like to change.

## License

OnboardingKit is available under the MIT license. See the LICENSE file for more info.

## Author

James Sedlacek - Find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)
