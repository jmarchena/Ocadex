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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testBasicFlow() {
        let window = UIWindow()
        let coordinator: Coordinator = CoordinatorFactory(using: window, animated: false).makeCoordinator()
        coordinator.start()

        XCTAssert(window.currentlyPresenting is OcamonsViewController)

        let ocamonListVC: OcamonsViewController? = window.currentlyPresenting as? OcamonsViewController
        ocamonListVC?.didTapAbout()

        XCTAssert(window.currentlyPresenting is AboutViewController)

        let aboutVC: AboutViewController? = window.currentlyPresenting as? AboutViewController
        aboutVC?.closeTapped()

        XCTAssertEqual(window.currentlyPresenting, ocamonListVC)

        let ocamon = Ocamon(name: "TestOcamon", type: .soviet, info: "some info", image: nil)
        ocamonListVC?.didSelect(ocamon)

        XCTAssert(window.currentlyPresenting is OcamonViewController)
    }
}
