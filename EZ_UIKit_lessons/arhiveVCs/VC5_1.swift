//
//  VC5_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC5_1: UIViewController {
    let picker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        picker.center = view.center
        
        //Подписаться
        picker.dataSource = self
        picker.delegate = self
        
        self.view.addSubview(picker)
        
        
    }
    
    
    
}
extension VC5_1: /*UIViewController этот мы используем в других контроллерах*/ UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
}
extension VC5_1: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        return result
    }
    
}

