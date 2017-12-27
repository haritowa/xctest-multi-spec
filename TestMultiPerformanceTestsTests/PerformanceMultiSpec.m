//
//  PerformanceMultiSpec.m
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/27/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestMultiPerformanceTestsTests-Swift.h" // TODO: Rename
#import "PerformanceMultiSpec.h"

@implementation PerformanceMultiSpec

+ (SEL)addInstanceMethodForTestInvocation:(PerformanceTestInvocation *)performanceInvocation classSelectorNames:(NSMutableSet<NSString*> *)selectorNames {
    // Resolve selectors with same name
    NSString *originalName = [performanceInvocation suggestedTestName];
    NSString *selectorName = originalName;
    NSUInteger i = 1;
    
    while ([selectorNames containsObject:selectorName]) {
        selectorName = [NSString stringWithFormat:@"%@_%tu", originalName, ++i];
    }
    
    if (i != 1) {
        NSLog(@"PerformanceMultiSpec: duplicate selector for test named \"%@\"", originalName);
    }
    
    [selectorNames addObject:selectorName];
    
    NSArray<XCTPerformanceMetric> *metrics = [self defaultPerformanceMetrics];
    
    // Build selector
    // Pack test closure with preparation steps
    IMP implementation = imp_implementationWithBlock(^(PerformanceMultiSpec *self){
        [self measureMetrics:metrics automaticallyStartMeasuring:false forBlock:^{
            [performanceInvocation prepareTestInteration];
            
            [self startMeasuring];
            [performanceInvocation runTestIteration];
            [self stopMeasuring];
        }];
    });
    
    const char *types = [[NSString stringWithFormat:@"%s%s%s", @encode(void), @encode(id), @encode(SEL)] UTF8String];
    
    SEL result = NSSelectorFromString(selectorName);
    class_addMethod(self, result, implementation, types);
    
    return result;
}

+ (NSArray *)testInvocations {
    NSArray *performanceInvocations = [self performanceTestInvocations];
    NSMutableArray *invocations = [NSMutableArray arrayWithCapacity:[performanceInvocations count]];

    NSMutableSet<NSString*>* selectorNames = [NSMutableSet set];

    for (PerformanceTestInvocation *testInvocation in performanceInvocations) {
        // Add method to instance
        SEL selector = [self addInstanceMethodForTestInvocation:testInvocation classSelectorNames:selectorNames];

        // Generate invocation for XCTest
        NSMethodSignature *signature = [self instanceMethodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.selector = selector;

        [invocations addObject:invocation];
    }

    return invocations;
}

+ (nonnull NSArray<PerformanceTestInvocation*> *) performanceTestInvocations {
    return [NSArray new];
}

@end

