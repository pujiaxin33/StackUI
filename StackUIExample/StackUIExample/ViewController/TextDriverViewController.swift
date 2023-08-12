//
//  TextDriverViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import RxSwift
import RxCocoa
import StackUI
import StackUIWithRxSwift

class TextDriverViewController: UIViewController {
    var nickName = PublishSubject<String?>()
    var desc = PublishSubject<String?>()
    
    deinit {
        print("TextDriverViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        edgesForExtendedLayout = .init(rawValue: 0)
        title = "TextDriver"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "更新", style: .plain, target: self, action: #selector(didNaviRightItemClicked))

        HStack(distribution: .equalCentering, alignment: .center) {
            HStack(alignment: .center, spacing: 5) {
                ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
                VStack {
                    Label(nickName.asDriver(onErrorJustReturn: nil)).font(.systemFont(ofSize: 18, weight: .medium))
                    Label().text(desc.asDriver(onErrorJustReturn: nil)).font(.systemFont(ofSize: 12)).textColor(.gray)
                }
            }
            ImageView().image(UIImage(named: "arrow_right"))
        }
        .embedToTop(in: view, paddings: .horizontal(12))

        nickName.onNext("用户昵称")
        desc.onNext("用户很懒，什么都没有留下来！")
    }
    
    @objc func didNaviRightItemClicked() {
        nickName.onNext("周杰伦")
        desc.onNext("哎哟，不错哟❤️")
    }
}

