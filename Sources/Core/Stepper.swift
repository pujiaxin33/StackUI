//
//  Stepper.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/12.
//

import UIKit

public protocol StackUIStepper: UIStepper, StackUIControl {
    func isContinuous(_ isContinuous: Bool) -> Self
    func autorepeat(_ autorepeat: Bool) -> Self
    func wraps(_ wraps: Bool) -> Self
    func value(_ value: Double) -> Self
    func value(_ publisher: Publisher<Double>) -> Self
    func minimumValue(_ minimumValue: Double) -> Self
    func maximumValue(_ maximumValue: Double) -> Self
    func stepValue(_ stepValue: Double) -> Self
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func dividerImage(_ image: UIImage?, forLeftSegmentState leftState: UIControl.State, rightSegmentState rightState: UIControl.State) -> Self
    func incrementImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func decrementImage(_ image: UIImage?, for state: UIControl.State) -> Self
}

public extension StackUIStepper {
    func isContinuous(_ isContinuous: Bool) -> Self {
        self.isContinuous = isContinuous
        return self
    }
    func autorepeat(_ autorepeat: Bool) -> Self {
        self.autorepeat = autorepeat
        return self
    }
    func wraps(_ wraps: Bool) -> Self {
        self.wraps = wraps
        return self
    }
    func value(_ value: Double) -> Self {
        self.value = value
        return self
    }
    func value(_ publisher: Publisher<Double>) -> Self {
        publisher.addSubscriber {[weak self] value in
            self?.value = value
        }
        return self
    }
    func minimumValue(_ minimumValue: Double) -> Self {
        self.minimumValue = minimumValue
        return self
    }
    func maximumValue(_ maximumValue: Double) -> Self {
        self.maximumValue = maximumValue
        return self
    }
    func stepValue(_ stepValue: Double) -> Self {
        self.stepValue = stepValue
        return self
    }
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    func dividerImage(_ image: UIImage?, forLeftSegmentState leftState: UIControl.State, rightSegmentState rightState: UIControl.State) -> Self {
        self.setDividerImage(image, forLeftSegmentState: leftState, rightSegmentState: rightState)
        return self
    }
    func incrementImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setIncrementImage(image, for: state)
        return self
    }
    func decrementImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setDecrementImage(image, for: state)
        return self
    }
}

open class Stepper: UIStepper, StackUIStepper {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
