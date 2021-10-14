//
//  Divider.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

/// 你可以把Divider理解为有固定宽度或高度的UIView，它会受到UIStackView的调整，所以，它的适用条件如下：
/// 1、HStack且宽度没有限制
/// 2、Vstack且高度没有限制
/// 否则Divider被UIStackView调整
open class Divider: UIView, StackUIView {
    public let weight: CGFloat
    var axis: NSLayoutConstraint.Axis? {
        didSet {
            translatesAutoresizingMaskIntoConstraints = false
            switch axis {
            case .horizontal:
                widthAnchor.constraint(equalToConstant: weight).isActive = true
                heightAnchor.constraint(equalTo: superview!.heightAnchor).isActive = true
            case .vertical:
                widthAnchor.constraint(equalTo: superview!.widthAnchor).isActive = true
                heightAnchor.constraint(equalToConstant: weight).isActive = true
            default:
                break
            }
        }
    }
    public init(weight: CGFloat = 1.0/UIScreen.main.scale, color: UIColor = .lightGray) {
        self.weight = weight
        super.init(frame: .zero)
        backgroundColor = color
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
