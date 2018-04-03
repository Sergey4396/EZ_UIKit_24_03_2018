//
//  ExtensionForVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    
    func setSwipe(){
        //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻{добавляем свайп - это когда пальцем двигаешь влево и телефон это понимает
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeDetected(swipe:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(rightSwipe)
        //🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹}
    }
    
    @objc func swipeDetected(swipe: UISwipeGestureRecognizer){
        print("swipe!")
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = InitViewController()
        window?.makeKeyAndVisible()
    }
    
    func firstFuncForVC(){
        setSwipe()
        view.backgroundColor = .white
     h = view.bounds.height
     w = view.bounds.width
    (h5,h10,h15,h20,h25,h30,h35,h40,h45,h50,h55,h60,h65,h70,h75,h80,h85,h90,h95,h100) = (h * 0.05, h * 0.1,h * 0.15, h * 0.2,h * 0.25, h * 0.3,h * 0.35, h * 0.4,h * 0.45, h * 0.5,h * 0.55, h * 0.6,h * 0.65, h * 0.7,h * 0.75, h * 0.8,h * 0.85, h * 0.9,h * 0.95, h)
  

     (w5,w10,w15,w20,w25,w30,w35,w40,w45,w50,w55,w60,w65,w70,w75,w80,w85,w90,w95,w100) = (w * 0.05, w * 0.1,w * 0.15, w * 0.2,w * 0.25, w * 0.3,w * 0.35, w * 0.4,w * 0.45, w * 0.5,w * 0.55, w * 0.6,w * 0.65, w * 0.7,w * 0.75, w * 0.8,w * 0.85, w * 0.9,w * 0.95, w)
        //just removing worrings
//        _ = h5 + h10 + h15 + h20 + h25 + h30 + h35 + h40 + h45 + h50 + h55 + h60 + h65 + h70 + h75 + h80 + h85 + h90 + h95 + h100 + w5 + w10 + w15 + w20 + w25 + w30 + w35 + w40 + w45 + w50 + w55 + w60 + w65 + w70 + w75 + w80 + w85 + w90 + w95 + w100
  

        
    }

    
    
}

