//
//  AppDelegate.swift
//  SpaceXApp
//
//  Created by Владимир Фалин on 26.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
//        window?.makeKeyAndVisible()
        UILabel.appearance().textColor = .white
        UILabel.appearance().backgroundColor = .clear
        UIButton.appearance().tintColor = .white
        return true
    }
}

