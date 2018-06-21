//
//  MyVCClass.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 22.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class MyVC: UIViewController, UITextFieldDelegate {
    //reusable mainView
    var currentMainView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        currentMainView = view


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func ssLabel(text: String, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat,  backgroundColor: UIColor = .yellow, textColor: UIColor = .black ) -> UILabel{
        currentLabel = UILabel()
        currentLabel.backgroundColor = backgroundColor
        currentLabel.text = text
        currentLabel.textAlignment = .center
        currentLabel.font = UIFont.systemFont(ofSize: 26)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.contentScaleFactor = 0.5
        currentLabel.bounds = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentLabel.center = CGPoint(x: w * x / 100, y: h * y / 100)
        currentLabel.textColor = textColor
        currentMainView.addSubview(currentLabel)
        return currentLabel
    }
    func ssTextField(placeholder: String, y: CGFloat, x : CGFloat = 50, width: CGFloat = 90, height: CGFloat = 8, bacgroundColor : UIColor = .orange ) -> UITextField{
        
        currentTextField = UITextField()
        currentTextField.backgroundColor = bacgroundColor
        currentTextField.placeholder = placeholder
        currentTextField.textAlignment = .center
        currentTextField.font = UIFont.systemFont(ofSize: 26)
        currentTextField.adjustsFontSizeToFitWidth = true
        currentTextField.contentScaleFactor = 0.5
        
        currentTextField.bounds = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentTextField.center = CGPoint(x: w * x / 100, y: h * y / 100)
        
        currentTextField.textColor = .darkGray
        currentTextField.delegate = self
        currentMainView.addSubview(currentTextField)
        return currentTextField
    }
    
    func ssTextView(text: String, y: CGFloat, x : CGFloat = 50, width: CGFloat = 95, height: CGFloat, backgroundColor : UIColor = .lightGray, textColor : UIColor = .black ) -> UITextView{
        
        currentTextView = UITextView()
        currentTextView.backgroundColor = backgroundColor
        currentTextView.text = text
        currentTextView.textAlignment = .center
        currentTextView.font = UIFont.systemFont(ofSize: 26)

        currentTextView.contentScaleFactor = 0.5
        
        currentTextView.bounds = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentTextView.center = CGPoint(x: w * x / 100, y: h * y / 100)
        
        currentTextView.textColor = textColor

        currentMainView.addSubview(currentTextView)
        return currentTextView
    }
    
    func ssImageView(image: String, y: CGFloat, x : CGFloat = 50, width: CGFloat, height: CGFloat, tag : Int = 0) -> UIImageView{
        
        currentImageView = UIImageView()
        
        let image = UIImage(named: image)
        currentImageView.image = image
        currentImageView.bounds = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentImageView.center = CGPoint(x: w * x / 100, y: h * y / 100)
        currentImageView.contentMode = .scaleAspectFit
        currentImageView.tag = tag
        currentMainView.addSubview(currentImageView)
        return currentImageView
    }
    
    func ssImageViewWithRecognizer(image: String, y: CGFloat, x : CGFloat = 50, width: CGFloat, height: CGFloat, tapGestureRecognizer: UITapGestureRecognizer?, tag : Int = 0) -> UIImageView{
        
        currentImageView = UIImageView()
        
        let image = UIImage(named: image)
        currentImageView.image = image
        currentImageView.bounds = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentImageView.center = CGPoint(x: w * x / 100, y: h * y / 100)
        currentImageView.contentMode = .scaleAspectFit
        currentImageView.tag = tag
        if let x = tapGestureRecognizer{
            currentImageView.addGestureRecognizer(x)
        }
        currentMainView.addSubview(currentImageView)
        return currentImageView
    }
    
    
    func ssButton(title: String, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat, fun: String = "", backgroundColor: UIColor = .orange, titleColor: UIColor = .black ) -> UIButton{
        
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentButton.center = CGPoint(x: w * x / 100, y: h * y / 100)
        currentButton.setTitle(title, for: .normal)
        currentButton.backgroundColor = backgroundColor
        currentButton.setTitleColor(titleColor, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(ffButton(sender:)), for: UIControlEvents.touchUpInside)
        currentMainView.addSubview(currentButton)
        return currentButton
    }
    @objc func ffButton(sender: UIButton) -> Void {
        
print("here just do nothing")
        
    }
    
    func goToVC(VC: UIViewController){
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = VC
        window.makeKeyAndVisible()
    }
    
    
    func ssSlider(width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) -> UISlider{
        currentSlider = UISlider()
        currentSlider.frame = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentSlider.center = CGPoint(x: w * x / 100, y: h * y / 100)
        currentSlider.minimumValue = 0.0
        currentSlider.maximumValue = 1.0
        currentSlider.addTarget(self, action: #selector(ffSlider(sender:)), for: .valueChanged)
 
        currentMainView.addSubview(currentSlider)
        return currentSlider
        
    }
    @objc func ffSlider(sender: UISlider){
       print(sender.value)

        
    }
 
 
    func ssSegmentedControl(items: [String], width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) -> UISegmentedControl{
        currentSegmentedControl = UISegmentedControl()


        currentSegmentedControl = UISegmentedControl(items: items)
        currentSegmentedControl.addTarget(self, action: #selector(ffSegmentedControl(sender:)), for: .valueChanged)
        
        currentMainView.addSubview(currentSegmentedControl)
        
        //если границы вызвать до view.addSubview(currentSegmentedControl), то не работает

        currentSegmentedControl.frame = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentSegmentedControl.center = CGPoint(x: w * x / 100, y: h * y / 100)
        
        return currentSegmentedControl
    }
    @objc func ffSegmentedControl(sender: UISegmentedControl){

    }
    
    func ssSwitch(x: CGFloat, y: CGFloat, tag: Int = 0) -> UISwitch{
        currentSwitch = UISwitch()
        currentSwitch.addTarget(self, action: #selector(ffChangeSwitchValue(paramTarget:)), for: .valueChanged)
//        currentSwitch.frame = CGRect(x: view.bounds.width * 0.8, y: view.bounds.height * 0.2, width: 0, height: 0)
        currentSwitch.center = CGPoint(x: w * x / 100, y: h * y / 100)
        currentSwitch.tag = tag

        currentMainView.addSubview(currentSwitch)
        return currentSwitch
    }
    @objc func ffChangeSwitchValue(paramTarget:UISwitch){
        if paramTarget.isOn{
            print("On")
        }
        else{
            print("Off")
        }
    }

    
    
    
    func ssPickerView(width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat) -> UIPickerView{
        currentPickerView = UIPickerView()

        currentPickerView.dataSource = self
        currentPickerView.delegate = self
        currentPickerView.bounds = CGRect(x: 0, y: 0, width: w * width / 100, height: h * height / 100)
        currentPickerView.center = CGPoint(x: w * x / 100, y: h * y / 100)
        currentMainView.addSubview(currentPickerView)
        
        return currentPickerView
     
    }
    
    func ssScrolView(height: CGFloat = 200, x: CGFloat = 50){
        currentScrollView = UIScrollView(frame: view.bounds)
       print("🅰️")
        print(view.bounds)
        currentScrollView.contentSize = CGSize(width: w, height: h * 3)
 //      currentScrollView.bounds = CGRect(x: 0, y: 0, width: w, height: h * 2)
//        currentScrollView.center = CGPoint(x: w * x / 100, y: h * height / 200)
        currentMainView.addSubview(currentScrollView)
        //change main View
//        currentScrollView.scrollRectToVisible(CGRect(x: w50, y: h40, width: w, height: h), animated: true)
       currentMainView = currentScrollView
     
        
    }
    
    func addNotificationForMoovingTEXTFIELDWithKeybard(height: CGFloat){
        
  
            
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (nc) in
               //это двигает фрейм, а нам бы проскролить
                // self.currentMainView.frame.origin.y = h40 - height
                if canUseNotification{
                currentScrollView.scrollRectToVisible(CGRect(x: w50, y: height - h30, width: w, height: h), animated: true)
                }
            }
            NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (nc) in
           //     self.currentMainView.frame.origin.y = 0.0
                currentScrollView.scrollRectToVisible(CGRect(x: w50, y: 0.0, width: w, height: h), animated: true)
            }
    
        
    }
    

}

extension MyVC: /*UIViewController этот мы используем в других контроллерах*/ UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
}
extension MyVC: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        return result
    }
    
}
