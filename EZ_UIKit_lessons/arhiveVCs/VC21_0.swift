//
//  VC21_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 21.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

// UICollisionBehavior - обнаружение столкновений
// UIGravityBehavior - обеспечивает таготение
// UIPushBehavior - реагирует на толчки
// UISnapBehebior - крепит view  к определенной точке
// UICollision - ?

class VC21_0: MyVC {
    
    let squareView = UIView()
    var animator = UIDynamicAnimator()
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        // создадим квадрат
        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        squareView.backgroundColor = .green
        squareView.center = view.center
        squareView.center.y = h95
        view.addSubview(squareView)
        
        // создаем аниматор и тяготение
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareView])
        gravity.setAngle(-CGFloat.pi / 2, magnitude: 4)
        animator.addBehavior(gravity)
    //    UIGravityBehavior().angle = 90
        
    }



}
