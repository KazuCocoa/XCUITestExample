//
//  TestAppUITests.swift
//  TestAppUITests
//
//  Created by KazuakiMATSUO on 10/25/15.
//
//

import XCTest

class TestAppUITests: XCTestCase {

    private let app: XCUIApplication = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testShouldDisplayAlertWithText(){
        app.buttons["show alert"]
            .tap()
        app.alerts["Cool title"].collectionViews.buttons["OK"]
            .tap()
        XCTAssertFalse(app.alerts["Cool title"].exists)
    }
    
    func testShouldDisplayAlertWithAccessibility() {
        app.buttons.matchingIdentifier("accessibilityShowAlert").element
            .tap()
        app.alerts["Cool title"].collectionViews.buttons["OK"]
            .tap()
        XCTAssertFalse(app.alerts["Cool title"].exists)
    }
    
    func testShouldOpenGuesteView() {
        app.buttons["Test Gesture"]
            .tap()
        app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Map).element.tap()
        XCTAssertNotNil(app.maps.matchingIdentifier("map view").element.exists, "don't display map view")
    }

    func testCulc() {
        tap("IntegerA")
        fillText("IntegerA", "1")

        tap("IntegerB")
        fillText("IntegerB", "1")

        tap("ComputeSumButton")

        XCTAssert(app.staticTexts["Answer"].exists)
    }
    
    private func tap(title :String){
        app.textFields[title].tap()
    }
    
    private func fillText(title :String, _ body: String){
        app.textFields[title].typeText(body)
    }

}
