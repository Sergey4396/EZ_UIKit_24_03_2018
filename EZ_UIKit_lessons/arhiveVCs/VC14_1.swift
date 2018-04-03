//
//  VC14_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 02.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC14_1: MyVC {

    var myTextView : UITextView!
    var myPyckerView : UIPickerView!
    var currentFont = "Hoefler Text"
    var currentFontSize : CGFloat = 26
    var currentColor : UIColor = .black
    let fontsArray = ["Hoefler Text", "Party LET","Zapfino","Futura"]
    var slider : UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text =
            """
   func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        currentLabel = UILabel()
        currentLabel.text = fontsArray[row]
        currentLabel.font = UIFont.init(name: fontsArray[row], size: 28)
        currentLabel.textAlignment = .center
        
        return currentLabel
    }
"""
        
        
        myTextView = ssTextView(text: text, y: 35, width: 100, height: 70)
        myTextView.contentInset = UIEdgeInsets(top: h5, left: w10 / 5, bottom: h5, right: w10 / 5)
        // Do any additional setup after loading the view.
        let _ = ssSwitch(x: 7, y: 97)
        let _ = ssButton(title: "Font", width: 10, height: 4, x: 20, y: 97)
        let _ = ssButton(title: "", width: 7, height: 4, x: 31, y: 97, backgroundColor: .red)
        let _ = ssButton(title: "", width: 7, height: 4, x: 41, y: 97, backgroundColor: .blue)
        let _ = ssButton(title: "", width: 7, height: 4, x: 51, y: 97, backgroundColor: .green)
        let _ = ssButton(title: "", width: 7, height: 4, x: 61, y: 97, backgroundColor: .gray)
        let _ = ssButton(title: "a", width: 7, height: 4, x: 71, y: 97)
        let _ = ssButton(title: "A", width: 7, height: 4, x: 81, y: 97)
        
        
        slider = ssSlider(width: 90, height: 5, x: 50, y: 92)
        slider.minimumValue = 12.0
        slider.maximumValue = 38.0
        
        
    }
    
    override func ffSlider(sender: UISlider) {
        let f = CGFloat(Int(sender.value))
        currentFontSize = f
        myTextView.font = UIFont.init(name: currentFont, size: currentFontSize)
    }
    
    override func ffChangeSwitchValue(paramTarget: UISwitch) {
        if paramTarget.isOn{
            print("On")
            myTextView.backgroundColor = .black
            myTextView.textColor = .lightGray
        }
        else{
            print("Off")
            myTextView.backgroundColor = .lightGray
            myTextView.textColor = .black
        }
    }

    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "Font"{
          myPyckerView = ssPickerView(width: 70, height: 50, x: 50, y: 50)
            myPyckerView.backgroundColor = .orange
        }
         if sender.backgroundColor == .red{
            myTextView.textColor = .red
        }
        if sender.backgroundColor == .blue{
            myTextView.textColor = .blue
        }
        if sender.backgroundColor == .green{
            myTextView.textColor = .green
        }
        if sender.backgroundColor == .gray{
            myTextView.textColor = .gray
        }
        
        if sender.titleLabel?.text == "a" || sender.titleLabel?.text == "A"{
         
            let alert = UIAlertController(title: "¯\\_(ツ)_/¯", message: "Вот понятия не имею как", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Не боись, сейчас объясню", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    override func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return fontsArray.count
    }
//    override func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return fontsArray[row]
//
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        currentLabel = UILabel()
        currentLabel.text = fontsArray[row]
        currentLabel.font = UIFont.init(name: fontsArray[row], size: 28)
        currentLabel.textAlignment = .center
        
        return currentLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myTextView.font = UIFont.init(name: fontsArray[row], size: currentFontSize)
        currentFont = fontsArray[row]
        pickerView.removeFromSuperview()
    }
    
}

