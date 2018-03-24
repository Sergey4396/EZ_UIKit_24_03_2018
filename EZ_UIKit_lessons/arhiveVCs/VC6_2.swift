//
//  VC6_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 21.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//
//"Техническое задание.
//Приложение "Мой профиль".
//3 экрана.
//
//1 экран -логин. 
//2 textfield для ввода емейл и пароля.
//1 кнопка "Войти".
//

//3 экран - просто label с надписью "Игрок создан".
//
//Дополнительно:
//Добавьте какие-то свои фишки. Например: почитать в google как сохранять данные так, чтобы при следующем входе они опять отображались в профиле.


import UIKit

class VC6_2: UIViewController, UITextFieldDelegate {
    var loginTextField : UITextField!
    var mailTextField : UITextField!
    var passTextField : UITextField!
    var enterButton : UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    firstFuncForVC()
        
    loginTextField = letItBeTextField(placeholder: "введите логин", y: h * 0.3)
    mailTextField = letItBeTextField(placeholder: "введите почту", y: h * 0.45)
    passTextField = letItBeTextField(placeholder: "введите пароль", y: h * 0.55)
    passTextField.isSecureTextEntry = true
    enterButton = letItBeButtonFUNC(title: "Войти", width: w * 0.8, height: h * 0.1, x: w * 0.5, y: h * 0.7)
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
    
    
    func letItBeButtonFUNC(title: String, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat, fun: String = "", backgroundColor: UIColor = .orange, titleColor: UIColor = .black ) -> UIButton{
        
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: 0, y: 0, width: width, height: height)
        currentButton.center = CGPoint(x: x, y: y)
        currentButton.setTitle(title, for: .normal)
        currentButton.backgroundColor = backgroundColor
        currentButton.setTitleColor(titleColor, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(sharedButtonsFunc(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(currentButton)
        return currentButton
    }
    @objc func sharedButtonsFunc(sender: UIButton) -> Void {

        if sender.titleLabel?.text == "Войти"{
            window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = VC6_2_Settings()
            window.makeKeyAndVisible()
        }
        
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
        currentLabel.center = CGPoint(x: view.bounds.width * 0.5, y: y )
        currentLabel.textColor = .darkGray
        view.addSubview(currentLabel)
        return currentLabel
    }

}

