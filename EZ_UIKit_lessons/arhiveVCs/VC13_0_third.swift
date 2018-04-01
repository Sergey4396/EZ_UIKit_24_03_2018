//
//  VC13_0_third.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC13_0_third: MyVC {

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
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y =  -h30
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0.0
        }
    }
    
    @objc func textFielTextDidChange(ncParam: NSNotification){
        print("textFielTextDidChange = \(ncParam)")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("textFieldShouldReturn == хотите убрать клавиатуру")
        if textField == textField1{
            //        textField1.resignFirstResponder()
            textField3.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        else{
            textField.resignFirstResponder()// убирает клавиатуру, убирает внимание с текстфилда
            return true
        }
    }
    
}
