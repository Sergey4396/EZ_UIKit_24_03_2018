//
//  SimpleFactoryVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 08.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class SimpleFactoryVC: MyVC {
// это не паттерн, но штука очень удобная
    override func viewDidLoad() {
        super.viewDidLoad()

    let car1 = CarFactory.produceCar(type: .huge)
    let car2 = CarFactory.produceCar(type: .fast)
        car1.drive()
        car2.drive()
    }



}

enum CarType {
    case huge, fast
}
protocol Car {
    func drive()
}
class HugeCar: Car{
    func drive(){
        print("you are driving huge car")
    }
}
class FastCar: Car{
    func drive(){
        print("you are driving fast car")
    }
}

class CarFactory{
    static func produceCar(type: CarType) -> Car{
        var car : Car
        switch type {
        case .fast:
            car = FastCar()
        case .huge:
            car = HugeCar()
        }
        return car
    }
}
