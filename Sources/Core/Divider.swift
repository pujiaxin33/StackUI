//
//  Divider.swift
//  StackUI
//
//  Created by jiaxin on 2021/10/14.
//

import UIKit

/// You can understand Divider as a UIView with a fixed width or height, which will be adjusted by UIStackView, so its applicable conditions are as follows:
/// 1, HStack and there is no limit to the width
/// 2. Vstack and no height limit
/// Otherwise Divider is adjusted by UIStackView
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
