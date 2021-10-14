//
//  TextField.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/11.
//

import UIKit

public protocol StackUITextField: UITextField, StackUIControl {
    func text(_ text: String?) -> Self
    func text(_ publisher: Publisher<String?>) -> Self
    func text(_ publisher: Publisher<String>) -> Self
    func attributedText(_ text: NSAttributedString?) -> Self
    func attributedText(_ publisher: Publisher<NSAttributedString?>) -> Self
    func attributedText(_ publisher: Publisher<NSAttributedString>) -> Self
    func textColor(_ textColor: UIColor?) -> Self
    func font(_ font: UIFont?) -> Self
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self
    func borderStyle(_ borderStyle: TextField.BorderStyle) -> Self
    func defaultTextAttributes(_ defaultTextAttributes: [NSAttributedString.Key : Any]) -> Self
    func placeholder(_ placeholder: String?) -> Self
    func placeholder(_ publisher: Publisher<String?>) -> Self
    func placeholder(_ publisher: Publisher<String>) -> Self
    func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self
    func attributedPlaceholder(_ publisher: Publisher<NSAttributedString?>) -> Self
    func attributedPlaceholder(_ publisher: Publisher<NSAttributedString>) -> Self
    func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> Self
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self
    func minimumFontSize(_ minimumFontSize: CGFloat) -> Self
    func delegate(_ delegate: UITextFieldDelegate?) -> Self
    func background(_ background: UIImage?) -> Self
    func disabledBackground(_ disabledBackground: UIImage?) -> Self 
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]) -> Self
    func clearButtonMode(_ clearButtonMode: TextField.ViewMode) -> Self
    func leftView(_ leftView: UIView?) -> Self
    func leftViewMode(_ leftViewMode: TextField.ViewMode) -> Self
    func rightView(_ rightView: UIView?) -> Self
    func rightViewMode(_ rightViewMode: TextField.ViewMode) -> Self
    func inputView(_ inputView: UIView?) -> Self
    func inputAccessoryView(_ inputAccessoryView: UIView?) -> Self
    func clearsOnInsertion(_ clearsOnInsertion: Bool) -> Self
}

public extension StackUITextField {
    func text(_ text: String?) -> Self {
        self.text = text
        return self
    }
    func text(_ publisher: Publisher<String?>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.text = text
        }
        return self
    }
    func text(_ publisher: Publisher<String>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.text = text
        }
        return self
    }
    func attributedText(_ text: NSAttributedString?) -> Self {
        self.attributedText = text
        return self
    }
    func attributedText(_ publisher: Publisher<NSAttributedString?>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.attributedText = text
        }
        return self
    }
    func attributedText(_ publisher: Publisher<NSAttributedString>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.attributedText = text
        }
        return self
    }
    func textColor(_ textColor: UIColor?) -> Self {
        self.textColor = textColor
        return self
    }
    func font(_ font: UIFont?) -> Self {
        self.font = font
        return self
    }
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    func borderStyle(_ borderStyle: TextField.BorderStyle) -> Self {
        self.borderStyle = borderStyle
        return self
    }
    func defaultTextAttributes(_ defaultTextAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.defaultTextAttributes = defaultTextAttributes
        return self
    }
    func placeholder(_ placeholder: String?) -> Self {
        self.placeholder = placeholder
        return self
    }
    func placeholder(_ publisher: Publisher<String?>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.placeholder = text
        }
        return self
    }
    func placeholder(_ publisher: Publisher<String>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.placeholder = text
        }
        return self
    }
    func attributedPlaceholder(_ attributedPlaceholder: NSAttributedString?) -> Self {
        self.attributedPlaceholder = attributedPlaceholder
        return self
    }
    func attributedPlaceholder(_ publisher: Publisher<NSAttributedString?>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.attributedPlaceholder = text
        }
        return self
    }
    func attributedPlaceholder(_ publisher: Publisher<NSAttributedString>) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.attributedPlaceholder = text
        }
        return self
    }
    func clearsOnBeginEditing(_ clearsOnBeginEditing: Bool) -> Self {
        self.clearsOnBeginEditing = clearsOnBeginEditing
        return self
    }
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    func minimumFontSize(_ minimumFontSize: CGFloat) -> Self {
        self.minimumFontSize = minimumFontSize
        return self
    }
    func delegate(_ delegate: UITextFieldDelegate?) -> Self {
        self.delegate = delegate
        return self
    }
    func background(_ background: UIImage?) -> Self {
        self.background = background
        return self
    }
    func disabledBackground(_ disabledBackground: UIImage?) -> Self {
        self.disabledBackground = disabledBackground
        return self
    }
    func allowsEditingTextAttributes(_ allowsEditingTextAttributes: Bool) -> Self {
        self.allowsEditingTextAttributes = allowsEditingTextAttributes
        return self
    }
    func typingAttributes(_ typingAttributes: [NSAttributedString.Key : Any]) -> Self {
        self.typingAttributes = typingAttributes
        return self
    }
    func clearButtonMode(_ clearButtonMode: TextField.ViewMode) -> Self {
        self.clearButtonMode = clearButtonMode
        return self
    }
    func leftView(_ leftView: UIView?) -> Self {
        self.leftView = leftView
        return self
    }
    func leftViewMode(_ leftViewMode: TextField.ViewMode) -> Self {
        self.leftViewMode = leftViewMode
        return self
    }
    func rightView(_ rightView: UIView?) -> Self {
        self.rightView = rightView
        return self
    }
    func rightViewMode(_ rightViewMode: TextField.ViewMode) -> Self {
        self.rightViewMode = rightViewMode
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
}

open class TextField: UITextField, StackUITextField {}
