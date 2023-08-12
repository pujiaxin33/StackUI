//
//  Label.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/11.
//

import UIKit

public protocol StackUILabel: UILabel, StackUIView {
    func text(_ text: String?) -> Self
    func text(_ publisher: Publisher<String?>) -> Self
    func text(_ publisher: Publisher<String>) -> Self
    func font(_ font: UIFont) -> Self
    func textColor(_ textColor: UIColor) -> Self
    func shadowColor(_ shadowColor: UIColor?) -> Self
    func shadowOffset(_ shadowOffset: CGSize) -> Self
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self
    func attributedText(_ attributedText: NSAttributedString?) -> Self
    func attributedText(_ publisher: Publisher<NSAttributedString?>) -> Self
    func attributedText(_ publisher: Publisher<NSAttributedString>) -> Self
    func highlightedTextColor(_ highlightedTextColor: UIColor) -> Self
    func isHighlighted(_ isHighlighted: Bool) -> Self
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self
    func isEnabled(_ isEnabled: Bool) -> Self
    func numberOfLines(_ numberOfLines: Int) -> Self
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self
    func baselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self
    func lineBreakStrategy(_ lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) -> Self
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self
}

public extension StackUILabel {
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
    func font(_ font: UIFont) -> Self {
        self.font = font
        return self
    }
    func textColor(_ textColor: UIColor) -> Self {
        self.textColor = textColor
        return self
    }
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        self.shadowColor = shadowColor
        return self
    }
    func shadowOffset(_ shadowOffset: CGSize) -> Self {
        self.shadowOffset = shadowOffset
        return self
    }
    func textAlignment(_ textAlignment: NSTextAlignment) -> Self {
        self.textAlignment = textAlignment
        return self
    }
    func lineBreakMode(_ lineBreakMode: NSLineBreakMode) -> Self {
        self.lineBreakMode = lineBreakMode
        return self
    }
    func attributedText(_ attributedText: NSAttributedString?) -> Self {
        self.attributedText = attributedText
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
    func highlightedTextColor(_ highlightedTextColor: UIColor) -> Self {
        self.highlightedTextColor = highlightedTextColor
        return self
    }
    func isHighlighted(_ isHighlighted: Bool) -> Self {
        self.isHighlighted = isHighlighted
        return self
    }
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    func isEnabled(_ isEnabled: Bool) -> Self {
        self.isEnabled = isEnabled
        return self
    }
    func numberOfLines(_ numberOfLines: Int) -> Self {
        self.numberOfLines = numberOfLines
        return self
    }
    func adjustsFontSizeToFitWidth(_ adjustsFontSizeToFitWidth: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        return self
    }
    func baselineAdjustment(_ baselineAdjustment: UIBaselineAdjustment) -> Self {
        self.baselineAdjustment = baselineAdjustment
        return self
    }
    func minimumScaleFactor(_ minimumScaleFactor: CGFloat) -> Self {
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
    func allowsDefaultTighteningForTruncation(_ allowsDefaultTighteningForTruncation: Bool) -> Self {
        self.allowsDefaultTighteningForTruncation = allowsDefaultTighteningForTruncation
        return self
    }
    func lineBreakStrategy(_ lineBreakStrategy: NSParagraphStyle.LineBreakStrategy) -> Self {
        if #available(iOS 14.0, *) {
            self.lineBreakStrategy = lineBreakStrategy
        }
        return self
    }
    func preferredMaxLayoutWidth(_ preferredMaxLayoutWidth: CGFloat) -> Self {
        self.preferredMaxLayoutWidth = preferredMaxLayoutWidth
        return self
    }
}

open class Label: UILabel, StackUILabel {
    public init() {
        super.init(frame: .zero)
    }
    
    public init(_ text: String?) {
        super.init(frame: .zero)
        self.text = text
    }
    
    public init(_ publisher: Publisher<String?>) {
        super.init(frame: .zero)
        publisher.addSubscriber {[weak self] text in
            self?.text = text
        }
    }
    
    public init(_ publisher: Publisher<String>) {
        super.init(frame: .zero)
        publisher.addSubscriber {[weak self] text in
            self?.text = text
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
