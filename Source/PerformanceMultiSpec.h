//
//  PerformanceMultiSpec.h
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/27/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

#import <XCTest/XCTest.h>

@class PerformanceTestInvocation;

@interface PerformanceMultiSpec : XCTestCase
+ (nonnull NSArray<PerformanceTestInvocation*> *) performanceTestInvocations;
@end
