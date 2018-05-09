//
//  FactoryMethotVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 08.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class FactoryMethotVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        //если метод не делать static как в видео, то выглядеть будет так:
        // let car = CarFactoryFM().produceVehicle()
let car = CarFactoryFM.produceVehicle()
        car.drive()
        // Do any additional setup after loading the view.
    }



}

protocol VehicleFM {
    func drive()
}
class CarFM: VehicleFM{
    func drive() {
        print("drive a car")
    }
}
class TruckFM: VehicleFM{
    func drive() {
        print("drive a truck")
    }
}
class BusFM: VehicleFM{
    func drive() {
        print("drive a bus")
    }
}

protocol VehicleFactoryFM {
   static func produceVehicle() -> VehicleFM
}

class CarFactoryFM : VehicleFactoryFM{
   static func produceVehicle() -> VehicleFM {
       print("car is created")
        return CarFM()
    }
}
class TruckFactoryFM : VehicleFactoryFM{
   static func produceVehicle() -> VehicleFM {
        print("truck is created")
        return TruckFM()
    }
}
class BusFactoryFM : VehicleFactoryFM{
   static func produceVehicle() -> VehicleFM {
        print("bus is created")
        return BusFM()
    }
}

