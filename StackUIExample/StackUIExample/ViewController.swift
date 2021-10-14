//
//  ViewController.swift
//  StackUIExample
//
//  Created by tony on 2021/10/14.
//

import UIKit
import StackUI


class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            let app = UINavigationBarAppearance.init()
            app.backgroundColor = .white
            app.titleTextAttributes = [.foregroundColor:UIColor.black]
            self.navigationController?.navigationBar.scrollEdgeAppearance = app
            self.navigationController?.navigationBar.standardAppearance = app
        } else {
            // Fallback on earlier versions
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SettingsCell")
        tableView.register(FoodCell.self, forCellReuseIdentifier: "FoodCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "ForEach"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "VScrollStack"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "HScrollStack"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "TextPublisher"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "TextDriver"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
            cell.addCallBack = {[weak self] in
                let alert = UIAlertController(title: "温馨提示", message: "已经加入购物车", preferredStyle: .alert)
                alert.addAction(.init(title: "好的", style: .default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = ForEachViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = VScrollStackViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = HScrollStackViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = TextPublisherViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = TextDriverViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

