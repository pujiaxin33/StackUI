//
//  Slider.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/12.
//

import UIKit

public protocol StackUISlider: UISlider, StackUIControl {
    func value(_ value: Float) -> Self
    func value(_ publisher: Publisher<Float>) -> Self
    func minimumValue(_ minimumValue: Float) -> Self
    func maximumValue(_ maximumValue: Float) -> Self
    func minimumValueImage(_ minimumValueImage: UIImage?) -> Self
    func maximumValueImage(_ maximumValueImage: UIImage?) -> Self
    func isContinuous(_ isContinuous: Bool) -> Self
    func minimumTrackTintColor(_ minimumTrackTintColor: UIColor?) -> Self
    func maximumTrackTintColor(_ maximumTrackTintColor: UIColor?) -> Self
    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self
    func thumbImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func minimumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func maximumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self
}

public extension StackUISlider {
    func value(_ value: Float) -> Self {
        self.value = value
        return self
    }
    func value(_ publisher: Publisher<Float>) -> Self {
        publisher.addSubscriber {[weak self] value in
            self?.value = value
        }
        return self
    }
    func minimumValue(_ minimumValue: Float) -> Self {
        self.minimumValue = minimumValue
        return self
    }
    func maximumValue(_ maximumValue: Float) -> Self {
        self.maximumValue = maximumValue
        return self
    }
    func minimumValueImage(_ minimumValueImage: UIImage?) -> Self {
        self.minimumValueImage = minimumValueImage
        return self
    }
    func maximumValueImage(_ maximumValueImage: UIImage?) -> Self {
        self.maximumValueImage = maximumValueImage
        return self
    }
    func isContinuous(_ isContinuous: Bool) -> Self {
        self.isContinuous = isContinuous
        return self
    }
    func minimumTrackTintColor(_ minimumTrackTintColor: UIColor?) -> Self {
        self.minimumTrackTintColor = minimumTrackTintColor
        return self
    }
    func maximumTrackTintColor(_ maximumTrackTintColor: UIColor?) -> Self {
        self.maximumTrackTintColor = maximumTrackTintColor
        return self
    }
    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self {
        self.thumbTintColor = thumbTintColor
        return self
    }
    func thumbImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setThumbImage(image, for: state)
        return self
    }
    func minimumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setMinimumTrackImage(image, for: state)
        return self
    }
    func maximumTrackImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setMaximumTrackImage(image, for: state)
        return self
    }
}

open class Slider: UISlider, StackUISlider {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
