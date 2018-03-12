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

    init(using window: UIWindow) {
        self.window = window
    }

    func start() {
        let masterNavigationController = ocamonListViewController.wrappedInNavigationController(prefersLargeTitles: true)
        rootViewController.viewControllers = [masterNavigationController, EmptyViewController()]
        rootViewController.preferredDisplayMode = .allVisible
        rootViewController.delegate = self

        ocamonListViewController.didSelect = showOcamon

        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    // MARK: - Actions

    private func showOcamon(_ ocamon: Ocamon) {
        removeEmptyViewController()
        let ocamonNavigationController = OcamonViewController(with: ocamon).wrappedInNavigationController(prefersLargeTitles: true)
        rootViewController.showDetailViewController(ocamonNavigationController, sender: self)
    }

    private func showAbout() {
        let navigationController = AboutViewController().wrappedInNavigationController()
        setupPopoverPresentation(for: navigationController)
        rootViewController.present(navigationController, animated: true, completion: nil)
    }

    // MARK: - Helper methods

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
