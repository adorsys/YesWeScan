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
        XCTAssertNotNil(UIImage.buttonImage)
        XCTAssertNotNil(UIImage.targetBracesToggleImage)
        XCTAssertNotNil(UIImage.torchImage)
    }
}
