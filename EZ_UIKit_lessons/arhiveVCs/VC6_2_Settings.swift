//
//  VC6_2_Settings.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 21.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//
//2 экран - настройки.
//
//1 label с надписью "Выбрать пол". Напротив него - picker. в пикере 3 варианта: М,Ж, unknown.
//2 textfiled - имя и ник.
//1 slider - нажимая на который, можно менять цвет экрана.
//1 кнопка "Сохранить".
//
import UIKit

class VC6_2_Settings: UIViewController, UITextFieldDelegate {
    var chancheLabel : UILabel!
    var genderArray = ["М","Ж","unnown"]
    var gender = "М"
    var slider : UISlider!
    var saveButton : UIButton!
    var colorValue : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        
        if !chekIfAnyEntityExist(){

            newEntity()
        }
        colorValue = CGFloat(getHue())
        let color = UIColor(hue: colorValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        self.view.backgroundColor = color
        
     chancheLabel = letItBeLabel(text: "Выбрать пол", width: w * 0.5, height: h * 0.1, x: w * 0.25, y: h * 0.3)
    let _ = willBePickerView(width: w * 0.4, height: h * 0.4, x: w * 0.75, y: h * 0.3)
    let _ = letItBeTextField(placeholder: "введите имя", y: h * 0.5)
    let _ = letItBeTextField(placeholder: "введите ник", y: h * 0.65)
    slider = willBeSlider(width: w90, height: h10, x: w50, y: h80)
        setSaveButton()
    }


    func letItBeLabel(text: String, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat,  backgroundColor: UIColor = .yellow, titleColor: UIColor = .black ) -> UILabel{
        currentLabel = UILabel()
        currentLabel.backgroundColor = .orange
        currentLabel.text = text
        currentLabel.textAlignment = .center
        currentLabel.font = UIFont.systemFont(ofSize: 26)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.contentScaleFactor = 0.5
        
        currentLabel.bounds = CGRect(x: 0, y: 0, width: width, height: height)
        currentLabel.center = CGPoint(x: x, y: y )
        
        currentLabel.textColor = .darkGray
        
        view.addSubview(currentLabel)
        return currentLabel
    }
    
    func willBePickerView(width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) -> UIPickerView{
        currentPickerView = UIPickerView()
        currentPickerView.bounds = CGRect(x: 0, y: 0, width: width, height: height)
        currentPickerView.center = CGPoint(x: x, y: y )
        currentPickerView.dataSource = self
        currentPickerView.delegate = self
        view.addSubview(currentPickerView)
        return currentPickerView
    }
    
    func letItBeTextField(placeholder: String, y: CGFloat ) -> UITextField{
        
        currentTextField = UITextField()
        currentTextField.backgroundColor = .orange
        currentTextField.placeholder = placeholder
        currentTextField.textAlignment = .center
        currentTextField.font = UIFont.systemFont(ofSize: 26)
        currentTextField.adjustsFontSizeToFitWidth = true
        currentTextField.contentScaleFactor = 0.5
        
        currentTextField.bounds = CGRect(x: 0, y: 0, width: view.bounds.width * 0.9, height: view.bounds.height * 0.08)
        currentTextField.center = CGPoint(x: view.bounds.width * 0.5, y: y )
        
        currentTextField.textColor = .darkGray
        currentTextField.delegate = self
        view.addSubview(currentTextField)
        return currentTextField
    }
 
    
    func willBeSlider(width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) -> UISlider{
        currentSlider = UISlider()
        currentSlider.frame = CGRect(x: 0, y: 0, width: width, height: height)
        currentSlider.center = CGPoint(x: x, y: y)
        currentSlider.minimumValue = 0.0
        currentSlider.maximumValue = 1.0
        currentSlider.addTarget(self, action: #selector(VC6_2_Settings.changeSliderValue(sender:)), for: .valueChanged)
        
        
        
        view.addSubview(currentSlider)
        return currentSlider
        
    }
    @objc func changeSliderValue(sender: UISlider){
        
        colorValue = CGFloat(sender.value)
        let color = UIColor(hue: colorValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        self.view.backgroundColor = color

    }
    func setSaveButton(){
        
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentButton.setTitle("Сохранить", for: .normal)
        currentButton.backgroundColor = .black
        currentButton.setTitleColor(UIColor.white, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC6_2_Settings.buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
        saveButton = currentButton
        view.addSubview(saveButton)
    }
    @objc func buttonPressed(sender: UIButton){
        let alert = UIAlertController(title: "Ow..", message: "А эти данные надо бы сохранить", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ок, сохраняйте", style: UIAlertActionStyle.default, handler: {  (_) in
            
            changeCurrentHue(hue: Float(self.colorValue))
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = VC6_2_Player()
            window.makeKeyAndVisible()
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

//-------------------🔴🔴🔴🔴🔴🔴🔴 end of class ⬇️ extensions----------------------------


extension VC6_2_Settings: /*UIViewController этот мы используем в других контроллерах*/ UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        gender = genderArray[row]

    }

    
}
extension VC6_2_Settings: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = genderArray[row]
        return result
    }
    
}

