//
//  VC5_1_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC5_1_2: UIViewController {
    let picker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        picker.center = view.center
        
        //        picker.datePickerMode = .date
        picker.datePickerMode = .countDownTimer
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        let todayDate = Date()
        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        let twoYearFromDate = todayDate.addingTimeInterval(2 * oneYearTime)
        
        picker.minimumDate = oneYearFromToday
        picker.maximumDate = twoYearFromDate
        
        picker.countDownDuration = 2 * 60
        
        view.addSubview(picker)
        picker.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker){
        if paramDatePicker.isEqual(self.picker){
            print("dateChange : = ", paramDatePicker.date)
        }
    }
    
}

