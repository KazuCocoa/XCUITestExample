//
//  TestAppUITests.swift
//  TestAppUITests
//
//  Created by KazuakiMATSUO on 10/25/15.
//
//

import XCTest

class TestAppUITests: BaseUITestClass {
    /*
    override func spec(){
        describe("base scenarios") {
            beforeEach {
                super.setUp()
                self.continueAfterFailure = false
                self.app.launch()
            }
            
            it("should display alert with text") {
                self.app.buttons["show alert"]
                    .tap()
                self.app.alerts["Cool title"].collectionViews.buttons["OK"]
                    .tap()
                XCTAssertFalse(self.app.alerts["Cool title"].exists)
            }
        }
    }
    */

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testShouldDisplayAlertWithText(){
        // run 10 times and measure performance during it.
        // Fail if the performance decrease from baseline.
        measureMetrics([XCTPerformanceMetric_WallClockTime], automaticallyStartMeasuring: true, forBlock: {
            self.app.buttons["show alert"]
                .tap()
            self.app.alerts["Cool title"].collectionViews.buttons["OK"]
                .tap()
            XCTAssertFalse(self.app.alerts["Cool title"].exists)
        })
    }
    
    func testShouldDisplayAlertWithAccessibility() {
        app.buttons.matchingIdentifier("accessibilityShowAlert").element
            .tap()
        app.alerts["Cool title"].collectionViews.buttons["OK"]
            .tap()
        XCTAssertFalse(app.alerts["Cool title"].exists)
    }
    
    func testShouldOpenGuesteView() {
        // define XCTestExpectation to wait on waitForExpectationsWithTimeout
        var theExpectation :XCTestExpectation
        theExpectation = expectationWithDescription("show map view")

        app.buttons["Test Gesture"]
            .tap()

        // Tell XCTestExpectation go waitForExpectationsWithTimeout
        theExpectation.fulfill()

        // Wait handler until interval.
        waitForExpectationsWithTimeout(5, handler: {
            error in XCTAssertNotNil(self.app.maps.matchingIdentifier("map view").element.exists, "don't display map view")
        })
    }

    func testCulc() {
        tap("IntegerA", ele_type: "text")
        fillText("IntegerA", "1")

        tap("IntegerB", ele_type: "text")
        fillText("IntegerB", "1")

        tap("ComputeSumButton", ele_type: "button")

        XCTAssert(app.staticTexts["2"].exists)
    }
    
}
