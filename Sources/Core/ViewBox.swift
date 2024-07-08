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

        viewBuilder()
            .embed(in: self, paddings: paddings)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
