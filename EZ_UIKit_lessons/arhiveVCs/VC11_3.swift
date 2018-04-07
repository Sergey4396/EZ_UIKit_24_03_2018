//
//  VC11_3.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 29.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//GIf gif .gif
//it's here: https://github.com/swiftgif/SwiftGif/blob/master/SwiftGifCommon/UIImage%2BGif.swift
//

import UIKit
var isLoaded = false
class VC11_3: MyVC {
    var label : UILabel!
    var button1 : UIButton!
    var button2 : UIButton!
    var textView : UITextView!
    var imageView : UIImageView!
    var bigImageView : UIImageView!
    
    var stepCount : Int = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
             navigationItem.title = "Как стать слабым джуниором"
        if !isLoaded{
                isLoaded = true
            let _ = Advise(image:#imageLiteral(resourceName: "junior"), text: "Лорен ипсум де ланар")
            let _ = Advise(image: #imageLiteral(resourceName: "fry"), text: "Сейчас, дорогой друг, я расскажу тебе всё, что нужно знать, чтобы прослыть хорошим слабым джуниором")
            let _ = Advise(image: #imageLiteral(resourceName: "Adaptive layout"), text: "Начать можно например с адаптивного дизайна. Это скоро. В 23 уроке уже начнётся")
            let _ = Advise(image: #imageLiteral(resourceName: "Core animation"), text: "Дальше Core animation. Что-то про это было в курсах стендфорда. Красиво и мастхэв, хоть и не выглядит сложным")
            let _ = Advise(image:#imageLiteral(resourceName: "View controller lifecycle"), text: "View controller lifecycle. Мы с этим и так постоянно сталкиваемся. loadView только непривычная функция.")
            let _ = Advise(image: #imageLiteral(resourceName: "Frames:bounds"), text: "Frames/bounds. Ну.. наверное у того парня можно глянуть на ютубе")
            let _ = Advise(image: #imageLiteral(resourceName: "Core Data"), text: "Core Data. Ну хоть что-то я уже почти знаю.")
            let _ = Advise(image: #imageLiteral(resourceName: "Keychain"), text: "Keychain. Что это.. как это? Ну в общем всё будет нормалёк - разберёшься.")
            let _ = Advise(image: #imageLiteral(resourceName: "SQLite"), text: "SQLite. Так мы и до CSS дойдём.")
            let _ = Advise(image: #imageLiteral(resourceName: "NSCoding"), text: "NSCoding. Слова то знакомые - разберёшься.")
            let _ = Advise(image: #imageLiteral(resourceName: "fry"), text: "В общем смотри до слабого джуна осталось вот еще чуток")
            
            
//        var tabBarItem = UITabBarItem()
//        tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
//        self.tabBarItem = tabBarItem
        window = UIWindow(frame: UIScreen.main.bounds)
       
        let firstVC = UINavigationController(rootViewController:VC11_3())
        let secondVC = UINavigationController(rootViewController:VC11_4())
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([firstVC, secondVC], animated: true)
        
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
            

            var tabBarItem = UITabBarItem()
            tabBarItem = UITabBarItem(title: "reddit", image: #imageLiteral(resourceName: "social-075_reddit"), tag: 1)
            //tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
            firstVC.tabBarItem = tabBarItem
            
            
            //        VC11_4().navigationItem.title = "Third VC"
            var tabBarItem2 = UITabBarItem()
            let visaImg = UIImage(named: "social-045-round_visa")
            tabBarItem2 = UITabBarItem(title: "visa", image: visaImg, tag: 1)
           // tabBarItem2 = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
            secondVC.tabBarItem = tabBarItem2

        }

        imageView = ssImageView(image: "junior", y: 40, width: 100, height: w100)
         label = ssLabel(text: "Шаг 0", width: 30, height: 6, x: 25, y: 15, backgroundColor: .black, textColor: .orange)

        textView = ssTextView(text: "Лорен ипсум де ланар", y: 72, height: 20, backgroundColor: .clear)
        button1 = ssButton(title: "Назад", width: 25, height: 4, x: 20, y: 85)
        button2 = ssButton(title: "Вперёд", width: 25, height: 4, x: 80, y: 85)
        
        button1.isHidden = true

    }

    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "Вперёд"{
            if stepCount < Advise.arrayOfAll.count - 1{

            imageView.image = Advise.arrayOfAll[stepCount + 1].image
            textView.text = Advise.arrayOfAll[stepCount + 1].text
            stepCount += 1
                label.text = "Шаг \(stepCount)"
                if stepCount == Advise.arrayOfAll.count - 1{
                    sender.isHidden = true
                
                    startPerform()
                    
//                    unowned let unownedSelf = self
//
//                    let deadlineTime = DispatchTime.now() + .seconds(5)
//                    DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: {
//                        unownedSelf.startPerform()
//                    })
             
                }
            }

            button1.isHidden = false
        }
         if sender.titleLabel?.text == "Назад"{
            if stepCount > 0{
                imageView.image = Advise.arrayOfAll[stepCount - 1].image
                textView.text = Advise.arrayOfAll[stepCount - 1].text
                stepCount -= 1
                label.text = "Шаг \(stepCount)"
                
                if stepCount == 0{
                    sender.isHidden = true
                }
            }
            button2.isHidden = false
        }
    }
    
    func startPerform(){
                perform(#selector(showAll), with: nil, afterDelay: 3.0)
                perform(#selector(delImgView), with: nil, afterDelay: 12.0)
    }
    
    @objc func showAll(){
        
        bigImageView = ssImageView(image: "Снимок экрана", y: 50, width: 100, height: 100)
        
    }
    @objc func delImgView(){
        
        bigImageView.removeFromSuperview()
    }
}
struct Advise {
    static var arrayOfAll : [Advise] = []

    var image : UIImage!
    var text : String!
    var nomber : Int
    init(image: UIImage, text: String) {
        self.image = image
        self.text = text
        
        self.nomber = Advise.arrayOfAll.count
        Advise.arrayOfAll.append(self)
    }
}
