//
//  VC12_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 30.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
var label : UILabel!
class VC12_1: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        label = ssLabel(text: "Просто текст с тенью", width: 90, height: 15, x: 50, y: 40)
        // Do any additional setup after loading the view.
        label.shadowColor = .lightGray
        label.shadowOffset = CGSize(width: 7, height: 5)
    }

 

}
