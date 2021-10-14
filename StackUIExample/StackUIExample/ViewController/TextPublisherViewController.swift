//
//  TextPublisherViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import StackUI

class TextPublisherViewController: UIViewController {
    @Live var nickName: String? = "用户昵称"
    @Live var desc: String? = "用户很懒，什么都没有留下来！"

    deinit {
        print("TextPublisherViewController deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "TextPublisher"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "更新", style: .plain, target: self, action: #selector(didNaviRightItemClicked))

        let stack = HStack(distribution: .equalCentering, alignment: .center) {
            HStack(alignment: .center, spacing: 5) {
                ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
                VStack {
                    Label($nickName).font(.systemFont(ofSize: 18, weight: .medium))
                    Label().text($desc).font(.systemFont(ofSize: 12)).textColor(.gray)
                }
            }
            ImageView().image(UIImage(named: "arrow_right"))
        }
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }
    
    @objc func didNaviRightItemClicked() {
        nickName = "周杰伦"
        desc = "哎哟，不错哟❤️"
    }

}
