//
//  VC20_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 18.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC20_0: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = ssButton(title: "Go", width: 30, height: 10, x: 50, y: 50)

        let _ = ssButton(title: "Go2", width: 30, height: 10, x: 50, y: 75)
    }

    override func ffButton(sender: UIButton) {
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        if sender.titleLabel?.text == "Go"{
        window?.rootViewController = UINavigationController(rootViewController: MyPageViewController())
        }
            // for second button
        else{
        window?.rootViewController =  GreetingsPageVC()
            
        }
    }


}