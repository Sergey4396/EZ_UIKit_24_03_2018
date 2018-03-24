//
//  SecondViewController.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        view.backgroundColor = .lightGray
        setSwitchN1()
        setSwitchN2()
        setTitleLabel()
        isButtonAvailable = true
        
        // Do any additional setup after loading the view.
    }
    
    func setSwitchN1(){
        currentSwitch = UISwitch()
        currentSwitch.addTarget(self, action: #selector(changeSwitchValue(paramTarget:)), for: .valueChanged)
        currentSwitch.frame = CGRect(x: view.bounds.width * 0.8, y: view.bounds.height * 0.2, width: 0, height: 0)
        switchN1 = currentSwitch
        view.addSubview(switchN1)
    }
    
    @objc func changeSwitchValue(paramTarget:UISwitch){
        if paramTarget.isOn{
            print("этот switch ничего не делает")
        }
        else{
            print("Но в принципе его можно запрограммировать")
        }
    }
    func setSwitchN2(){
        currentSwitch = UISwitch()
        currentSwitch.addTarget(self, action: #selector(changeSwitchValue2(paramTarget:)), for: .valueChanged)
        currentSwitch.frame = CGRect(x: view.bounds.width * 0.8, y: view.bounds.height * 0.4, width: 0, height: 0)
        switchN1 = currentSwitch
        view.addSubview(switchN1)
    }
    @objc func changeSwitchValue2(paramTarget:UISwitch){
        if paramTarget.isOn{
            print("On")
            window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = VC1()
            window.makeKeyAndVisible()
        }
        else{
            print("Off")
        }
    }
    func setTitleLabel(){
        currentLabel = UILabel()
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.1, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.text = "Это второй контроллер"
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        titleLabel = currentLabel
        view.addSubview(titleLabel)
    }
}

