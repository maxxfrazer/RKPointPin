//
//  XCTestManifests.swift
//  RKPointPin
//
//  Created by Max Cobb on 1/4/20.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(RKPointPinTests.allTests),
    ]
}
#endif
