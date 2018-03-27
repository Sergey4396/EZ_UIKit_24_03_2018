//
//  VC9_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 26.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
////
//1.Повторить то что было в уроке.
//2.Создать полностью кастомный нав бар.
//3.barButtonItem тоже сделать кастомным .
//    4.При скроле вверх сделать UINavigationConroller прозрачным.
//5. А во втором VC по умолчанию сделать прозрачным.
//6. Сделать так что б status bar в одном VC был белый а в другом черный.

import UIKit

var navController = UINavigationController()
class VC9_0: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()

let _ = ssButton(title: "Go to 1st navigation ViewController", width: 90, height: 15, x: 50, y: 25)
        let _ = ssButton(title: "Go to 2nd navigation ViewController", width: 90, height: 15, x: 50, y: 50, backgroundColor : .cyan)
    }

    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "Go to 1st navigation ViewController"{
        let viewController = VC9_0_1()
       navController = UINavigationController(rootViewController: viewController)
        }
        else{
            let viewController = VC9_0_3()
            navController = UINavigationController(rootViewController: viewController)
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        
        window?.makeKeyAndVisible()
    }

}
