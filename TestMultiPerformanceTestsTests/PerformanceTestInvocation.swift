//
//  PerformanceTestInvocation.swift
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/27/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

import Foundation

/// Abstract invocation class, descedants can customize test name, preparation and run stage
open class PerformanceTestInvocation: NSObject {
    private let _testName: String
    
    public init(testName: String) {
        self._testName = testName
        super.init()
    }
    
    /// Test name used to generate invocation and may be slightly modificated
    open var testName: String {
        return _testName
    }
    
    /// Single performance test run. All preparation work must be done during prepare method.
    open func prepare() {
        
    }
    
    /// Runs before each measurment, does not affect total test time.
    open func run() {
        
    }
}

extension PerformanceTestInvocation {
    @objc var suggestedTestName: String {
        return testName
    }
    
    @objc func runTestIteration() {
        run()
    }
    
    @objc func prepareTestInteration() {
        prepare()
    }
}
