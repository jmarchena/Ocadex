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
        prepareOcamonListViewController()
        setupRootViewController()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    // MARK: - Actions

    private func showOcamon(_ ocamon: Ocamon) {
        let ocamonVC = OcamonViewController(with: ocamon)
        rootViewController.pushViewController(ocamonVC, animated: animated)
    }

    @objc func showAbout() {
        aboutViewController = provideAboutViewController()
        if let wrappedAboutViewController = aboutViewController {
            ocamonListViewController.present(wrappedAboutViewController, animated: animated, completion: nil)
        }
    }

    private func closeAbout() {
        if animated {
            aboutViewController?.dismiss(animated: animated, completion: removeAboutViewController)
        } else {
            aboutViewController?.dismiss(animated: animated, completion: nil)
            removeAboutViewController()
        }
    }

    // MARK: - Helper methods

    private func provideAboutViewController () -> UINavigationController {
        let aboutViewController = AboutViewController()
        aboutViewController.didTapClose = closeAbout
        return aboutViewController.wrappedInNavigationController(prefersLargeTitles: false)
    }

    private func prepareOcamonListViewController() {
        ocamonListViewController.didSelect = showOcamon
        ocamonListViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "About", style: .plain, target: self, action: #selector(self.showAbout))
    }

    private func setupRootViewController() {
        rootViewController.pushViewController(ocamonListViewController, animated: animated)
        rootViewController.navigationBar.prefersLargeTitles = true
    }

    private func removeAboutViewController() {
        aboutViewController?.viewControllers = []
        aboutViewController = nil
    }
}
