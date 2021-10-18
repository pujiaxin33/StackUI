//
//  IfViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/18.
//

import UIKit
import StackUI

class IfViewController: UIViewController {
    var isShowInfo = false
    var stack: HStack?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "If Statements"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "更新", style: .plain, target: self, action: #selector(didNaviRightItemClicked))
        
        refreshStack()
    }
    
    func refreshStack() {
        if stack != nil {
            stack?.removeFromSuperview()
            stack = nil
        }
        stack = HStack(distribution: .equalCentering, alignment: .center) {
            HStack(alignment: .center, spacing: 5) {
                ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
                if self.isShowInfo == true {
                    VStack {
                        Label("用户昵称").font(.systemFont(ofSize: 18, weight: .medium))
                        Label().text("用户很懒，什么都没有留下来！").font(.systemFont(ofSize: 12)).textColor(.gray)
                    }
                }else {
                    Label("没有信息")
                }
            }
            ImageView().image(UIImage(named: "arrow_right"))
        }
        view.addSubview(stack!)
        stack?.translatesAutoresizingMaskIntoConstraints = false
        stack?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        stack?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        stack?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
    }

    @objc func didNaviRightItemClicked() {
        isShowInfo = true
        refreshStack()
    }
}
