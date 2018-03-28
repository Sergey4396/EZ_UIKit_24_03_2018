//
//  VC11_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 28.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC11_1: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "First VC"
        navigationItem.title = "First VC"
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem
        
        let _ = ssButton(title: "Go", width: 30, height: 10, x: 50, y: 50)
    }

    override func ffButton(sender: UIButton) {
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        let firstVC = VC11_1() можно и так но без навигэйшн контроллера
//        let secondVC = VC11_2()
        
        let firstVC = UINavigationController(rootViewController:VC11_1())
        let secondVC = UINavigationController(rootViewController:VC11_2())
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([firstVC, secondVC], animated: true)
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    


    }

    
}
