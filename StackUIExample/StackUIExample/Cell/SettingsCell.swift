//
//  SettingsCell.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import StackUI

class SettingsCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let stack = HStack(distribution: .equalCentering, alignment: .center) {
            HStack(alignment: .center, spacing: 5) {
                ImageView().image(UIImage(named: "avatar")).size(width: 40, height: 40)
                VStack {
                    Label("用户昵称").font(.systemFont(ofSize: 18, weight: .medium))
                    Label().text("用户很懒，什么都没有留下来！").font(.systemFont(ofSize: 12)).textColor(.gray)
                }
            }
            ImageView().image(UIImage(named: "arrow_right"))
        }
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
