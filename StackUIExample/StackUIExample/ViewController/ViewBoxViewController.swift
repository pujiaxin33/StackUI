//
//  ViewBoxViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/11/24.
//

import UIKit
import StackUI

class ViewBoxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "ViewBox"
        //有时候嵌套的控件需要额外的间距，这个时候可以把该控件放入ViewBox，然后设置paddings设置内边距，就可以间接实现控件上下左右边距的设置。
        let stack = HStack(alignment: .center, spacing: 5) {
            ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
            VStack {
                Label("昵称").font(.systemFont(ofSize: 18, weight: .medium))
                ViewBox(paddings: .init(top: 10, left: 20, bottom: 10, right: 20)) {
                    Label("爱好：写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；写代码；").font(.systemFont(ofSize: 15)).numberOfLines(0)
                }.backgroundColor(.lightGray)
                Label().text("这是用户描述。这是用户描述。这是用户描述。这是用户描述。这是用户描述。这是用户描述。这是用户描述。这是用户描述。这是用户描述。这是用户描述。").apply { label in
                    //如果有链式语法没有定义的属性，可以在apply闭包里面统一配置，也可以提交Issue进行支持。
                    label.font = UIFont.systemFont(ofSize: 12)
                    label.textColor = .gray
                    label.numberOfLines = 0
                }
            }
        }
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    

}
