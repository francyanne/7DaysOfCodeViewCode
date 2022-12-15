//
//  AppDelegate.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 14/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let moviesViewController = MoviesViewController()
        let navigationController = UINavigationController(rootViewController: moviesViewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

