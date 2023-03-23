//
//  AppDelegate.swift
//  MarsDemo
//
//  Created by DouDou on 2023/3/22.
//

import UIKit
import Mars_iOS

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // swiftlint: disable unavailable_condition
        if #available(iOS 13, *) {
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            didInitWindow()
        }
        return true
    }

    func didInitWindow() {
        if #available(iOS 13.0, *) {
            let navigationBar = UINavigationBar.appearance()

            navigationBar.scrollEdgeAppearance = {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = .white
                appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                return appearance
            }()

            navigationBar.standardAppearance = {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = .white
                appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                return appearance
            }()
        }
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).map(\.path)
        let logPath: String = "\(paths.first ?? "")/Xlogs/"
        if !FileManager.default.fileExists(atPath: logPath) {
            do {
                try FileManager.default.createDirectory(atPath: logPath, withIntermediateDirectories: false)
            } catch {
                
            }
        }
        XloggerManager.setup(with: .debug, releaseLevel: .info, path: logPath, prefix: "Dou")
        window?.backgroundColor = .white
        let rootVc = ViewController()
        let naviVc = UINavigationController(rootViewController: rootVc)
        window?.rootViewController = naviVc
        window?.makeKeyAndVisible()
        
        XloggerManager.log(.debug, tag: "AppDelegate", content: "application")
        
    }

    func application(_: UIApplication, open _: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        true
    }

    func applicationWillTerminate(_: UIApplication) {
        XloggerManager.deinit()
    }
}

@available(iOS 13.0, *)
extension AppDelegate: UIWindowSceneDelegate {
    // MARK: UISceneSession Lifecycle

    func application(
        _: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication, didDiscardSceneSessions _: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        didInitWindow()
    }

    func sceneDidDisconnect(_: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

    func scene(_: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        URLContexts.forEach { context in
            if let scheme = context.url.scheme, scheme == "WeCashUnionPay" {}
        }
    }
}
