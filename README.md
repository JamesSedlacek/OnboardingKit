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

<br>

## License

<details>
  <summary><strong>OnboardingKit is available under the MIT license.</strong></summary>
  <br>

Copyright (c) 2023 James Sedlacek

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

</details>


