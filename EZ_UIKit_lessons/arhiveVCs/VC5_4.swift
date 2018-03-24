//
//  VC5_4.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
var isYearBissextile = false
class VC5_4: UIViewController {
    
    let picker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        picker.center = view.center
        
        picker.datePickerMode = .date
        
        view.addSubview(picker)
        picker.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker){
        
        if paramDatePicker.isEqual(self.picker){
            print("dateChange : = ", paramDatePicker.date)
            let date = paramDatePicker.date
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy"
            let stringDate = dateFormater.string(from: date)
            print("выбранный год - \(stringDate)")
            
            let intYear = Int(stringDate)
            if intYear! % 4 == 0{
                isYearBissextile = true
            }
            else{
                isYearBissextile = false
            }
            
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = VC5_4_SecondView()
            window?.makeKeyAndVisible()
            
        }
        
        
    }
    
}

