//
//  CoordinatorFactory.swift
//  Ocadex
//
//  Created by Jose Marchena on 28/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit


struct CoordinatorFactory {

    private let window: UIWindow
    private let animated: Bool

    init(using window: UIWindow, animated: Bool = true) {
        self.window = window
        self.animated = animated
    }

    func makeCoordinator() -> Coordinator {
        if window.traitCollection.horizontalSizeClass == .regular {
            return RegularCoordinator(using: window)
        }
        return CompactCoordinator(using: window, animated: animated)
    }
}
