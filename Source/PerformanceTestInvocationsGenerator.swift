//
//  PerformanceTestInvocationsGenerator.swift
//  TestMultiPerformanceTestsTests
//
//  Created by haritowa on 12/28/17.
//  Copyright © 2017 haritowa. All rights reserved.
//

import Foundation

public struct PerformanceTestInvocationsGenerator<S> {
    public let testMethod: (S) -> Void
    
    public init(testMethod: @escaping (S) -> Void) {
        self.testMethod = testMethod
    }
    
    private func composeName(components: [(name: String, value: String)], componentSeparator: String = "__", valuesSeparator: String = "_") -> String {
        return components
            .map { component in "\(component.name)\(valuesSeparator)\(component.value)" }
            .joined(separator: componentSeparator)
    }
    
    private func composeGenerator<T>(data: T, constructor: @escaping (T) -> S) -> () -> S {
        return { constructor(data) }
    }
    
    private func createInvocation<T>(data: T, constructor: @escaping (T) -> S, components: [(name: String, value: String)]) -> StatePerformanceTestInvocation<S> {
        let composedStateGenerator = composeGenerator(data: data, constructor: constructor)
        let name = composeName(components: components)
        
        return StatePerformanceTestInvocation<S>(testName: name, testMethod: testMethod, stateGenerator: composedStateGenerator)
    }
    
    public func generateInvocations<T>(_ firstParam: TestCondition<T>, stateGenerator: @escaping (T) -> S) -> [PerformanceTestInvocation] {
        var result = [StatePerformanceTestInvocation<S>]()

        for firstValue in firstParam.values {
            let data = (firstValue)
            let components = [(firstParam.name, firstValue.valueShortName)]
            result.append(createInvocation(data: data, constructor: stateGenerator, components: components))
        }

        return result
    }
    
    public func generateInvocations<T, F>(_ firstParam: TestCondition<T>, _ secondParam: TestCondition<F>, stateGenerator: @escaping (T, F) -> S) -> [PerformanceTestInvocation] {
        var result = [StatePerformanceTestInvocation<S>]()
        
        for firstValue in firstParam.values {
            for secondValue in secondParam.values {
                let data = (firstValue, secondValue)
                let components = [(firstParam.name, firstValue.valueShortName), (secondParam.name, secondValue.valueShortName)]
                
                result.append(createInvocation(data: data, constructor: stateGenerator, components: components))
            }
        }
        
        return result
    }
    
    public func generateInvocations<T, F, E>(_ firstParam: TestCondition<T>, _ secondParam: TestCondition<F>, _ thirdParam: TestCondition<E>, stateGenerator: @escaping (T, F, E) -> S) -> [PerformanceTestInvocation] {
        var result = [StatePerformanceTestInvocation<S>]()
        
        for firstValue in firstParam.values {
            for secondValue in secondParam.values {
                for thirdValue in thirdParam.values {
                    let data = (firstValue, secondValue, thirdValue)
                    
                    let components = [
                        (firstParam.name, firstValue.valueShortName),
                        (secondParam.name, secondValue.valueShortName),
                        (thirdParam.name, thirdValue.valueShortName)
                    ]
                    
                    result.append(createInvocation(data: data, constructor: stateGenerator, components: components))
                }
            }
        }
        
        return result
    }
    
    public func generateInvocations<T, F, E, D>(_ firstParam: TestCondition<T>, _ secondParam: TestCondition<F>, _ thirdParam: TestCondition<E>, _ fourthParam: TestCondition<D>, stateGenerator: @escaping (T, F, E, D) -> S) -> [PerformanceTestInvocation] {
        var result = [StatePerformanceTestInvocation<S>]()
        
        for firstValue in firstParam.values {
            for secondValue in secondParam.values {
                for thirdValue in thirdParam.values {
                    for fourthValue in fourthParam.values {
                        let data = (firstValue, secondValue, thirdValue, fourthValue)
                        
                        let components = [
                            (firstParam.name, firstValue.valueShortName),
                            (secondParam.name, secondValue.valueShortName),
                            (thirdParam.name, thirdValue.valueShortName),
                            (fourthParam.name, fourthValue.valueShortName)
                        ]
                        
                        result.append(createInvocation(data: data, constructor: stateGenerator, components: components))
                    }
                }
            }
        }
        
        return result
    }
    
