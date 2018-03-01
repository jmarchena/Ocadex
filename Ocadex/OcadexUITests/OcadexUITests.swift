//
//  OcadexUITests.swift
//  OcadexUITests
//
//  Created by Jose Marchena on 01/03/2018.
//  Copyright © 2018 Jose Marchena. All rights reserved.
//

import XCTest

class OcadexUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    func testTappingAboutOpensAboutScreen() {
        app.navigationBars["Ocadex"].buttons["About"].tap()
        let title = app.staticTexts["Ocadex 1.0"]
        XCTAssertTrue(title.exists)
    }

    func testClosingAboutDismissesAboutScreen() {
        app.navigationBars["Ocadex"].buttons["About"].tap()
        app.navigationBars["About"].buttons["Close"].tap()
        let ocamonListNavigationBar = app.navigationBars["Ocadex"]
        XCTAssertTrue(ocamonListNavigationBar.exists)
    }

    func testTappingOcamonShowsOcamonDetails() {
        let montyzardStaticText = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Montyzard"]/*[[".cells.staticTexts[\"Montyzard\"]",".staticTexts[\"Montyzard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        montyzardStaticText.tap()
        let montyzardDetailScreen = app.navigationBars["Montyzard"]
        XCTAssertTrue(montyzardDetailScreen.exists)
    }

    func testTappingBackInOcamonDetailShowsOcamonList() {
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Montyzard"]/*[[".cells.staticTexts[\"Montyzard\"]",".staticTexts[\"Montyzard\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Montyzard"].buttons["Ocadex"].tap()
        let ocamonListNavigationBar = app.navigationBars["Ocadex"]
        XCTAssertTrue(ocamonListNavigationBar.exists)
    }
}
