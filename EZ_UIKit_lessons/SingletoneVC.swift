//
//  SingletoneVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 18.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class SingletoneVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        let x = SafeSingletone.shared
        x.money += 100
        print("x.money")
        print(x.money)
        
        let y = SafeSingletone.shared
       print("y.money")
        print(y.money)

        // Do any additional setup after loading the view.
    }

   
}
class SafeSingletone{
    static let shared = SafeSingletone()
    var money = 0
    //написав слово private, мы запретили создавать новые экземпляры класса.
    private init() {}
}
