//
//  ZStackViewController.swift
//  StackUIExample
//
//  Created by Jiaxin Pu on 2023/9/24.
//

import UIKit
import StackUI

class ZStackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "ZStack"

        let alignments = ZStack.Alignment.allCases
        
        VScrollStack(spacing: 10) {
            for alignment in alignments {
                ZStack(alignment: alignment) {
                    View().backgroundColor(.lightGray).size(width:50, height: 50)
                    View().backgroundColor(.black).size(width:25, height: 25)
                    Label().text("\(alignment)").textColor(.brown)//.offset(x: 10, y: 10)
                }
                .size(height: 100)
                .borderColor(.cyan)
                .borderWidth(1)
            }
        }
        .embed(in: view)
    }
    

}
