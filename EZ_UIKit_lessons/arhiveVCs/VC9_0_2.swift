//
//  VC_0_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 26.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC9_0_2: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "secondVC"
        
            let simpleSwich = UISwitch()
        simpleSwich.isOn = true
        simpleSwich.addTarget(self, action: #selector(doSwitch(sender:)), for: .valueChanged)

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: simpleSwich)

         UIApplication.statusBarBackgroundColor = .black

        UIApplication.shared.statusBarStyle = .lightContent


    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIApplication.shared.statusBarStyle = .lightContent
        perform(#selector(goBack), with: nil, afterDelay: 3.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navController.navigationBar.isTranslucent = false
         UIApplication.statusBarBackgroundColor = .black
        UIApplication.shared.statusBarStyle = .lightContent
        navController.navigationBar.backgroundColor = .white

    }
    

    
    @objc func goBack(){
//        navigationController?.popViewController(animated: true)
        //Получаем текущий массив контроллеров. Это то же самое, что и просто 26 строка(на один выше текущей, но более объёмно для понимания)
        var currentControllerArray = navigationController?.viewControllers
        // удаляем последний контроллер
        currentControllerArray?.removeLast()
        // Присвоим
//        if let newController = currentControllerArray{
//            navigationController?.viewControllers = newController
//    }
        //либо то же самое вместо if let
        guard let newController = currentControllerArray else {
            return
        }
        navigationController?.viewControllers = newController
        
        
    }
    
    @objc func doSwitch(sender: UISwitch){
        if sender.isOn{
            print("On")
        }
        else{
            print("Off")
        }
    
    }
    

}
