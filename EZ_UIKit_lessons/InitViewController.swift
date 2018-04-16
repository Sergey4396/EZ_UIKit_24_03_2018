//
//  InitViewController.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class InitViewController: MyVC {
    var buttonToGo : UIButton!
    var currentButtonToGoTo : ButtonToGoToVC!
    var scrollView : UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //setGoToViewControllerButton(buttonName:"new", vcToGo: VC1(), x: 100,y:100)
        ssScrolView()
        
        
        
        if !isVCset {
            setVCNamesForAllLessons()
        }
        setAllGoToButtons()
        
        isLoaded = false// это для VC11_3 костыль
        
        (currentMainView as! UIScrollView).scrollRectToVisible(CGRect(x: w50, y: h80, width: w, height: h), animated: true)
    }
    //я хотел сделать это чере extention но у меня не получилось, очевидно я забыл (не доразобрался) как правильно пользоваться геттером и сеттером
    class ButtonToGoToVC: UIButton{
        var vcToGo : UIViewController = InitViewController()
    }
    
    func setAllGoToButtons(){
        print(AllFirstControllersStruct.allFirstControllersDictsArray.count)
        var x = CGFloat(view.bounds.width * 0.1)
        var y = CGFloat(view.bounds.height * 0.1)
        for n in 0...AllFirstControllersStruct.allFirstControllersDictsArray.count -  1{
            setGoToViewControllerButton(buttonName: AllFirstControllersStruct.allFirstControllersDictsArray[n].name, vcToGo: AllFirstControllersStruct.allFirstControllersDictsArray[n].controller, x: x, y: y)
            x = CGFloat(view.bounds.width * 0.1) + CGFloat(((n + 1) % 3)) * (view.bounds.width * 0.3)
            y = CGFloat(view.bounds.height * 0.1) + CGFloat((n + 1) / 3) * CGFloat(view.bounds.width * 0.2)
        }
    }
    
    func setGoToViewControllerButton(buttonName:String, vcToGo: UIViewController, x: CGFloat,y:CGFloat) -> Void {
        currentButtonToGoTo = ButtonToGoToVC()
        currentButtonToGoTo.vcToGo = vcToGo
        currentButtonToGoTo.frame = CGRect(x: x, y: y, width: view.bounds.width * 0.25, height: view.bounds.height * 0.1)
        currentButtonToGoTo.setTitle(buttonName, for: .normal)
        currentButtonToGoTo.backgroundColor = .red
        currentButtonToGoTo.titleLabel?.numberOfLines = 2
        currentButtonToGoTo.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButtonToGoTo.addTarget(self, action: #selector(InitViewController.buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
        buttonToGo = currentButtonToGoTo
        currentMainView.addSubview(buttonToGo)
    }
    @objc func buttonPressed(sender: ButtonToGoToVC){
        print("button pressed")
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = sender.vcToGo
        window.makeKeyAndVisible()
        
    }
}

