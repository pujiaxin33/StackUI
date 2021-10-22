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
    
    func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> Self
    func autocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> Self
    func spellCheckingType(_ spellCheckingType: UITextSpellCheckingType) -> Self
    @available(iOS 11.0, *)
    func smartQuotesType(_ smartQuotesType: UITextSmartQuotesType) -> Self
    @available(iOS 11.0, *)
    func smartDashesType(_ smartDashesType: UITextSmartDashesType) -> Self
    @available(iOS 11.0, *)
    func smartInsertDeleteType(_ smartInsertDeleteType: UITextSmartInsertDeleteType) -> Self
    func keyboardType(_ keyboardType: UIKeyboardType) -> Self
    func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) -> Self
    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Self
    func enablesReturnKeyAutomatically(_ enablesReturnKeyAutomatically: Bool) -> Self
    func isSecureTextEntry(_ isSecureTextEntry: Bool) -> Self
    @available(iOS 10.0, *)
    func textContentType(_ textContentType: UITextContentType!) -> Self
    @available(iOS 12.0, *)
    func passwordRules(_ passwordRules: UITextInputPasswordRules?) -> Self
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
    
    func autocapitalizationType(_ autocapitalizationType: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = autocapitalizationType
        return self
    }
    func autocorrectionType(_ autocorrectionType: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = autocorrectionType
        return self
    }
    func spellCheckingType(_ spellCheckingType: UITextSpellCheckingType) -> Self {
        self.spellCheckingType = spellCheckingType
        return self
    }
    @available(iOS 11.0, *)
    func smartQuotesType(_ smartQuotesType: UITextSmartQuotesType) -> Self {
        self.smartQuotesType = smartQuotesType
        return self
    }
    @available(iOS 11.0, *)
    func smartDashesType(_ smartDashesType: UITextSmartDashesType) -> Self {
        self.smartDashesType = smartDashesType
        return self
    }
    @available(iOS 11.0, *)
    func smartInsertDeleteType(_ smartInsertDeleteType: UITextSmartInsertDeleteType) -> Self {
        self.smartInsertDeleteType = smartInsertDeleteType
        return self
    }
    func keyboardType(_ keyboardType: UIKeyboardType) -> Self {
        self.keyboardType = keyboardType
        return self
    }
    func keyboardAppearance(_ keyboardAppearance: UIKeyboardAppearance) -> Self {
        self.keyboardAppearance = keyboardAppearance
        return self
    }
    func returnKeyType(_ returnKeyType: UIReturnKeyType) -> Self {
        self.returnKeyType = returnKeyType
        return self
    }
    func enablesReturnKeyAutomatically(_ enablesReturnKeyAutomatically: Bool) -> Self {
        self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
        return self
    }
    func isSecureTextEntry(_ isSecureTextEntry: Bool) -> Self {
        self.isSecureTextEntry = isSecureTextEntry
        return self
    }
    @available(iOS 10.0, *)
    func textContentType(_ textContentType: UITextContentType!) -> Self {
        self.textContentType = textContentType
        return self
    }
    @available(iOS 12.0, *)
    func passwordRules(_ passwordRules: UITextInputPasswordRules?) -> Self {
        self.passwordRules = passwordRules
        return self
    }
}

/// The width and height of `TextView` is required
open class TextView: UITextView, StackUITextView {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
