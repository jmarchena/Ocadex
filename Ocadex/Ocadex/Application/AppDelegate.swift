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

final class Coordinator {

    let window: UIWindow
    let ocamonStore: Store = Store()
    let rootViewController: UINavigationController = UINavigationController()
    lazy var ocamonListViewController: OcamonsViewController = OcamonsViewController(store: ocamonStore)

    init(with window: UIWindow) {
        self.window = window
    }

    func start() {
        rootViewController.pushViewController(ocamonListViewController, animated: true)
        ocamonListViewController.didSelect = showOcamon
        ocamonListViewController.didTapAbout = showAbout
        rootViewController.navigationBar.prefersLargeTitles = true
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    private func showOcamon(_ ocamon: Ocamon) {
        rootViewController.show(OcamonViewController(with: ocamon), sender: self)
    }

    private func showAbout() {
        let navController = UINavigationController(rootViewController: AboutViewController())
        ocamonListViewController.present(navController, animated: true, completion: nil)
    }
}
