//
//  CustomView.swift
//  StackUIExample
//
//  Created by tony on 2021/10/18.
//

import UIKit
import StackUI

class CustomView: View {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.backgroundColor = customColor
        return self
    }
}

class CustomViewFromProtocol: UIView, StackUIView {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.backgroundColor = customColor
        return self
    }
}
