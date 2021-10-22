//
//  ActivityIndicatorView.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/12.
//

import UIKit

public protocol StackUIActivityIndicatorView: UIActivityIndicatorView, StackUIView {
    func style(_ style: UIActivityIndicatorView.Style) -> Self
    func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self
    func color(_ color: UIColor!) -> Self
}

public extension StackUIActivityIndicatorView {
    func style(_ style: UIActivityIndicatorView.Style) -> Self {
        self.style = style
        return self
    }
    func hidesWhenStopped(_ hidesWhenStopped: Bool) -> Self {
        self.hidesWhenStopped = hidesWhenStopped
        return self
    }
    func color(_ color: UIColor!) -> Self {
        self.color = color
        return self
    }
}

open class ActivityIndicatorView: UIActivityIndicatorView, StackUIActivityIndicatorView {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
