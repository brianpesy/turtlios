/*
 This is a course requirement for CS 192 Software Engineering II
 under the supervisino of Asst. Prof. Ma. Rowena C. Solamo
 of the Department of computer Science, College of Engineering,
 University of the Philippines, Diliman
 for the AY 2017-2018
 
 This code is created by Joan Nicole Balugay and Brian Sy.
 
 
 Code History
 Programmer           Date       Description
 Brian Sy             01/29/18   Creation
 Joan Nicole Balugay  01/29/18   Creation
 
 File Creation Date: 01/29/118
 Development Group: Joan Nicole Balugay, Brian Sy
 Client Group: CS 192
 Purpose of the Software: Note taking application - Turtl
 */

import XCTest

class TurtlUITests: XCTestCase {
    
    
    /* Put setup code here. This method is called before the invocation of each test method in the class. In UI tests it is usually best to stop immediately when a failure occurs. UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method. In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.*/
    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        XCUIApplication().launch()

    }
    
    /*Put teardown code here. This method is called after the invocation of each test method in the class.*/
    
    override func tearDown() {
        super.tearDown()
    }

    /* Use recording to get started writing UI tests. Use XCTAssert and related functions to verify your tests produce the correct results.*/
    
    func testExample() {

    }
    
}
