//
//  PropertyWrapper.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/12.
//

import Foundation
import UIKit

@propertyWrapper
public struct Live<Value> {
    private let publisher = Publisher<Value>()
    public var wrappedValue: Value {
        didSet {
            projectedValue.didUpdate(wrappedValue)
        }
    }
    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
        publisher.didUpdate(wrappedValue)
    }
    public var projectedValue: Publisher<Value> {
        publisher
    }
}

public class Publisher<Value> {
    typealias SubscriberClosure = (Value)->()
    var lastValue: Value?
    var subscribers = [SubscriberClosure]()
    
    func addSubscriber(_ subscriber: @escaping SubscriberClosure) {
        if lastValue != nil {
            subscriber(lastValue!)
        }
        subscribers.append(subscriber)
    }
    func didUpdate(_ value: Value) {
        lastValue = value
        subscribers.forEach { $0(value) }
    }
}
