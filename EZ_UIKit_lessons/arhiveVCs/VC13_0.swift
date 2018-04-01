//
//  VC13_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC13_0: MyVC {

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
        
 //       textField1.becomeFirstResponder()//  при появлении экрана сразу предложит начать заполнение текстфилда
        let _ = ssButton(title: "Go", width: 15, height: 10, x: 15, y: 90)
        let _ = ssButton(title: "Go2", width: 15, height: 10, x: 35, y: 90)

    }
    
    
    
    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "Go"{
        goToVC(VC: VC13_0_Second())
        }
        else{
         goToVC(VC: VC13_0_third())
        }
        
    }
    
    

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        print("textFieldShouldBeginEditing - можно ли редактировать true - можно, false - нельзя")
        if textField == textField2{
            return false
        }
        else{
           return true
        }

    }
    

    func textFieldDidBeginEditing(_ textField: UITextField){
     print("textFieldDidBeginEditing == внимание, началось редактирование")
        
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
     print("textFieldShouldEndEditing == внимание, заканчивается редактирование")
        return true
    }
    

//      func textFieldDidEndEditing(_ textField: UITextField){
//     print("textFieldDidEndEditing == ‼️ внимание, закончилось редактирование")
//    }
    

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason){
    print("textFieldDidEndEditing == ‼️ внимание, закончилось редактирование")
    }
    
    

      func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
         print("textFieldDidEndEditing == вы ввели \(string)")
        return true
    }
    

    func textFieldShouldClear(_ textField: UITextField) -> Bool{
    print("textFieldShouldClear == ты что-то удалил")
     return true
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
