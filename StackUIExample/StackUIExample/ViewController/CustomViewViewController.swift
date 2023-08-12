//
//  CustomViewViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/18.
//

import UIKit
import StackUI

class CustomViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "CustomView"
        
        HStack(distribution: .equalCentering, alignment: .center) {
            HStack(alignment: .center, spacing: 5) {
                CustomView().customColor(.lightGray).size(width: 40, height: 40)
                CustomViewFromProtocol().customColor(.gray).size(width: 40, height: 40)
                VStack {
                    CustomLabel("用户昵称").customColor(.red).font(.systemFont(ofSize: 18, weight: .medium))
                    CustomLabelFromProtocol().text("用户很懒，什么都没有留下来！").font(.systemFont(ofSize: 12)).textColor(.gray)
                }
            }
            ImageView().image(UIImage(named: "arrow_right"))
        }
        .embedToTop(in: view, paddings: .horizontal(12))
    }


}
