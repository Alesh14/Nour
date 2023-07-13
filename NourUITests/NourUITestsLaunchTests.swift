//
//  NourUITestsLaunchTests.swift
//  NourUITests
//
//  Created by Alisher Manatbek on 27.06.2023.
//

import XCTest

final class NourUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
