//
//  VC24_04.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 6/4/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC24_04: MyVC {
    
    let viewRed : UIView = {
        let view = UIView()
        
        // без этой строки не получится работать с констрейтами в коде
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .red
        return view
    }()
    let viewBlue : UIView = {
        let view = UIView()
        
        // без этой строки не получится работать с констрейтами в коде
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .blue
        return view
    }()
    
    let viewGreen : UIView = {
        let view = UIView()
        
        // без этой строки не получится работать с констрейтами в коде
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .green
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(viewRed)
        view.addSubview(viewBlue)
        view.addSubview(viewGreen)
        createViewRedConstraint()
        createViewBlueConstraint()
        createViewGreenConstraint()
    }
    
    
    func createViewRedConstraint(){
        viewRed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewRed.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3).isActive = true
        viewRed.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewRed.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }
    func createViewBlueConstraint(){
        viewBlue.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        viewBlue.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1 / 3).isActive = true
        viewBlue.heightAnchor.constraint(equalToConstant: 100).isActive = true
        viewBlue.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    func createViewGreenConstraint(){
        viewGreen.rightAnchor.constraint(equalTo: viewBlue.rightAnchor).isActive = true
        viewGreen.leftAnchor.constraint(equalTo: viewRed.leftAnchor).isActive = true
        viewGreen.bottomAnchor.constraint(equalTo: viewRed.topAnchor, constant: -20).isActive = true
        viewGreen.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
}
