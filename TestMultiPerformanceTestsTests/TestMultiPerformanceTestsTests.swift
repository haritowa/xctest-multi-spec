//
//  TestMultiPerformanceTestsTests.swift
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/27/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

import XCTest

class TestMe: PerformanceMultiSpec {
    override class func performanceTestInvocations() -> [PerformanceTestInvocation] {
        return [
            PerformanceTestInvocation(testName: "testprivetic"),
            PerformanceTestInvocation(testName: "test2"),
            PerformanceTestInvocation(testName: "sfd")
        ]
    }
}

