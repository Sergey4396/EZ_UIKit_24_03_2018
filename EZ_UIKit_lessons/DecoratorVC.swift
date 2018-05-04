//
//  DecoratorVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class DecoratorVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        // обязательно указать тип Porshe а то все рушится.
        var car : Porshe = Boxter()
        print(car.getDescription())
        print(car.getPrise())
        car = PremiumAudioSistem(dp: car)
        print(car.getDescription())
        print(car.getPrise())
        car = PanoramicSunRoof(dp: car)
        print(car.getDescription())
        print(car.getPrise())
    }



}
protocol Porshe {
    func getPrise() -> Double
    func getDescription() -> String
}
class Boxter: Porshe {
    func getPrise() -> Double {
        return 120
    }
    
    func getDescription() -> String {
        return "Porshe Boxter"
    }
   
}

class PorsheDecorator: Porshe {
    private let decoratedPorshe : Porshe
    
    required init(dp: Porshe){
        self.decoratedPorshe = dp
    }
    func getPrise() -> Double {
        return decoratedPorshe.getPrise()
    }
    
    func getDescription() -> String {
        return decoratedPorshe.getDescription()
    }
}
class PremiumAudioSistem: PorsheDecorator{
    required init(dp: Porshe){
        super.init(dp: dp)
    }
    override func getPrise() -> Double {
       return super.getPrise() + 30
    }
    override func getDescription() -> String {
       return super.getDescription() + " premium audio system"
    }
}

class PanoramicSunRoof : PorsheDecorator{
    required init(dp: Porshe) {
        super.init(dp: dp)
    }
    override func getPrise() -> Double {
       return super.getPrise() + 20
    }
    override func getDescription() -> String {
        return super.getDescription() + " with panoramic sunroof"
    }
}
