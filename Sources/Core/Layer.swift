//
//  Layer.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

public protocol StackUILayer: UIView {
    func cornerRadius(_ cornerRadius: CGFloat) -> Self
    func masksToBounds(_ masksToBounds: Bool) -> Self
    @available(iOS 11.0, *)
    func maskedCorners(_ maskedCorners: CACornerMask) -> Self
    @available(iOS 13.0, *)
    func cornerCurve(_ cornerCurve: CALayerCornerCurve) -> Self
    func borderWidth(_ borderWidth: CGFloat) -> Self
    func borderColor(_ borderColor: UIColor?) -> Self
    func shadowColor(_ shadowColor: UIColor?) -> Self
    func shadowOpacity(_ shadowOpacity: Float) -> Self
    func shadowOffset(_ shadowOffset: CGSize) -> Self
    func shadowRadius(_ shadowRadius: CGFloat) -> Self
    func shadowPath(_ shadowPath: CGPath?) -> Self
}

public extension StackUILayer {
    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    func masksToBounds(_ masksToBounds: Bool) -> Self {
        self.layer.masksToBounds = masksToBounds
        return self
    }
    @available(iOS 11.0, *)
    func maskedCorners(_ maskedCorners: CACornerMask) -> Self {
        self.layer.maskedCorners = maskedCorners
        return self
    }
    @available(iOS 13.0, *)
    func cornerCurve(_ cornerCurve: CALayerCornerCurve) -> Self {
        self.layer.cornerCurve = cornerCurve
        return self
    }
    func borderWidth(_ borderWidth: CGFloat) -> Self {
        self.layer.borderWidth = borderWidth
        return self
    }
    func borderColor(_ borderColor: UIColor?) -> Self {
        self.layer.borderColor = borderColor?.cgColor
        return self
    }
    func shadowColor(_ shadowColor: UIColor?) -> Self {
        self.layer.shadowColor = shadowColor?.cgColor
        return self
    }
    func shadowOpacity(_ shadowOpacity: Float) -> Self {
        self.layer.shadowOpacity = shadowOpacity
        return self
    }
    func shadowOffset(_ shadowOffset: CGSize) -> Self {
        self.layer.shadowOffset = shadowOffset
        return self
    }
    func shadowRadius(_ shadowRadius: CGFloat) -> Self {
        self.layer.shadowRadius = shadowRadius
        return self
    }
    func shadowPath(_ shadowPath: CGPath?) -> Self {
        self.layer.shadowPath = shadowPath
        return self
    }
}
