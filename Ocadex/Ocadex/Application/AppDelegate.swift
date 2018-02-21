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
    var applicationCoordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        let coordinator = Coordinator(with: window)

        self.applicationCoordinator = coordinator
        self.window = window

        coordinator.start()
        return true
    }
}
