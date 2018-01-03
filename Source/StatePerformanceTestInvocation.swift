//
//  StatePerformanceTestInvocation.swift
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/27/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

import Foundation

open class StatePerformanceTestInvocation<S>: PerformanceTestInvocation {
    private var currentState: S!
    
    let testMethod: (S) -> Void
    let stateGenerator: () -> S
    
    public init(testName: String, testMethod: @escaping (S) -> Void, stateGenerator: @escaping () -> S) {
        self.testMethod = testMethod
        self.stateGenerator = stateGenerator
        
        super.init(testName: testName)
    }
    
    open override func prepare() {
        currentState = stateGenerator()
    }
    
    open override func run() {
        testMethod(currentState)
    }
}
