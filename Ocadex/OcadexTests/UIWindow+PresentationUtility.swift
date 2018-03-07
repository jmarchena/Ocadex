//
//  UIWindow+PresentationUtility.swift
//  OcadexTests
//
//  Created by Jose Marchena on 02/03/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit

protocol ChildContainer {
    var child: UIViewController? { get }
}

extension UINavigationController: ChildContainer {
    var child: UIViewController? {
        return self.topViewController
    }
}

extension UISplitViewController: ChildContainer {
    var child: UIViewController? {
        return self.viewControllers.last
    }
}

extension UIViewController {

    var presentedVC: UIViewController? {
        guard let presented = self.presentedViewController as? ChildContainer else { return presentedViewController }
        return presented.child
    }

}
extension UIWindow {
    var currentlyPresenting: UIViewController {
        if let root = self.rootViewController as? ChildContainer, let child = root.child {
            guard let presented = child.presentedVC else {
                return child
            }
            return presented
        }
        return self.rootViewController?.presentedVC ?? UIViewController()
    }
}
