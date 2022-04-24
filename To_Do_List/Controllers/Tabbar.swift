//
//  Tabbar.swift
//  To_Do_List
//
//  Created by Macbook Air on 25/04/22.
//

import UIKit

class Tabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    func setupTabbar() {
        let vc = TasksVC.init(nibName: "TasksVC", bundle: nil)
        let item = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        vc.tabBarItem = item
        
        let vc1 = TasksVC.init(nibName: "TasksVC", bundle: nil)
        let item1 = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        vc1.tabBarItem = item1
        
        viewControllers = [vc,vc1]
    }
    
}
