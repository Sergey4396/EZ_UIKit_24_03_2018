//
//  AdapterVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 20.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class AdapterVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
let car = SimpleCar_Adaptor()
        let adaptedCar = SuperCarAdapter_Adapter(simpleCar: car)
        
      print(adaptedCar.makeNoise())
        // Do any additional setup after loading the view.
    }


    
    
}

//adaptee
class SimpleCar_Adaptor {
    func sound() -> String{
        return "tr-tr-tr"
        
    }
}
//target
protocol SuperCarProtocol_Adapter {
    func makeNoise() -> String
}
class SuperCar_Adapter: SuperCarProtocol_Adapter {
    func makeNoise() -> String {
        return "wroom-wroom"
    }
}
//adapter
class SuperCarAdapter_Adapter: SuperCarProtocol_Adapter {
    
    var simpleCar: SimpleCar_Adaptor
    init(simpleCar:SimpleCar_Adaptor) {
        self.simpleCar = simpleCar
    }
    
    func makeNoise() -> String {
        return simpleCar.sound()
    }
}
