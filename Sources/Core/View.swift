//
//  View.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/11.
//

import UIKit

public protocol StackUIView: StackUILayer {
    func size(width: CGFloat?, height: CGFloat?) -> Self
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self
    func tag(_ tag: Int) -> Self
    @available(iOS 14.0, *)
    func focusGroupIdentifier(_ focusGroupIdentifier: String?) -> Self
    @available(iOS 15.0, *)
    func focusGroupPriority(_ focusGroupPriority: UIFocusGroupPriority) -> Self
    @available(iOS 15.0, *)
    func focusEffect(_ focusEffect: UIFocusEffect?) -> Self
    func semanticContentAttribute(_ semanticContentAttribute: UISemanticContentAttribute) -> Self
    func transform(_ transform: CGAffineTransform) -> Self
    @available(iOS 13.0, *)
    func transform3D(_ transform3D: CATransform3D) -> Self
    func contentScaleFactor(_ contentScaleFactor: CGFloat) -> Self
    func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool) -> Self
    func isExclusiveTouch(_ isExclusiveTouch: Bool) -> Self
    func clipsToBounds(_ clipsToBounds: Bool) -> Self
    func backgroundColor(_ backgroundColor: UIColor?) -> Self
    func alpha(_ alpha: CGFloat) -> Self
    func isOpaque(_ isOpaque: Bool) -> Self
    func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool) -> Self
    func isHidden(_ isHidden: Bool) -> Self
    func contentMode(_ contentMode: UIView.ContentMode) -> Self
    func mask(_ mask: UIView?) -> Self
    func tintColor(_ tintColor: UIColor!) -> Self
    func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode) -> Self
    func restorationIdentifier(_ restorationIdentifier: String?) -> Self
    @available(iOS 13.0, *)
    func overrideUserInterfaceStyle(_ overrideUserInterfaceStyle: UIUserInterfaceStyle) -> Self
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self
    func offset(x: CGFloat, y: CGFloat) -> Self
}

extension UIView {
    private struct AssociatedKeys {
        static var StackUIPropertyOffset = "StackUIPropertyOffset"
    }
    
    var offset: CGPoint {
        set {
            withUnsafePointer(to: AssociatedKeys.StackUIPropertyOffset) {
                objc_setAssociatedObject(self, $0, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
        }
        get {
            withUnsafePointer(to: AssociatedKeys.StackUIPropertyOffset) {
                return objc_getAssociatedObject(self, $0) as? CGPoint ?? .zero
            }
        }
    }
}

public extension StackUIView {
    func offset(x: CGFloat = 0, y: CGFloat = 0) -> Self {
        self.offset = CGPoint(x: x, y: y)
        return self
    }
    func size(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        return self
    }
    func isUserInteractionEnabled(_ isUserInteractionEnabled: Bool) -> Self {
        self.isUserInteractionEnabled = isUserInteractionEnabled
        return self
    }
    func tag(_ tag: Int) -> Self {
        self.tag = tag
        return self
    }
    @available(iOS 14.0, *)
    func focusGroupIdentifier(_ focusGroupIdentifier: String?) -> Self {
        self.focusGroupIdentifier = focusGroupIdentifier
        return self
    }
    @available(iOS 15.0, *)
    func focusGroupPriority(_ focusGroupPriority: UIFocusGroupPriority) -> Self {
        self.focusGroupPriority = focusGroupPriority
        return self
    }
    @available(iOS 15.0, *)
    func focusEffect(_ focusEffect: UIFocusEffect?) -> Self {
        self.focusEffect = focusEffect
        return self
    }
    func semanticContentAttribute(_ semanticContentAttribute: UISemanticContentAttribute) -> Self {
        self.semanticContentAttribute = semanticContentAttribute
        return self
    }
    func transform(_ transform: CGAffineTransform) -> Self {
        self.transform = transform
        return self
    }
    @available(iOS 13.0, *)
    func transform3D(_ transform3D: CATransform3D) -> Self {
        self.transform3D = transform3D
        return self
    }
    func contentScaleFactor(_ contentScaleFactor: CGFloat) -> Self {
        self.contentScaleFactor = contentScaleFactor
        return self
    }
    func isMultipleTouchEnabled(_ isMultipleTouchEnabled: Bool) -> Self {
        self.isMultipleTouchEnabled = isMultipleTouchEnabled
        return self
    }
    func isExclusiveTouch(_ isExclusiveTouch: Bool) -> Self {
        self.isExclusiveTouch = isExclusiveTouch
        return self
    }
    func clipsToBounds(_ clipsToBounds: Bool) -> Self {
        self.clipsToBounds = clipsToBounds
        return self
    }
    func backgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    func alpha(_ alpha: CGFloat) -> Self {
        self.alpha = alpha
        return self
    }
    func isOpaque(_ isOpaque: Bool) -> Self {
        self.isOpaque = isOpaque
        return self
    }
    func clearsContextBeforeDrawing(_ clearsContextBeforeDrawing: Bool) -> Self {
        self.clearsContextBeforeDrawing = clearsContextBeforeDrawing
        return self
    }
    func isHidden(_ isHidden: Bool) -> Self {
        self.isHidden = isHidden
        return self
    }

    func isHidden(_ publisher: Publisher<Bool>) -> Self {
        publisher.addSubscriber {[weak self] isHidden in
            self?.isHidden = isHidden
        }
        return self
    }

    func contentMode(_ contentMode: UIView.ContentMode) -> Self {
        self.contentMode = contentMode
        return self
    }
    func mask(_ mask: UIView?) -> Self {
        self.mask = mask
        return self
    }
    func tintColor(_ tintColor: UIColor!) -> Self {
        self.tintColor = tintColor
        return self
    }
    func tintAdjustmentMode(_ tintAdjustmentMode: UIView.TintAdjustmentMode) -> Self {
        self.tintAdjustmentMode = tintAdjustmentMode
        return self
    }
    func restorationIdentifier(_ restorationIdentifier: String?) -> Self {
        self.restorationIdentifier = restorationIdentifier
        return self
    }
    @available(iOS 13.0, *)
    func overrideUserInterfaceStyle(_ overrideUserInterfaceStyle: UIUserInterfaceStyle) -> Self {
        self.overrideUserInterfaceStyle = overrideUserInterfaceStyle
        return self
    }
    func contentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentHuggingPriority(priority, for: axis)
        return self
    }
    func contentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) -> Self {
        self.setContentCompressionResistancePriority(priority, for: axis)
        return self
    }
}

open class View: UIView, StackUIView {
    public func apply(_ closure: (Self) -> ()) -> Self {
        closure(self)
        return self
    }
}
