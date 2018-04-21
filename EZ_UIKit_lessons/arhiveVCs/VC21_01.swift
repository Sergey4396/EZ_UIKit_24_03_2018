//
//  VC20_01.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 22.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC21_01: MyVC {
    
    var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
// создаем view
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        var colors : [UIColor] = [.red, .green]
        var currentCenterPoint : CGPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
        
        for counter in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
            newView.backgroundColor = colors[counter]
            newView.center = currentCenterPoint
            currentCenterPoint.y += eachViewSize.height + 10
            view.addSubview(newView)
            squareViews.append(newView)
        }
        
        animator = UIDynamicAnimator(referenceView: view)
        
        //создадим тяготение
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
    
    // реализуем столкновение
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true
       
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: h90), to: CGPoint(x: w, y: h90))
        
        collision.collisionDelegate = self
        animator.addBehavior(collision)
    //
        
    
    }
   
}

extension VC21_01: UICollisionBehaviorDelegate{
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifier = identifier as? String
        let kbottomBoundary = "bottomBoundary"
        
        if identifier == kbottomBoundary{
            UIView.animate(withDuration: 1.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = .red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }, completion: { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
                
            })
            

        }
    }
}

