//
//  VC12.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 30.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
var isVC12Loaded = false
class VC12: MyVC {

    var label : UILabel!
    var pickerForFont : UIPickerView!
    var pickerForColor : UIPickerView!
    var pickerForLines : UIPickerView!
    
    var colorValue : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "UILabel"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(forBarButton(sender:)))
        if !isVC12Loaded{
            isVC12Loaded = true


            window = UIWindow(frame: UIScreen.main.bounds)
            
            let firstVC = UINavigationController(rootViewController:VC12())
            let secondVC = UINavigationController(rootViewController:VC12_1())
            
            let tabBarVC = UITabBarController()
            tabBarVC.setViewControllers([firstVC, secondVC], animated: true)
            
            window?.rootViewController = tabBarVC
            window?.makeKeyAndVisible()
            
            
            var tabBarItem = UITabBarItem()
            tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
            firstVC.tabBarItem = tabBarItem
            


            var tabBarItem2 = UITabBarItem()

            tabBarItem2 = UITabBarItem(tabBarSystemItem: .more, tag: 1)
            secondVC.tabBarItem = tabBarItem2
            

            
        }

        label = ssLabel(text: "Any", width: 80, height: 12, x: 50, y: 16)
        pickerForColor = ssPickerView(width: 60, height: 40, x: 50, y: 40)
        pickerForColor.selectRow(500, inComponent: 0, animated: false)
        pickerForFont = ssPickerView(width: 50, height: 40, x: 25, y: 75)
        pickerForLines = ssPickerView(width: 50, height: 40, x: 75, y: 75)
        
        
    }

    @objc func forBarButton(sender: UIBarButtonItem){
        

        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Поменять Label", message: "введите новые данные", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "вот здесь"

        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            
            self.label.text = alert?.textFields![0].text // Force unwrapping because we know it exists.

            
        }))
        //3.5  добавим кнопку отказаться
        alert.addAction(UIAlertAction(title: "Я передумал", style: .cancel, handler: { (_) in
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
    
    override func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerForColor {
            return 1000
        }
       else if pickerView == pickerForFont {
            return 25
        }
        else{
            return 10
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if pickerView == pickerForColor {
            let label = UILabel()

            colorValue = CGFloat(Float(row) / Float(50))
            let color = UIColor(hue: colorValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            
            label.backgroundColor = color//UIColor(red: 0, green: 1, blue: 0, alpha: CGFloat(0.1) * CGFloat((row) % 10) + 0.1)
            return label
        }
        else if pickerView == pickerForFont{
            let label = UILabel()
            label.backgroundColor = .clear
            label.text = "Font = \(10 + row * 2)"
            label.textAlignment = .center
            return label
        }
        else{
            let label = UILabel()
            label.backgroundColor = .clear
            label.text = "\(row) lines"
            label.textAlignment = .center
            return label
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                if pickerView == pickerForColor {
        
            label.textColor = UIColor(hue: colorValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
        
        }
                else if pickerView == pickerForFont{
           label.font = UIFont.boldSystemFont(ofSize: CGFloat(10 + row * 2))//(name: "sistem", size: CGFloat(10 + row * 2))
        }
                else if pickerView == pickerForLines{
                    label.numberOfLines = row
                    label.lineBreakMode = .byWordWrapping
        }
    }
    
}
