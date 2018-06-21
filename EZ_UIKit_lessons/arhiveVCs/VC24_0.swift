//
//  VC24_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 6/3/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC24_0: MyVC {

    let view1 : UIView = {
        let view = UIView()
        
        // без этой строки не получится работать с констрейтами в коде
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(view1)
        createView1Constraint()
        
    }


    func createView1Constraint(){
        NSLayoutConstraint(item: view1,
                        attribute: .leading,
                        relatedBy: .equal,
                        toItem: view,
                        attribute: .leadingMargin,
                        multiplier: 1,
                        constant: 0).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .trailingMargin,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailingMargin,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .topMargin,
                           multiplier: 1,
                           constant: 88).isActive = true
        NSLayoutConstraint(item: view1,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .width,
                           multiplier: 1,
                           constant: 0).isActive = true
    }


}
