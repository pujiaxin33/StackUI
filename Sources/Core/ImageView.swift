//
//  ImageView.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/12.
//

import UIKit

public protocol StackUIImageView: UIImageView, StackUIView {
    func image(_ image: UIImage?) -> Self
    func image(_ publisher: Publisher<UIImage?>) -> Self
    func image(_ publisher: Publisher<UIImage>) -> Self
    func highlightedImage(_ highlightedImage: UIImage?) -> Self
    @available(iOS 13.0, *)
    func preferredSymbolConfiguration(_ preferredSymbolConfiguration: UIImage.SymbolConfiguration?) -> Self
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self
    func isHighlighted(_ isHighlighted: Bool) -> Self
    func animationImages(_ animationImages: [UIImage]?) -> Self
    func highlightedAnimationImages(_ highlightedAnimationImages: [UIImage]?) -> Self
    func animationDuration(_ animationDuration: TimeInterval) -> Self
    func animationRepeatCount(_ animationRepeatCount: Int) -> Self
    func tintColor(_ tintColor: UIColor!) -> Self
}

public extension StackUIImageView {
    func image(_ image: UIImage?) -> Self {
        self.image = image
        return self
    }
    func image(_ publisher: Publisher<UIImage?>) -> Self {
        publisher.addSubscriber {[weak self] image in
            self?.image = image
        }
        return self
    }
    func image(_ publisher: Publisher<UIImage>) -> Self {
        publisher.addSubscriber {[weak self] image in
            self?.image = image
        }
        return self
    }
    func highlightedImage(_ highlightedImage: UIImage?) -> Self {
        self.highlightedImage = highlightedImage
        return self
    }
    @available(iOS 13.0, *)
    func preferredSymbolConfiguration(_ preferredSymbolConfiguration: UIImage.SymbolConfiguration?) -> Self {
        self.preferredSymbolConfiguration = preferredSymbolConfiguration
        return self
    }
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    func animationImages(_ animationImages: [UIImage]?) -> Self {
        self.animationImages = animationImages
        return self
    }
    func highlightedAnimationImages(_ highlightedAnimationImages: [UIImage]?) -> Self {
        self.highlightedAnimationImages = highlightedAnimationImages
        return self
    }
    func animationDuration(_ animationDuration: TimeInterval) -> Self {
        self.animationDuration = animationDuration
        return self
    }
    func animationRepeatCount(_ animationRepeatCount: Int) -> Self {
        self.animationRepeatCount = animationRepeatCount
        return self
    }
    func tintColor(_ tintColor: UIColor!) -> Self {
        self.tintColor = tintColor
        return self
    }
}

open class ImageView: UIImageView, StackUIImageView {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
