//
//  PrototypeVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 30.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class PrototypeVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = ssButton(title: "1111", width: 30, height: 10, x: 20, y: 10)
        let button2 = copyButton(button)
        button2.setTitle("22222", for: .normal)
        button2.center = CGPoint(x: w80, y: h10)

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        let person = Person()
        person.name = "Sergey"
        let person2 = person.copy()
        person2.name = "Andrey"
        print(person.name)
        print(person2.name)
        
        
    }
    func copyButton(_ button:UIButton) -> UIButton{
        let b = UIButton()
        b.setTitle(button.titleLabel?.text, for: .normal)
        b.frame = button.frame
        b.backgroundColor = button.backgroundColor
        b.setTitleColor(button.titleLabel?.textColor, for: .normal)
        view.addSubview(b)
        return b
    }

}
protocol Copying {
    init(instance: Self)
}
extension Copying {
    func copy() -> Self {
        return Self.init(instance: self)
    }
}

class Person: Copying {
    var name: String!
    var surname: String!
    init() {}
    required init(instance: Person) {
        self.name = instance.name
        self.surname = instance.surname
    }
}



