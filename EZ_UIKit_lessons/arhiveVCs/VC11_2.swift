//
//  VC11_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 28.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC11_2: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
 //       title = "Second VC"
   navigationItem.title = "Second"
        view.backgroundColor = .green
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        self.tabBarItem = tabBarItem
        
    }



}
