//
//  Control.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

public protocol StackUIControl: UIControl, StackUIView {
    func target(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self
    func isEnabled(_ isEnabled: Bool) -> Self
    func isSelected(_ isSelected: Bool) -> Self
    func isHighlighted(_ isHighlighted: Bool) -> Self
    func contentVerticalAlignment(_ contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self
    func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self
}

public extension StackUIControl {
    func target(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) -> Self {
        addTarget(target, action: action, for: controlEvents)
        return self
    }
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    func isSelected(_ isSelected: Bool) -> Self {
        self.isSelected = isSelected
        return self
    }
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    func contentVerticalAlignment(_ contentVerticalAlignment: UIControl.ContentVerticalAlignment) -> Self {
        self.contentVerticalAlignment = contentVerticalAlignment
        return self
    }
    func contentHorizontalAlignment(_ contentHorizontalAlignment: UIControl.ContentHorizontalAlignment) -> Self {
        self.contentHorizontalAlignment = contentHorizontalAlignment
        return self
    }
}

open class Control: UIControl, StackUIControl {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
