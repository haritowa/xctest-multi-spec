//
//  TestCondition.swift
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/28/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

import Foundation

public protocol TestConditionValue {
    var valueShortName: String { get }
}

public struct TestCondition<T: TestConditionValue> {
    public let name: String
    public let values: [T]

    public init(name: String, values: [T]) {
        self.name = name
        self.values = values
    }
}
