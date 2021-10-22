//
//  Button.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/11.
//

import UIKit

public protocol StackUIButton: UIButton, StackUIControl {
    func font(_ font: UIFont) -> Self
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self
    func reversesTitleShadowWhenHighlighted(_ reversesTitleShadowWhenHighlighted: Bool) -> Self
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted: Bool) -> Self
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled: Bool) -> Self
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted: Bool) -> Self
    func tintColor(_ tintColor: UIColor!) -> Self
    @available(iOS 14.0, *)
    func role(_ role: UIButton.Role) -> Self
    @available(iOS 13.4, *)
    func isPointerInteractionEnabled(_ isPointerInteractionEnabled: Bool) -> Self
    func title(_ title: String?, for state: UIControl.State) -> Self
    func title(_ publisher: Publisher<String?>, for state: UIControl.State) -> Self
    func title(_ publisher: Publisher<String>, for state: UIControl.State) -> Self
    func titleColor(_ color: UIColor?, for state: UIControl.State) -> Self
    func titleShadowColor(_ color: UIColor?, for state: UIControl.State) -> Self
    func image(_ image: UIImage?, for state: UIControl.State) -> Self
    func image(_ publisher: Publisher<UIImage?>, for state: UIControl.State) -> Self
    func image(_ publisher: Publisher<UIImage>, for state: UIControl.State) -> Self
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self
    func backgroundImage(_ publisher: Publisher<UIImage?>, for state: UIControl.State) -> Self
    func backgroundImage(_ publisher: Publisher<UIImage>, for state: UIControl.State) -> Self
    @available(iOS 13.0, *)
    func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State) -> Self
    func attributedTitle(_ title: NSAttributedString?, for state: UIControl.State) -> Self
    @available(iOS 13.4, *)
    func pointerStyleProvider(_ pointerStyleProvider: UIButton.PointerStyleProvider?) -> Self
}

public extension StackUIButton {
    func font(_ font: UIFont) -> Self {
        self.titleLabel?.font = font
        return self
    }
    func contentEdgeInsets(_ contentEdgeInsets: UIEdgeInsets) -> Self {
        self.contentEdgeInsets = contentEdgeInsets
        return self
    }
    func titleEdgeInsets(_ titleEdgeInsets: UIEdgeInsets) -> Self {
        self.titleEdgeInsets = titleEdgeInsets
        return self
    }
    func reversesTitleShadowWhenHighlighted(_ reversesTitleShadowWhenHighlighted: Bool) -> Self {
        self.reversesTitleShadowWhenHighlighted = reversesTitleShadowWhenHighlighted
        return self
    }
    func imageEdgeInsets(_ imageEdgeInsets: UIEdgeInsets) -> Self {
        self.imageEdgeInsets = imageEdgeInsets
        return self
    }
    func adjustsImageWhenHighlighted(_ adjustsImageWhenHighlighted: Bool) -> Self {
        self.adjustsImageWhenHighlighted = adjustsImageWhenHighlighted
        return self
    }
    func adjustsImageWhenDisabled(_ adjustsImageWhenDisabled: Bool) -> Self {
        self.adjustsImageWhenDisabled = adjustsImageWhenDisabled
        return self
    }
    func showsTouchWhenHighlighted(_ showsTouchWhenHighlighted: Bool) -> Self {
        self.showsTouchWhenHighlighted = showsTouchWhenHighlighted
        return self
    }
    func tintColor(_ tintColor: UIColor!) -> Self {
        self.tintColor = tintColor
        return self
    }
    @available(iOS 14.0, *)
    func role(_ role: UIButton.Role) -> Self {
        self.role = role
        return self
    }
    @available(iOS 13.4, *)
    func isPointerInteractionEnabled(_ isPointerInteractionEnabled: Bool) -> Self {
        self.isPointerInteractionEnabled = isPointerInteractionEnabled
        return self
    }
    func title(_ title: String?, for state: UIControl.State) -> Self {
        self.setTitle(title, for: state)
        return self
    }
    func title(_ publisher: Publisher<String?>, for state: UIControl.State) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.setTitle(text, for: state)
        }
        return self
    }
    func title(_ publisher: Publisher<String>, for state: UIControl.State) -> Self {
        publisher.addSubscriber {[weak self] text in
            self?.setTitle(text, for: state)
        }
        return self
    }
    func titleColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        self.setTitleColor(color, for: state)
        return self
    }
    func titleShadowColor(_ color: UIColor?, for state: UIControl.State) -> Self {
        self.setTitleShadowColor(color, for: state)
        return self
    }
    func image(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setImage(image, for: state)
        return self
    }
    func image(_ publisher: Publisher<UIImage?>, for state: UIControl.State) -> Self {
        publisher.addSubscriber {[weak self] image in
            self?.setImage(image, for: state)
        }
        return self
    }
    func image(_ publisher: Publisher<UIImage>, for state: UIControl.State) -> Self {
        publisher.addSubscriber {[weak self] image in
            self?.setImage(image, for: state)
        }
        return self
    }
    func backgroundImage(_ image: UIImage?, for state: UIControl.State) -> Self {
        self.setBackgroundImage(image, for: state)
        return self
    }
    func backgroundImage(_ publisher: Publisher<UIImage?>, for state: UIControl.State) -> Self {
        publisher.addSubscriber {[weak self] image in
            self?.setBackgroundImage(image, for: state)
        }
        return self
    }
    func backgroundImage(_ publisher: Publisher<UIImage>, for state: UIControl.State) -> Self {
        publisher.addSubscriber {[weak self] image in
            self?.setBackgroundImage(image, for: state)
        }
        return self
    }
    @available(iOS 13.0, *)
    func preferredSymbolConfiguration(_ configuration: UIImage.SymbolConfiguration?, forImageIn state: UIControl.State) -> Self {
        self.setPreferredSymbolConfiguration(configuration, forImageIn: state)
        return self
    }
    func attributedTitle(_ title: NSAttributedString?, for state: UIControl.State) -> Self {
        self.setAttributedTitle(title, for: state)
        return self
    }
    @available(iOS 13.4, *)
    func pointerStyleProvider(_ pointerStyleProvider: UIButton.PointerStyleProvider?) -> Self {
        self.pointerStyleProvider = pointerStyleProvider
        return self
    }
}

open class Button: UIButton, StackUIButton {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
