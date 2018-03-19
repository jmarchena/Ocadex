//
//  RegularCoordinator.swift
//  Ocadex
//
//  Created by Jose Marchena on 22/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

final class RegularCoordinator: Coordinator {

    private let window: UIWindow
    private let ocamonStore: Store = Store()
    private let rootViewController: UISplitViewController = UISplitViewController()
    private lazy var ocamonListViewController: OcamonsViewController = OcamonsViewController(store: ocamonStore)
    private var aboutViewController: UINavigationController? = nil
    private let animated: Bool

    init(using window: UIWindow, animated: Bool = true) {
        self.window = window
        self.animated = animated
    }

    func start() {
        let masterViewController = prepareOcamonListViewController()
        setupRootViewController(with: masterViewController)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    // MARK: - Actions

    private func showOcamon(_ ocamon: Ocamon) {
        removeEmptyViewController()
        let ocamonNavigationController = OcamonViewController(with: ocamon).wrappedInNavigationController(prefersLargeTitles: true)
        rootViewController.showDetailViewController(ocamonNavigationController, sender: self)
    }

    @objc private func showAbout() {
        aboutViewController = provideAboutViewController()
        if let wrappedAboutViewController = aboutViewController {
            setupPopoverPresentation(for: wrappedAboutViewController)
            rootViewController.present(wrappedAboutViewController, animated: animated, completion: nil)
        }
    }

    private func closeAbout() {
        aboutViewController?.dismiss(animated: animated, completion: nil)
        aboutViewController?.viewControllers = []
        aboutViewController = nil
    }

    // MARK: - Helper methods

    private func setupRootViewController(with master: UIViewController) {
        rootViewController.viewControllers = [master, EmptyViewController()]
        rootViewController.preferredDisplayMode = .allVisible
        rootViewController.delegate = self
    }

    private func prepareOcamonListViewController() -> UIViewController {
        ocamonListViewController.didSelect = showOcamon
        ocamonListViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "About", style: .plain, target: self, action: #selector(self.showAbout))
        return ocamonListViewController.wrappedInNavigationController(prefersLargeTitles: true)
    }

    private func provideAboutViewController () -> UINavigationController {
        let aboutViewController = AboutViewController()
        aboutViewController.didTapClose = closeAbout
        return aboutViewController.wrappedInNavigationController(prefersLargeTitles: false)
    }

    private func removeEmptyViewController() {
        if let index = indexOfEmptyViewController() {
            rootViewController.viewControllers.remove(at: index)
        }
    }

    private func indexOfEmptyViewController() -> Int? {
         return rootViewController.viewControllers.index { vc in
            return vc is EmptyViewController
        }
    }

    private func setupPopoverPresentation(for navigationController: UINavigationController) {
        navigationController.modalPresentationStyle = .popover
        navigationController.popoverPresentationController?.sourceView = rootViewController.view
        navigationController.popoverPresentationController?.sourceRect = CGRect(x: rootViewController.view.bounds.midX, y: rootViewController.view.bounds.midY, width: 0, height: 0)
        navigationController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
    }
}

extension RegularCoordinator: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
