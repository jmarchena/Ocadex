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
    var ocamonStore: Store?
    var rootViewController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.ocamonStore = Store()
        self.rootViewController = UINavigationController()
        let coordinator = Coordinator(with: window)
        coordinator.start()
        self.window = window

        return true
    }
}
