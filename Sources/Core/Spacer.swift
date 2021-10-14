//
//  Spacer.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/13.
//

import UIKit

/// 你可以把Spacer理解为有固定宽度或高度的UIView，它会受到UIStackView的调整，所以，它的适用条件如下：
/// 1、HStack且宽度没有限制
/// 2、Vstack且高度没有限制
/// 否则Spacer被UIStackView调整
open class Spacer: UIView {
    public let spacing: CGFloat
    var axis: NSLayoutConstraint.Axis? {
        didSet {
            translatesAutoresizingMaskIntoConstraints = false
            switch axis {
            case .horizontal:
                widthAnchor.constraint(equalToConstant: spacing).isActive = true
            case .vertical:
                heightAnchor.constraint(equalToConstant: spacing).isActive = true
            default:
                break
            }
        }
    }
    public init(spacing: CGFloat = 5) {
        self.spacing = spacing
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
