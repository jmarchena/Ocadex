//
//  AppDelegate.swift
//  Ocadex
//
//  Created by Jose Marchena on 13/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let ocamonsVC = OcamonsViewController(store: Store())
        let navigationController = UINavigationController(rootViewController: ocamonsVC)
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}
