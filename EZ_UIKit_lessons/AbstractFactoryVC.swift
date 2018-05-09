//
//  AbstractFactoryVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 09.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class AbstractFactoryVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let littleSizeFactory = LittleSizeFactory()
        let middleSizeFactory = MiddleSizeFactory()
        let car = littleSizeFactory.produceBus()
        let bus = middleSizeFactory.produceCar()
        car.drive()
        bus.drive()
    }
}
protocol CarAF{
    func drive()
}

class LittleSizeCarAF: CarAF{
    func drive() {
        print("drive little car")
    }
 
}
class MiddleSizeCarAF: CarAF{
    func drive() {
        print("drive middle car")
    }
    
}
protocol BusAF {
    func drive()
}

class LittleSizeBusAF: BusAF {
   func drive(){
    print("drive a little bus")
    }
}

class MiddleSizeBusAF: BusAF {
    func drive(){
        print("drive a middle bus")
    }
}
protocol FactoryAF{
    func produceCar() -> CarAF
    func produceBus() -> BusAF
}
class LittleSizeFactory: FactoryAF {
    func produceCar() -> CarAF {
        print("little car is created")
        return LittleSizeCarAF()
    }
    
    func produceBus() -> BusAF {
        print("little bus is created")
        return LittleSizeBusAF()
    }

}

class MiddleSizeFactory: FactoryAF {
    func produceCar() -> CarAF {
        print("middle car is created")
        return MiddleSizeCarAF()
    }
    
    func produceBus() -> BusAF {
        print("middle bus is created")
        return MiddleSizeBusAF()
    }
    
}
