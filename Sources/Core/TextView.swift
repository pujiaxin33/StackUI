//
//  TextView.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

public protocol StackUITextView: UITextView, StackUIScrollView {
    func delegate(_ delegate: UITextViewDelegate?) -> Self
    func text(_ text: String) -> Self
    func font(_ font: UIFont?) -> Self
    func textColor(_ textColor: UIColor?) -> Self
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self
    func selectedRange(_ selectedRange: NSRange) -> Self
    func isEditable(_ isEditable: Bool) -> Self
    func isSelectable(_ isSelectable: Bool) -> Self
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> Self
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key:Any]) -> Self
    func inputView(_ inputView: UIView?) -> Self
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self
    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self
    func textContainerInset(_ textContainerInset: UIEdgeInsets) -> Self
    func linkTextAttributes(_ linkTextAttributes: [NSAttributedString.Key:Any]) -> Self
    @available(iOS 13.0, *)
    func usesStandardTextScaling(_ usesStandardTextScaling: Bool) -> Self
    @available(iOS 15.0, *)
    func interactionState(_ interactionState: Any) -> Self
}

public extension StackUITextView {
    func delegate(_ delegate: UITextViewDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    func text(_ text: String) -> Self {
        self.text = text
        return self
    }
    func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }
    func textColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    func selectedRange(_ selectedRange: NSRange) -> Self {
        self.selectedRange = selectedRange
        return self
    }
    func isEditable(_ isEditable: Bool) -> Self {
        self.isEditable = isEditable
        return self
    }
    func isSelectable(_ isSelectable: Bool) -> Self {
        self.isSelectable = isSelectable
        return self
    }
    func dataDetectorTypes(_ dataDetectorTypes: UIDataDetectorTypes) -> Self {
        self.dataDetectorTypes = dataDetectorTypes
        return self
    }
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self {
        self.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key:Any]) -> Self {
        self.typingAttributes = typingAttributes
        return self
    }
    func inputView(_ inputView: UIView?) -> Self {
        self.inputView = inputView
        return self
    }
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self {
        self.inputAccessoryView = inputAccessoryView
        return self
    }
    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self {
        self.clearsOnInsertion = clearsOnInsertion
        return self
    }
    func textContainerInset(_ textContainerInset: UIEdgeInsets) -> Self {
        self.textContainerInset = textContainerInset
        return self
    }
    func linkTextAttributes(_ linkTextAttributes: [NSAttributedString.Key:Any]) -> Self {
        self.linkTextAttributes = linkTextAttributes
        return self
    }
    @available(iOS 13.0, *)
    func usesStandardTextScaling(_ usesStandardTextScaling: Bool) -> Self {
        self.usesStandardTextScaling = usesStandardTextScaling
        return self
    }
    @available(iOS 15.0, *)
    func interactionState(_ interactionState: Any) -> Self {
        self.interactionState = interactionState
        return self
    }
}

/// The width and height of `TextView` is required
open class TextView: UITextView, StackUITextView {}
