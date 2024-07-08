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

        HScrollStack {
            for model in users {
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
        .size(height: 100)
        .embedToTop(in: view, paddings: .init(top: 100))
    }

}
