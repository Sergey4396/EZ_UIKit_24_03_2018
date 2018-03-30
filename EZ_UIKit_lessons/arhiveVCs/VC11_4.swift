//
//  VC11_4.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 29.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC11_4: MyVC {

    var imageView : UIImageView!
    var imageView2 : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "AAAAAA!!!"
        view.backgroundColor = .orange
        
        imageView = ssImageView(image: "fry", y: 50, width: 100, height: w100)
        imageView.loadGif(name: "you can")
        perform(#selector(showFry), with: nil, afterDelay: 5.0)
//        var tabBarItem = UITabBarItem()
//        let visaImg = UIImage(named: "social-045_visa")
//        tabBarItem = UITabBarItem(title: "reddit", image: visaImg, tag: 1)//(tabBarSystemItem: .featured, tag: 1)
//        self.tabBarItem = tabBarItem

        // Do any additional setup after loading the view.
    }

    @objc func showFry(){
        
   imageView.loadGif(name: "mad fry")//.image = #imageLiteral(resourceName: "Фрай")
    }

}
