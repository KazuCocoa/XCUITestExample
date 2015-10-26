//
//  BaseUITestClass.swift
//  TestApp
//
//  Created by KazuakiMATSUO on 10/27/15.
//
//

import XCTest

class BaseUITestClass: XCTestCase {
    let app: XCUIApplication = XCUIApplication()
    
    func tap(title: String, ele_type type : String){
        switch type {
        case "text":
            app.textFields[title].tap()
        case "button":
            app.buttons[title].tap()
        default:
            app.textFields[title].tap()
        }
    }
    
    func fillText(title: String, _ body: String){
        app.textFields[title].typeText(body)
    }

}