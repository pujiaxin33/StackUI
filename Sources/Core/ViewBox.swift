//
//  ViewBox.swift
//  StackUI
//
//  Created by tony on 2021/11/24.
//

import UIKit

open
class ViewBox: UIView, StackUIView {

    public init(paddings: UIEdgeInsets, viewBuilder: () -> UIView) {
        super.init(frame: .zero)
        
        let subview = viewBuilder()
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.topAnchor.constraint(equalTo: self.topAnchor, constant: paddings.top).isActive = true
        subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -paddings.bottom).isActive = true
        subview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: paddings.left).isActive = true
        subview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -paddings.right).isActive = true
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
