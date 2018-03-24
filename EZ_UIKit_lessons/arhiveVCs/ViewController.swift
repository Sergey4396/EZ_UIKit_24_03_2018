//
//  ViewController.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit


class VC1: UIViewController {
    override func loadView() {
        super.loadView()// легко забыть добавить это, а без этого все падает
        view.backgroundColor = .lightGray
        print("это viewLoad. Никогда не знал о его сущесвовании")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        view.backgroundColor = .yellow
        setSwitchN1()
        setSwitchN2()

        print("и viewLoad() очевидно загружается раньше чем viewDidLoad()")
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //            view.backgroundColor = .green
    //    }
    override func viewDidAppear(_ animated: Bool) {
        if isButtonAvailable{
            let deadlineTime = DispatchTime.now() + .seconds(3)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
                self.setButton()
            })
            let deadlineTime2 = DispatchTime.now() + .seconds(1)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime2, execute: {
                self.setNewLabel2()
            })
            
            setNewLabel()
        }
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
            print("On")
        }
        else{
            print("Off")
        }
    }
    func setSwitchN2(){
        currentSwitch = UISwitch()
        currentSwitch.addTarget(self, action: #selector(changeSwitchValue2(paramTarget:)), for: .valueChanged)
        currentSwitch.frame = CGRect(x: view.bounds.width * 0.8, y: view.bounds.height * 0.4, width: 0, height: 0)
        switchN2 = currentSwitch
        view.addSubview(switchN2)
    }
    @objc func changeSwitchValue2(paramTarget:UISwitch){
        if paramTarget.isOn{
            if !switchN1.isOn{
                let alert = UIAlertController(title: "🤔", message: "сначала нужно включить верхний switch", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ладно", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("switchN1 is sleel Off")
            }
            else{
                print("On")
                window = UIWindow(frame: UIScreen.main.bounds)
                window.rootViewController = VC2()
                window.makeKeyAndVisible()
            }
        }
        else{
            print("Off")
        }
    }
    func setButton() -> Void {
        currentButton = UIButton()
        currentButton.frame = CGRect(x: view.bounds.width * 0.2, y: view.bounds.height * 0.8, width: view.bounds.width * 0.6, height: view.bounds.height * 0.1)
        currentButton.setTitle("Ops", for: .normal)
        currentButton.backgroundColor = .red
        currentButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
        opsButton = currentButton
        view.addSubview(opsButton)
    }
    @objc func buttonPressed(sender: UIButton){
        let alert = UIAlertController(title: "Ну..", message: "Ничего интересного у меня не придумывается", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok, сойдёт", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    func setNewLabel(){
        currentLabel = UILabel()
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.7, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.text = "О.. кнопка появилась"
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        
        newLabel = currentLabel
        view.addSubview(newLabel)
    }
    func setNewLabel2(){
        currentLabel = UILabel()
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.8, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.text = "Нет.. но сейчас уже скоро"
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        
        newLabel2 = currentLabel
        view.addSubview(newLabel2)
        
    }
    
    //    func setSwipe(){
    //        //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻{добавляем свайп - это когда пальцем двигаешь влево и телефон это понимает
    //        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected(swipe:)))
    //        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
    //        self.view.addGestureRecognizer(rightSwipe)
    //        //🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹}
    //    }
    //
    //    @objc func swipeDetected(swipe: UISwipeGestureRecognizer){
    //        print("swipe!")
    //        window = UIWindow(frame: UIScreen.main.bounds)
    //        window?.rootViewController = InitViewController()
    //        window?.makeKeyAndVisible()
    //    }
    
}

