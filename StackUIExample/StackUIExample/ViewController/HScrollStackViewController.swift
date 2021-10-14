//
//  ViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import StackUI

class HScrollStackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "HScrollStack"
        
        var users = [UserModel]()
        for index in 0...25 {
            let model = UserModel(avatar: "avatar", name: "用户\(index)", desc: "用户描述\(index)")
            users.append(model)
        }
        
        let stack = HScrollStack() {
            ForEach(users) { (model) in
                HStack(alignment: .center, spacing: 5) {
                    Spacer(spacing: 12)
                    ImageView().image(UIImage(named: model.avatar)).size(width: 80, height: 80)
                    VStack {
                        Label(model.name).font(.systemFont(ofSize: 18, weight: .medium))
                        Label().text(model.desc).font(.systemFont(ofSize: 12)).textColor(.gray)
                    }
                    Divider()
                }.size(width: 300)
            }
        }
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}
