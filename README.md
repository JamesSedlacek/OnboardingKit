# OnboardingKit

[![Swift Package Manager](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![GitHub stars](https://img.shields.io/github/stars/JamesSedlacek/OnboardingKit.svg)](https://github.com/JamesSedlacek/OnboardingKit/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/JamesSedlacek/OnboardingKit.svg?color=blue)](https://github.com/JamesSedlacek/OnboardingKit/network)
[![GitHub contributors](https://img.shields.io/github/contributors/JamesSedlacek/OnboardingKit.svg?color=blue)](https://github.com/JamesSedlacek/OnboardingKit/network)
<a href="https://github.com/JamesSedlacek/OnboardingKit/pulls"><img src="https://img.shields.io/github/issues-pr/JamesSedlacek/OnboardingKit" alt="Pull Requests Badge"/></a>
<a href="https://github.com/JamesSedlacek/OnboardingKit/issues"><img src="https://img.shields.io/github/issues/JamesSedlacek/OnboardingKit" alt="Issues Badge"/></a>


<p align="left">
  <img src = "https://github.com/JamesSedlacek/OnboardingKit/blob/main/Assets/OnboardingKitDemo.gif" height="800", width="400">
</p>

## Description
`OnboardingKit` is a SwiftUI library for handling onboarding. <br>

<br>

## Requirements

- **iOS**: 17.0 or later.
- **macOS**: 14.0 or later.

<br>

## Installation

You can install `OnboardingKit` using the Swift Package Manager.

1. In Xcode, select "File" > "Add Package Dependencies".
2. Copy & paste the following into the "Search or Enter Package URL" search bar.
```
https://github.com/JamesSedlacek/OnboardingKit.git
```
4. Xcode will fetch the repository & the "OnboardingKit" library will be added to your project.

<br>

## Usage

1. Create an `Onboarding Configuration`.
```swift
import OnboardingKit
import SwiftUI

extension OnboardingConfiguration {
    static let prod = Self.init(privacyUrlString: "",
                                accentColor: .green,
                                features: [])
}
```

<br>

2. Add `.showOnboardingIfNeeded()` to the root view in your project.
```swift
import OnboardingKit
import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        ContentView()
            .showOnboardingIfNeeded(using: .prod)
    }
}
```

<br>

## Author

James Sedlacek, find me on [X/Twitter](https://twitter.com/jsedlacekjr) or [LinkedIn](https://www.linkedin.com/in/jamessedlacekjr/)


