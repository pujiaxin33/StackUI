//
//  Switch.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/12.
//

import UIKit

public protocol StackUISwitch: UISwitch, StackUIControl {
    func onTintColor(_ onTintColor: UIColor?) -> Self
    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self
    func onImage(_ onImage: UIImage?) -> Self
    func offImage(_ offImage: UIImage?) -> Self
    @available(iOS 14.0, *)
    func title(_ title: String?) -> Self
    @available(iOS 14.0, *)
    func preferredStyle(_ preferredStyle: UISwitch.Style) -> Self
    func isOn(_ isOn: Bool) -> Self
    func isOn(_ publisher: Publisher<Bool>) -> Self
}

public extension StackUISwitch {
    func onTintColor(_ onTintColor: UIColor?) -> Self {
        self.onTintColor = onTintColor
        return self
    }
    func thumbTintColor(_ thumbTintColor: UIColor?) -> Self {
        self.thumbTintColor = thumbTintColor
        return self
    }
    func onImage(_ onImage: UIImage?) -> Self {
        self.onImage = onImage
        return self
    }
    func offImage(_ offImage: UIImage?) -> Self {
        self.offImage = offImage
        return self
    }
    @available(iOS 14.0, *)
    func title(_ title: String?) -> Self {
        self.title = title
        return self
    }
    @available(iOS 14.0, *)
    func preferredStyle(_ preferredStyle: UISwitch.Style) -> Self {
        self.preferredStyle = preferredStyle
        return self
    }
    func isOn(_ isOn: Bool) -> Self {
        self.isOn = isOn
        return self
    }
    func isOn(_ publisher: Publisher<Bool>) -> Self {
        publisher.addSubscriber {[weak self] status in
            self?.isOn = status
        }
        return self
    }
}

open class SwitchUI: UISwitch, StackUISwitch {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
