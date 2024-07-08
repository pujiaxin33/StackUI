//
//  VScrollStackViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import StackUI

class VScrollStackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "VScrollStack"
        
        var users = [UserModel]()
        for index in 0...25 {
            let model = UserModel(avatar: "avatar", name: "用户\(index)", desc: "用户描述\(index)")
            users.append(model)
        }
        
        VScrollStack {
            for model in users {
                VStack {
                    HStack(alignment: .center, spacing: 5) {
                        Spacer(spacing: 12)
                        ImageView().image(UIImage(named: model.avatar)).size(width: 40, height: 40)
                        VStack {
                            Label(model.name).font(.systemFont(ofSize: 18, weight: .medium))
                            Label().text(model.desc).font(.systemFont(ofSize: 12)).textColor(.gray)
                        }
                    }
                    Divider()
                }.size(height: 80)
            }
        }
        .embed(in: view)
    }


}
