//
//  CompactCoordinator.swift
//  Ocadex
//
//  Created by Jose Marchena on 21/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

final class CompactCoordinator: Coordinator {

    private let window: UIWindow
    private let ocamonStore: Store = Store()
    private let rootViewController: UINavigationController = UINavigationController()
    private lazy var ocamonListViewController: OcamonsViewController = OcamonsViewController(store: ocamonStore)
    private let animated: Bool

    private var aboutViewController: UINavigationController? = nil

    init(using window: UIWindow, animated: Bool = true) {
        self.window = window
        self.animated = animated
    }

    func start() {
        rootViewController.pushViewController(ocamonListViewController, animated: animated)
        rootViewController.navigationBar.prefersLargeTitles = true
        ocamonListViewController.didSelect = showOcamon
        ocamonListViewController.didTapAbout = showAbout
        ocamonListViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "About", style: .plain, target: self, action: #selector(self.showAbout))
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    private func showOcamon(_ ocamon: Ocamon) {
        let ocamonVC = OcamonViewController(with: ocamon)
        rootViewController.pushViewController(ocamonVC, animated: animated)
    }

    @objc private func showAbout() {
        aboutViewController = provideAboutViewController()
        if let wrappedAboutViewController = aboutViewController {
            ocamonListViewController.present(wrappedAboutViewController, animated: animated, completion: nil)
        }
    }

    private func closeAbout() {
        aboutViewController?.dismiss(animated: animated, completion: nil)
        aboutViewController?.viewControllers = []
        aboutViewController = nil
    }

    private func provideAboutViewController () -> UINavigationController {
        let aboutViewController = AboutViewController()
        aboutViewController.didTapClose = closeAbout
        return aboutViewController.wrappedInNavigationController(prefersLargeTitles: false)
    }
}
