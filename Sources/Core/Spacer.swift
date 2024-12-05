//
//  Spacer.swift
//  StackUI
//
//  Created by jiaxin on 2021/9/13.
//

import UIKit

/// You can understand Spacer as a UIView with a fixed width or height, which will be adjusted by UIStackView. Therefore, its applicable conditions are as follows:
/// 1, HStack and there is no limit to the width
/// 2. Vstack and no height limit
/// Otherwise Spacer is adjusted by UIStackView
open class Spacer: View {
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
    
    public func apply(_ config: (Self)->() ) -> Self {
        config(self)
        return self
    }
}
