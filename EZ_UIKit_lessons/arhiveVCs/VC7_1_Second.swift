//
//  VC7_1_Second.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 22.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC7_1_Second: MyVC {

    var r = CGFloat(1)
    var g = CGFloat(1)
    var b = CGFloat(1)
    var label : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label = ssLabel(text: "Just a stupid Label", width: 90, height: 15, x: 50, y: 15)
        let mySlider = ssSlider(width: 90, height: 10, x: 50, y: 30)
        let pickerView = ssPickerView(width: 50, height: 40, x: 50, y: 52)
        let segmContr = ssSegmentedControl(items: ["1","2","3","4","5","6","7","8","9","10",], width: 90, height: 10, x: 50, y: 80)
        for i in 0...9{
        segmContr.subviews[i].tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: CGFloat(0.1) * CGFloat(i + 1))
        let _ = ssButton(title: "Сменить Label", width: 40, height: 7, x: 25, y: 90)
        let _ = ssButton(title: "Сменить View", width: 40, height: 7, x: 75, y: 90)
        }
        
    mySlider.thumbTintColor = .red
    mySlider.tintColor = .red
    mySlider.minimumValue = 0.1
      pickerView.selectRow(500, inComponent: 0, animated: false)
        
    }

    override func ffSlider(sender: UISlider) {
      let sv = CGFloat(sender.value)
      sender.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: sv)
        b = sv
    }
    override func ffSegmentedControl(sender: UISegmentedControl) {
        r = CGFloat(0.1) * CGFloat(sender.selectedSegmentIndex + 1)
        
    }
    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "Сменить Label"{
         label.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        }
        if sender.titleLabel?.text == "Сменить View"{
            
            let alert = UIAlertController(title: "Может не надо?", message: "Не красиво же получится", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Кнопка то одна всё равно", style: UIAlertActionStyle.default, handler: {  (_) in
                
                self.view.backgroundColor = UIColor(red: self.r, green: self.g, blue: self.b, alpha: 1)
                print("\(self.r) \(self.g) \(self.b)")
                
            }))
            
            self.present(alert, animated: true, completion: nil)

        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: CGFloat(0.1) * CGFloat((row) % 10) + 0.1)
        return label
    }
    override func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1000
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        g = CGFloat(0.1) * CGFloat((row) % 10 + 1)
    }
 
    
}
