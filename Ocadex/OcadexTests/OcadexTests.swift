//
//  OcadexTests.swift
//  OcadexTests
//
//  Created by Jose Marchena on 01/03/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import XCTest
@testable import Ocadex

class OcadexTests: XCTestCase {

    func testBasicFlow() {
        let window = UIWindow()
        let coordinator = CompactCoordinator(using: window, animated: false)
        coordinator.start()

        XCTAssert(window.currentlyPresenting is OcamonsViewController)

        let ocamonListVC: OcamonsViewController? = window.currentlyPresenting as? OcamonsViewController
        coordinator.showAbout()

        XCTAssert(window.currentlyPresenting is AboutViewController)

        let aboutVC: AboutViewController? = window.currentlyPresenting as? AboutViewController
        aboutVC?.didTapClose()

        XCTAssertEqual(window.currentlyPresenting, ocamonListVC)

        let ocamon = Ocamon(name: "TestOcamon", type: .soviet, info: "some info", image: nil)
        ocamonListVC?.didSelect(ocamon)

        XCTAssert(window.currentlyPresenting is OcamonViewController)
    }
}
