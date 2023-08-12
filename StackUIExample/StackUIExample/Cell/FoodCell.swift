//
//  FoodCell.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import StackUI

class FoodCell: UITableViewCell {
    var addCallBack: (()->())?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        HStack(distribution: .fill, alignment: .top, spacing: 5) {
            ImageView().image(UIImage(named: "avatar")).size(width: 80, height: 80)
            VStack(spacing: 5) {
                Label("超值购！！！红烧狮子头（1个单点不送）美味好吃，吃了还想吃").font(.systemFont(ofSize: 18, weight: .medium)).numberOfLines(2)
                HStack(distribution: .fill, alignment: .center, spacing: 3) {
                    Label().text(" 1人份 ").font(.systemFont(ofSize: 9)).textColor(.black).backgroundColor(.lightGray).cornerRadius(2).textAlignment(.center).size(height: 13)
                    Label().text("好吃不上火🔥！好吃不上火🔥！好吃不上火🔥！好吃不上火🔥！好吃不上火🔥！好吃不上火🔥！").font(.systemFont(ofSize: 9)).textColor(.black).contentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
                }
                Label().text("月售 999 好评度 99%").font(.systemFont(ofSize: 8)).textColor(.lightGray)
                HStack(distribution: .equalCentering) {
                    HStack(alignment: .center, spacing: 5) {
                        Label().text(" 1折 ").font(.systemFont(ofSize: 8)).textColor(.red).cornerRadius(2).textAlignment(.center).borderWidth(1).borderColor(.red).size(height: 12)
                        Label().text(" 限1份 ").font(.systemFont(ofSize: 8)).textColor(.red).cornerRadius(2).textAlignment(.center).borderWidth(1).borderColor(.red).size(height: 12)
                    }
                    Spacer()
                }
                HStack(distribution: .equalCentering) {
                    HStack(alignment: .lastBaseline, spacing: 5) {
                        Label().text("￥9.9元").font(.systemFont(ofSize: 18)).textColor(.red)
                        Label().attributedText(NSAttributedString(string: "￥100", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue, .foregroundColor: UIColor.lightGray, .font: UIFont.systemFont(ofSize: 7)]))
                    }
                    Button(type: .system).title("加入购物车", for: .normal).target(self, action: #selector(addToShppingCar(_:)), for: .touchUpInside)
                }
            }
        }
        .embed(in: contentView, paddings: .init(top: 10, leading: 12, trailing: 12))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func addToShppingCar(_ btn: UIButton) {
        addCallBack?()
    }
}
