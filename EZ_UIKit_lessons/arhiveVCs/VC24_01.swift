//
//  VC24_01.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 6/3/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC24_01: MyVC {
        
        let view1 : UIView = {
            let view = UIView()
            
            // без этой строки не получится работать с констрейтами в коде
            view.translatesAutoresizingMaskIntoConstraints = false
            
            view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            view.backgroundColor = .red
            return view
        }()
    let view2 : UIView = {
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
            view.addSubview(view2)
            createView1Constraint()
            createView2Constraint()
            
        }
        
        
        func createView1Constraint(){
            NSLayoutConstraint(item: view1,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0).isActive = true
            NSLayoutConstraint(item: view1,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0).isActive = true
            NSLayoutConstraint(item: view1,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 200).isActive = true
            NSLayoutConstraint(item: view1,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1,
                               constant: 200).isActive = true
        }
        
    func createView2Constraint(){
        NSLayoutConstraint(item: view2,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view2,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .top,
                           multiplier: 1,
                           constant: -8).isActive = true
        NSLayoutConstraint(item: view2,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: view2,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }
    

}

