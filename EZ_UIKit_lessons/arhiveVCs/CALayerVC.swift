//
//  CALayerVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 6/30/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class CALayerVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       let button = ssButton(title: "Button", width: 30, height: 10, x: 50, y: 50)
        let button = UIButton(frame: CGRect(x: w20, y: h10, width: w60, height: h10))
        view.addSubview(button)
        button.setBackgroundImage(UIImage(named: "simpson"), for: .normal)
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.layer.shadowOffset = CGSize(width: 5, height: 10)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 5
        
        //добавим градиент
        let gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = [UIColor.red.cgColor,  UIColor.blue.cgColor, UIColor.orange.cgColor, ]
//👍 вот ведь шикарное открытие. можно просто указать фрейм другого объекта, когда нужен такой же а не напрягать мозги с совпадением координат
        gradientLayer.frame = view.frame//CGRect(x: 0, y: 0, width: w, height: h)
    // можно сделать распределение неравномерным
        gradientLayer.locations = [0, 0.5, 1]
    }


    

  

}
