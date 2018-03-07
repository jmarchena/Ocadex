//
//  UIViewController+NavigationController.swift
//  Ocadex
//
//  Created by Jose Marchena on 03/03/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

extension UIViewController {
    func wrappedInNavigationController(prefersLargeTitles: Bool = false) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: self)
        navigationController.navigationBar.prefersLargeTitles = prefersLargeTitles
        return navigationController
    }
}
