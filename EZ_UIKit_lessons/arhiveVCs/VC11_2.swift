//
//  VC11_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 28.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC11_2: MyVC {

    var imageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
 //       title = "Second VC"
   navigationItem.title = "Second"
        view.backgroundColor = .green
        
        var tabBarItem = UITabBarItem()
        tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        self.tabBarItem = tabBarItem
        
//        let gifToplay = UIImage.gif(name: "funny")
//        imageView.image = gifToplay
        imageView = UIImageView()
        imageView.loadGif(name: "homer")
        imageView.frame = CGRect(x: w50, y: h50, width: w80, height: w80)
        imageView.contentMode = .scaleAspectFit
        imageView.center = CGPoint(x: w50, y: h50)
        view.addSubview(imageView)
        

        
    }



}
