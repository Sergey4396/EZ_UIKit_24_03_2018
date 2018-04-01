//
//  VC13_0_Second.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC13_0_Second: MyVC {

    var textField1 : UITextField!
    var textField2 : UITextField!
    var textField3 : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        textField1 = ssTextField(placeholder: "первый тексФилд", y: 20)
        textField2 = ssTextField(placeholder: "второй тексФилд", y: 35)
        textField3 = ssTextField(placeholder: "третий тексФилд", y: 50)
        
        textField1.borderStyle = UITextBorderStyle.roundedRect
        textField1.contentVerticalAlignment = UIControlContentVerticalAlignment.bottom
        textField1.textAlignment = .left
        
        NotificationCenter.default.addObserver(self, selector: #selector(textFielTextDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        
    }

    @objc func textFielTextDidChange(ncParam: NSNotification){
        print("textFielTextDidChange = \(ncParam)")
    }

}
