//
//  VC8_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 24.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

var activityViewController: UIActivityViewController? = nil
class VC8_1: MyVC {

    var textField : UITextField!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image = UIImage(named: "fry")!
        textField = ssTextField(placeholder: "введите что-нибудь", y: 25)
        let _ = ssButton(title: "send activity", width: 40, height: 10, x: 50, y: 40)
        let _ = ssPickerView(width: 60, height: 30, x: 50, y: 60)
        let _ = ssButton(title: "send Foto", width: 40, height: 10, x: 50, y: 80, backgroundColor: .blue)
        
    }

    override func ffButton(sender: UIButton) {

        
        if sender.titleLabel?.text == "send activity"{
       activityViewController = UIActivityViewController(activityItems:  [textField.text ?? "nil"], applicationActivities: nil)
        }
        else{
        activityViewController = UIActivityViewController(activityItems:  [image], applicationActivities: nil)
        }
        present(activityViewController!, animated: true, completion: nil)
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2{
            activityViewController = UIActivityViewController(activityItems:  [image], applicationActivities: nil)
            present(activityViewController!, animated: true, completion: nil)
        }
    }
    
    override func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    override func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 2{
            return "делиться"
        }
        else {
            return "не делиться"
        }
    }
}
