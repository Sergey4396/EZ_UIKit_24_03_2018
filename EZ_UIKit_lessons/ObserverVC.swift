//
//  ObserverVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 30.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
import Foundation

class ObserverVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let teacher = Teascher()
        let pupil = Pupil()
        teacher.add(observer: pupil)
        teacher.homeTask = "learn pattern Obderver"
        let text = pupil.homeTask
        let _ = ssLabel(text: text, width: 90, height: 10, x: 50, y: 20)

    }
}
protocol Subject {
    func add(observer: PropertyObserver)
    func remove(observer: PropertyObserver)
    func notify(withString string: String)
}
class Teascher: Subject{
    
    var observerCollection = NSMutableSet()
    
    var homeTask = ""{
        didSet{
            notify(withString: homeTask)
        }
    }
    
    func add(observer: PropertyObserver) {
        observerCollection.add(observer)
    }
    
    func remove(observer: PropertyObserver) {
        observerCollection.remove(observer)
    }
    
    func notify(withString string: String) {
        for observer in observerCollection{
        (observer as! PropertyObserver).didGet(newTask: string)
        }
    }
    
    
}
protocol PropertyObserver {
    func didGet(newTask task: String)
}

class Pupil: NSObject, PropertyObserver{
    
    var homeTask = ""//{
//        didSet{
//            print("new task is \(homeTask)")
//        }
//    }
    
    
    func didGet(newTask task: String) {
        homeTask = task
        print("new homework to be done (\(homeTask))")
    }
    
    
}
