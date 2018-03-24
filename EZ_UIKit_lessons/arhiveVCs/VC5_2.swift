//
//  VC5_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit



class VC5_2: UIViewController {
    var hour:Int = 0
    var minutes:Int = 0
    var seconds:Int = 0
    let picker = UIDatePicker()
    var pickerN2 : UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        setLabel()
        picker.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.3 )
        
        picker.datePickerMode = .date
        
        
        //        var oneYearTime = TimeInterval()
        //        oneYearTime = 365 * 24 * 60 * 60
        //        let todayDate = Date()
        //        let oneYearFromToday = todayDate.addingTimeInterval(oneYearTime)
        //        let twoYearFromDate = todayDate.addingTimeInterval(2 * oneYearTime)
        //
        //        picker.minimumDate = oneYearFromToday
        //        picker.maximumDate = twoYearFromDate
        
        
        
        view.addSubview(picker)
        picker.addTarget(self, action: #selector(datePickerChange(paramDatePicker:)), for: .valueChanged)
        setSecondPickerView()
    }
    
    @objc func datePickerChange(paramDatePicker: UIDatePicker){
        if paramDatePicker.isEqual(self.picker){
            print("dateChange : = ", paramDatePicker.date)
            let date = paramDatePicker.date
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "dd.MM.yyyy"
            let stringDate = dateFormater.string(from: date)
            titleLabel.text = stringDate
        }
    }
    
    func setLabel() {
        currentLabel = UILabel()
        currentLabel.text = "Здесь будет дата"
        currentLabel.textAlignment = .center
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.05, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        titleLabel = currentLabel
        view.addSubview(titleLabel)
    }
    
    func setSecondPickerView(){
        
        pickerN2 = UIPickerView()
        pickerN2.center = CGPoint(x: view.bounds.width * 0.5, y: view.bounds.height * 0.7 )
        pickerN2.dataSource = self
        pickerN2.delegate = self
        //        pickerN2.addTarget(self, action: #selector(datePickerChange2(paramDatePicker:)), for: .valueChanged)
        view.addSubview(pickerN2)
    }
    @objc func datePickerChange2(paramPicker: UIPickerView){
        //        if paramDatePicker.isEqual(self.pickerN2){
        //            print("dateChange : = ", paramDatePicker.date)
        //            let date = paramDatePicker.date
        //            let dateFormater = DateFormatter()
        //            dateFormater.dateFormat = "dd.MM.yyyy"
        //            let stringDate = dateFormater.string(from: date)
        
        //            let alert = UIAlertController(title: "Выбранная дата", message: String(hour), preferredStyle: UIAlertControllerStyle.alert)
        let alert = UIAlertController(title: "часы:минуты:секунды", message: "\(hour): \(minutes): \(seconds)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Я это не выбирал", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        //        }
        
    }
    
    
}
//extension VC5_2: /*UIViewController этот мы используем в других контроллерах*/ UIPickerViewDataSource{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 3
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0{
//            return 3
//        }
//        return 10
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//    }
//
//}
//extension VC5_2: UIPickerViewDelegate{
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let result = "row = \(row)"
//        return result
//    }
//
//
//
//}


extension VC5_2:UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1,2:
            return 60
            
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) Hour"
        case 1:
            return "\(row) Minute"
        case 2:
            return "\(row) Second"
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minutes = row
        case 2:
            seconds = row
            datePickerChange2(paramPicker: pickerN2)
        default:
            break;
        }
    }
}


