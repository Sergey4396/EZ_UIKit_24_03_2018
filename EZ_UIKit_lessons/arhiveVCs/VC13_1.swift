//
//  VC13_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC13_1: MyVC {
    var textField1 : UITextField!
        var textField2 : UITextField!
        var textField3 : UITextField!
    var textField4 : UITextField!
    var textField5 : UITextField!
    var button : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ssScrolView()


        
        currentMainView.backgroundColor = .lightGray
        currentScrollView.isScrollEnabled = false
textField1 = ssTextField(placeholder: "первое поле", y: 10)
textField2 = ssTextField(placeholder: "второе поле", y: 25)
textField3 = ssTextField(placeholder: "третье поле", y: 40)
textField4 = ssTextField(placeholder: "4 поле", y: 55)
textField5 = ssTextField(placeholder: "5 поле", y: 70)
//let _ = ssTextField(placeholder: "6 поле", y: 95)
        button = ssButton(title: "next VC", width: 30, height: 10, x: 50, y: 90)
        view.addSubview(button)// основной вью у нас скролвью, но кнопку, чтоб зафиксировать прикручиваем непосредственно к вью.

    }
    

    override func ffButton(sender: UIButton) {
        goToVC(VC: VC13_2())
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        print("textFieldShouldBeginEditing - можно ли редактировать true - можно, false - нельзя")
        canUseNotification = false
        if textField.center.y > h40{
        canUseNotification = true
            addNotificationForMoovingTEXTFIELDWithKeybard(height: textField.center.y )
        }

            return true
      
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("textFieldShouldReturn == хотите убрать клавиатуру")
        if textField == textField1{

            textField2.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        if textField == textField2{

            textField3.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        if textField == textField3{

            textField4.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        if textField == textField4{

            textField5.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        else{
            textField.resignFirstResponder()// убирает клавиатуру, убирает внимание с текстфилда
            return true
        }
    }

}