    public func generateInvocations<T, F, E, C, D>(_ firstParam: TestCondition<T>, _ secondParam: TestCondition<F>, _ thirdParam: TestCondition<E>, _ fourthParam: TestCondition<C>, _ fithParam: TestCondition<D>, stateGenerator: @escaping (T, F, E, C, D) -> S) -> [PerformanceTestInvocation] {
        var result = [StatePerformanceTestInvocation<S>]()
        
        for firstValue in firstParam.values {
            for secondValue in secondParam.values {
                for thirdValue in thirdParam.values {
                    for fourthValue in fourthParam.values {
                        for fithValue in fithParam.values {
                            let data = (firstValue, secondValue, thirdValue, fourthValue, fithValue)
                            
                            let components = [
                                (firstParam.name, firstValue.valueShortName),
                                (secondParam.name, secondValue.valueShortName),
                                (thirdParam.name, thirdValue.valueShortName),
                                (fourthParam.name, fourthValue.valueShortName),
                                (fithParam.name, fithValue.valueShortName)
                            ]
                            
                            result.append(createInvocation(data: data, constructor: stateGenerator, components: components))
                        }
                    }
                }
            }
        }
        
        return result
    }
    
    public func generateInvocations<T, F, E, C, D, G>(_ firstParam: TestCondition<T>, _ secondParam: TestCondition<F>, _ thirdParam: TestCondition<E>, _ fourthParam: TestCondition<C>, _ fithParam: TestCondition<D>, _ sixthParam: TestCondition<G>, stateGenerator: @escaping (T, F, E, C, D, G) -> S) -> [PerformanceTestInvocation] {
        var result = [StatePerformanceTestInvocation<S>]()
        
        for firstValue in firstParam.values {
            for secondValue in secondParam.values {
                for thirdValue in thirdParam.values {
                    for fourthValue in fourthParam.values {
                        for fithValue in fithParam.values {
                            for sixthValue in sixthParam.values {
                                let data = (firstValue, secondValue, thirdValue, fourthValue, fithValue, sixthValue)
                                
                                let components = [
                                    (firstParam.name, firstValue.valueShortName),
                                    (secondParam.name, secondValue.valueShortName),
                                    (thirdParam.name, thirdValue.valueShortName),
                                    (fourthParam.name, fourthValue.valueShortName),
                                    (fithParam.name, fithValue.valueShortName),
                                    (sixthParam.name, sixthValue.valueShortName)
                                ]
                                
                                result.append(createInvocation(data: data, constructor: stateGenerator, components: components))
                            }
                        }
                    }
                }
            }
        }
        
        return result
    }
    
    public func generateInvocations<T, F, E, C, D, G, H>(_ firstParam: TestCondition<T>, _ secondParam: TestCondition<F>, _ thirdParam: TestCondition<E>, _ fourthParam: TestCondition<C>, _ fithParam: TestCondition<D>, _ sixthParam: TestCondition<G>, _ seventhParam: TestCondition<H>, stateGenerator: @escaping (T, F, E, C, D, G, H) -> S) -> [PerformanceTestInvocation] {
        var result = [StatePerformanceTestInvocation<S>]()
        
        for firstValue in firstParam.values {
            for secondValue in secondParam.values {
                for thirdValue in thirdParam.values {
                    for fourthValue in fourthParam.values {
                        for fithValue in fithParam.values {
                            for sixthValue in sixthParam.values {
                                for seventhValue in seventhParam.values {
                                    let data = (firstValue, secondValue, thirdValue, fourthValue, fithValue, sixthValue, seventhValue)
                                    
                                    let components = [
                                        (firstParam.name, firstValue.valueShortName),
                                        (secondParam.name, secondValue.valueShortName),
                                        (thirdParam.name, thirdValue.valueShortName),
                                        (fourthParam.name, fourthValue.valueShortName),
                                        (fithParam.name, fithValue.valueShortName),
                                        (sixthParam.name, sixthValue.valueShortName),
                                        (seventhParam.name, seventhValue.valueShortName)
                                    ]
                                    
                                    result.append(createInvocation(data: data, constructor: stateGenerator, components: components))
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return result
    }
}

