//
//  UIEdgeInsets+Extension.swift
//  StackUI
//
//  Created by Seyed Samad Gholamzadeh on 8/9/23.
//

import UIKit

public extension UIEdgeInsets {

    init(
        top: CGFloat = 0,
        leading: CGFloat = 0,
        bottom: CGFloat = 0,
        trailing: CGFloat = 0
    ) {
        self.init(top: top, left: leading, bottom: bottom, right: trailing)
    }

    static func horizontal(_ padding: CGFloat) -> UIEdgeInsets {
        Self.init(leading: padding, trailing: padding)
    }

    static func vertical(_ padding: CGFloat) -> UIEdgeInsets {
        Self.init(top: padding, bottom: padding)
    }
}
