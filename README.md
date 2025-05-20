# miniapp-uikit-sdk

## Table of Contents

1. [Introduction](#introduction)
2. [Installation](#installation)
3. [Description](#description)
4. [Usage](#usage)
5. [Support](#support)
6. [Roadmap](#roadmap)

## Introduction

This library is an extension to [miniapp-core-sdk](https://github.com/stanydsouza/miniapp-core-sdk.git) library along with UIKit Navigation logic to peform navigation between diffrent MiniApp's. This library consists the `miniapp_core` & `miniapp_uikit` framework.

### What is a MiniApp?

​
Mini apps are indpendent modules that provide functionalities such as content display, data input, social sharing, payment processing, and more. Mini apps are typically developed using platform-specific frameworks or development kits provided by the platform or ecosystem they are built for. The key advantages of mini apps include their lightweight nature, ease of use, and seamless integration with the hosting platform.

&nbsp;

## Installation

### Swift Package Manager

To integrate `miniapp_uikit` SDK into your Xcode project using Swift Package Manager, add it to the dependencies value of your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/stanydsouza/miniapp-uikit-sdk.git", .upToNextMajor(from: "0.0.1"))
]
```

### Requirements

Swift Version: 5.10

| Supported Platform | Min. Version |
| ------------------ | ------------ |
| iOS                |    14.0      |
| tvOS               |    14.0      |

&nbsp;

## Description

The `miniapp_uikit` framework implements the navigation logic for the Navigation module of [miniapp-core-sdk](https://github.com/stanydsouza/miniapp-core-sdk.git).

### MiniAppUIKit

It's a namespace which provide access to Navigation module of the SDK.

```swift
public enum MiniAppUIKit {
    public static let Navigation: NavigationProtocol
}
```

### Navigation

Navigation Module allows us to configure MiniApp's & navigation between them.

```swift
public protocol NavigationProtocol {
    func config(rootViewController: UIViewController, window: UIWindow, miniApps: [any MiniApp])
}
```

```swift
public protocol MiniApp {
    var name: String { get } // Name of the MiniApp
    var viewController: UIViewController { get } // UIViewController object for the MiniApp
}
```

&nbsp;

## Usage

```swift
// Viewcontrollers & MiniApps
import UIKit

final class SplashViewController: UIViewController {
    ...
}

final class LoginViewController: UIViewController {
    ...
}

final class HomeViewController: UIViewController {
    ...
}

struct LoginMiniApp: MiniApp {
    var name: String = "Login"
    var viewController: UIViewController = LoginViewController()
}

struct HomeMiniApp: MiniApp {
    var name: String = "Home"
    var viewController: UIViewController = HomeViewController()
}
```

```swift
import miniapp_uikit

// In SceneDelegate, configure the miniapps
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        MiniAppUIKit.Navigation.config(
            rootViewController: SplashViewController(), // The initial screen to show which marks entry in the app.
            window: sceneDelegate.window!,
             miniApps: [
                LoginMiniApp(),
                HomeMiniApp()
            ]
        )
    }

    ....
}
```

In `SplashViewController`, we can configure the routing data & show the first screen

```swift
import miniapp_core

final class SplashViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Get the routing json logic

        MiniAppCore.Navigation.configRouters(routers: json, currentMiniApp: "Login")
    }

}
```

&nbsp;

## Support

Email: <stanydsouza93@gmail.com>

&nbsp;

## Roadmap

- Swift 6 support

&nbsp;

## License

MIT License
