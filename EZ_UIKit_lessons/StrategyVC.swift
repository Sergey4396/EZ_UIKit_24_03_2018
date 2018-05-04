//
//  StrategyVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class StrategyVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        let human = Human(swimBehavior: NonSwimer(), diveBehavior: ProfessionalDiver())
        human.performDive()
        human.performSwim()
        human.setDiveBehavior(db: ProfessionalDiver())
        human.setSwimBehavior(sb: ProfessionalSwimer())
        human.performDive()
        human.performSwim()
        
    }

}

protocol SwimBehavior {
    func swim()
}
protocol DiveBehavior {
    func dive()
}

class ProfessionalDiver: DiveBehavior{
    func dive() {
        print("professional diving")
    }
}
class NewbieDiver: DiveBehavior{
    func dive() {
        print("newbie diving")
    }
}
class NonDiver: DiveBehavior{
    func dive() {
        print("non-diving")
    }
}

class ProfessionalSwimer: SwimBehavior {
    func swim() {
        print("professional swimer")
    }
}


class NonSwimer: SwimBehavior {
    func swim() {
        print("non-swiming")
    }
}

class Human {
   private var diveBehavior : DiveBehavior!
   private var swimBehavior: SwimBehavior!
    
    func setSwimBehavior(sb: SwimBehavior){
        self.swimBehavior = sb
    }
    func setDiveBehavior(db: DiveBehavior){
        self.diveBehavior = db
    }
    func performSwim(){
        swimBehavior.swim()
    }
    func performDive(){
        diveBehavior.dive()
    }
    func run(){
        print("running")
    }
    init(swimBehavior: SwimBehavior, diveBehavior: DiveBehavior) {
        self.swimBehavior = swimBehavior
        self.diveBehavior = diveBehavior
    }
}
