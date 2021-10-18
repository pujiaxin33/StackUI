//
//  CustomLabel.swift
//  StackUIExample
//
//  Created by tony on 2021/10/18.
//

import UIKit
import StackUI

class CustomLabel: Label {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.textColor = customColor
        return self
    }
}

class CustomLabelFromProtocol: UILabel, StackUILabel {
    var customColor: UIColor = .black
    
    func customColor(_ customColor: UIColor) -> Self {
        self.customColor = customColor
        self.textColor = customColor
        return self
    }
}
