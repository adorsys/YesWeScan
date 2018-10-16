//
//  AssetsAccessTests.swift
//  YesWeScanTests
//
//  Created by Xaver Lohmüller on 15.10.18.
//

import XCTest
@testable import YesWeScan

class AssetsAccessTests: XCTestCase {

    func testAssetsCanBeAccessed() {
        XCTAssertNoThrow(UIImage.buttonImage)
        XCTAssertNoThrow(UIImage.targetBracesToggleImage)
        XCTAssertNoThrow(UIImage.torchImage)
    }
}
