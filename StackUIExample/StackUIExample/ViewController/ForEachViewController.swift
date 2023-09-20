//
//  ForEachViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import StackUI

class ForEachViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "ForIn"

        var users = [UserModel]()
        for index in 0...5 {
            let model = UserModel(avatar: "avatar", name: "用户\(index)", desc: "用户描述\(index)")
            users.append(model)
        }

        VStack() {
            for model in users {
                VStack {
                    HStack(alignment: .center, spacing: 5) {
                        ImageView().image(UIImage(named: model.avatar)).size(width: 40, height: 40)
                        VStack {
                            Label(model.name).font(.systemFont(ofSize: 18, weight: .medium))
                            Label().text(model.desc).apply { label in
                                //如果有链式语法没有定义的属性，可以在apply闭包里面统一配置，也可以提交Issue进行支持。
                                label.font = UIFont.systemFont(ofSize: 12)
                                label.textColor = .gray
                            }
                        }
                    }
                    Divider()
                }.size(height: 80)
            }
        }
        .embedToTop(in: view, paddings: .horizontal(12))
    }

}
