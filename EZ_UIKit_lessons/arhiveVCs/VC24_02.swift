//
//  VC24_02.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 6/3/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC24_02: MyVC {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(viewRed)
        view.addSubview(viewBlue)
        
        let viewVFL = ["viewRed": viewRed, "viewBlue": viewBlue]
        let metrics = ["height": 100, "width": view.bounds.size.width / 3, "top": view.bounds.size.height / 2]
        
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-top-[viewRed(height)]|",
            options: [],
            metrics: metrics,
            views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-top-[viewBlue(height)]|",
            options: [],
            metrics: metrics,
            views: viewVFL))
        view.addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[viewRed(width)]-(50)-[viewBlue(width)]-|",
            options: [],
            metrics: metrics,
            views: viewVFL))
        
    }

    
    
}
