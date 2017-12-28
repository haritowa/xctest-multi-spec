//
//  TestMultiPerformanceTestsTests.swift
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/27/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

import XCTest

struct State {
    let filemap: Filemap
    let mainQueue: DownloadQueue
    let secondaryQueue: DownloadQueue
    let downloadQueue: DownloadQueue
}

enum Filemap: String, TestConditionValue {
    case hasTracks, hasNotTracks
    
    static let all: [Filemap] = [.hasTracks, .hasNotTracks]
    
    var valueShortName: String { return rawValue }
}

enum DownloadQueue: String, TestConditionValue {
    case hasTasks, empty
    
    static let all: [DownloadQueue] = [.hasTasks, .empty]
    
    var valueShortName: String { return rawValue }
}

class TestMe: PerformanceMultiSpec {
    static func test(state: State) {
        print("Here")
    }
    
    override class func performanceTestInvocations() -> [PerformanceTestInvocation] {
        return PerformanceTestInvocationsGenerator(testMethod: TestMe.test)
        .generateInvocations(
            TestCondition(name: "filemap", values: Filemap.all),
            TestCondition(name: "main", values: DownloadQueue.all),
            TestCondition(name: "secondary", values: DownloadQueue.all),
            TestCondition(name: "download", values: DownloadQueue.all),
            stateGenerator: State.init
        )
    }
}

