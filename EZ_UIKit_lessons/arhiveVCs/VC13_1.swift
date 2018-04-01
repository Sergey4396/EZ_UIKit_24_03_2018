//
//  VC13_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC13_1: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
let _ = ssTextField(placeholder: "первое поле", y: 20)
        let _ = ssTextField(placeholder: "второе поле", y: 35)
        let _ = ssTextField(placeholder: "третье поле", y: 50)

        let _ = ssButton(title: "next VC", width: 30, height: 10, x: 50, y: 90)
        
    }
    

    override func ffButton(sender: UIButton) {
        goToVC(VC: VC13_2())
    }


}
