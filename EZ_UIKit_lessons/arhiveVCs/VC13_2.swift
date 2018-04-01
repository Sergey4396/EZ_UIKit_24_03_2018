//
//  VC13_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC13_2: MyVC {
    var arrayOfLabels : [UILabel] = []
    var createButton : UIButton!
    var delButton : UIButton!
    var delAllButton : UIButton!
    var create100LabelsButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
createButton = ssButton(title: "ОУ, да я теперь программист", width: 90, height: 10, x: 50, y: 90)
        delButton = ssButton(title: "удалить последнее", width: 40, height: 6, x: 25, y: 80, backgroundColor: .red)
 delAllButton = ssButton(title: "удалить все", width: 40, height: 6, x: 75, y: 80, backgroundColor: .red)
        create100LabelsButton = ssButton(title: "+100", width: 10, height: 4, x: 90, y: 97.5,backgroundColor: .red)
        delAllButton.isHidden = true
        delButton.isHidden = true
        create100LabelsButton.isHidden = true
    }

    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "ОУ, да я теперь программист"{
        let x = CGFloat(Int(arc4random_uniform(1000000)) % 80)
        let y = CGFloat(Int(arc4random_uniform(1000000)) % 80)
        let width = CGFloat(Int(arc4random_uniform(1000000)) % 70 + 30)
        let height = CGFloat(Int(arc4random_uniform(1000000)) % 10 + 10)
        
        let hue = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
        let saturation = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
        let brightness = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
        let alpha = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
        let textColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)

         let rotationAngle = CGFloat( (Double.pi / 2) * (Double(Int(arc4random_uniform(1000000)) % 100) / 100.0) - Double.pi / 4)
        
        let font = CGFloat(Int(arc4random_uniform(1000000)) % 28 + 10)
        
        
        let label = ssLabel(text: "Hello World", width: width, height: height, x: x, y: y, backgroundColor: .clear, textColor: textColor)
      
        label.transform = CGAffineTransform(rotationAngle: rotationAngle)
        label.font = UIFont.boldSystemFont(ofSize: font)
        arrayOfLabels.append(label)
            
            delAllButton.isHidden = false
            delButton.isHidden = false
            create100LabelsButton.isHidden = false
        }
       
        if sender.titleLabel?.text == "удалить последнее"{
         
//            arrayOfLabels.last?.removeFromSuperview()
            arrayOfLabels.popLast()?.removeFromSuperview()// офигеть.  в одну строчку можно сделать
        }

        if sender.titleLabel?.text == "удалить все"{
            
            for label in arrayOfLabels{
                label.removeFromSuperview()
            }
            arrayOfLabels = []
            
        }
        
        
        if sender.titleLabel?.text == "+100"{
            for _ in 0...99{
            let x = CGFloat(Int(arc4random_uniform(1000000)) % 80)
            let y = CGFloat(Int(arc4random_uniform(1000000)) % 80)
            let width = CGFloat(Int(arc4random_uniform(1000000)) % 70 + 30)
            let height = CGFloat(Int(arc4random_uniform(1000000)) % 10 + 10)
            
            let hue = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
            let saturation = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
            let brightness = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
            let alpha = CGFloat((Double(Int(arc4random_uniform(1000000)) % 100)) / 100.0)
            let textColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
            
            let rotationAngle = CGFloat( (Double.pi / 2) * (Double(Int(arc4random_uniform(1000000)) % 100) / 100.0) - Double.pi / 4)
            
            let font = CGFloat(Int(arc4random_uniform(1000000)) % 28 + 10)
            
            
            let label = ssLabel(text: "Hellow World", width: width, height: height, x: x, y: y, backgroundColor: .clear, textColor: textColor)
            
            label.transform = CGAffineTransform(rotationAngle: rotationAngle)
            label.font = UIFont.boldSystemFont(ofSize: font)
            arrayOfLabels.append(label)
            }
        }

    }

}
