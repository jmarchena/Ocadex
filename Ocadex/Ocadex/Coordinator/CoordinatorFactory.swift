//
//  CoordinatorFactory.swift
//  Ocadex
//
//  Created by Jose Marchena on 28/02/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import UIKit


struct CoordinatorFactory {

    let window: UIWindow

    init(using window: UIWindow) {
        self.window = window
    }

    func makeCoordinator() -> Coordinator {
        if window.traitCollection.horizontalSizeClass == .regular {
            return RegularCoordinator(using: window)
        }
        return CompactCoordinator(using: window)
    }
}
