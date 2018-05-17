//
//  VC22_13.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 14.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC22_13: MyVC {
    
    var squareViews = [UIDynamicItem]()
    var greenViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()
    var newSquare = UIView()
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let _ = ssButton(title: "22", width: 20, height: 10, x: 20, y: 95)
        
    }
    override func ffButton(sender: UIButton) {
        makeAllSquares()
    }
    
    func makeAllSquares(){
        // создаем view
        squareViews = []
        let numberOfView = 1
        squareViews.reserveCapacity(numberOfView)
        var colors : [UIColor] = [.red]
        var currentCenterPoint : CGPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
        
        for counter in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: w * 0.01, height: eachViewSize.height))
            newView.backgroundColor = colors[counter]
            newView.center.x = w50//currentCenterPoint.x
            newView.center.y = currentCenterPoint.y + h40

            currentCenterPoint.y += eachViewSize.height + 10
            view.addSubview(newView)
            squareViews.append(newView)
        }
        setNewSquare()
        
        
        animator = UIDynamicAnimator(referenceView: view)

        
        //создадим тяготение
        //        let gravity = UIGravityBehavior(items: squareViews)
        //        animator.addBehavior(gravity)
        
        let gravity = UIGravityBehavior(items: [squareViews[0]])
        gravity.setAngle(-CGFloat.pi / 2, magnitude: 4)
        animator.addBehavior(gravity)
        
        
        // вместо гравитации сделаем просто движение вниз
        
        //эта функция для отсрочки иполнения на две секунды
        UIView.animate(withDuration: 2, animations: {
//            self.newSquare.center.y = h10
    //        self.newSquare.center.x = w40
        })
        
//        UIView.animate(withDuration: 2, animations: {
//            //            let bulletX = self.squareViews[0].center.x
//            //
//            //            let motion = UIDynamicItemBehavior(items: self.squareViews)
//            //
//            //            //UIAttachmentBehavior(item: self.squareViews[0], attachedToAnchor: CGPoint(x:bulletX,y:35))//UISnapBehavior(item: self.squareViews[0], snapTo: CGPoint(x:bulletX,y:35))
//            //            self.animator.addBehavior(motion)
//            self.squareViews[0].center.y = 0
//        })
        
        //так я пытался сделать отсрочку. Конкретно в данном случае не работает. То есть отсрочка есть, а анимации не видно
        //       scheduledTimerWithTimeInterval()
        
        //а вот теперь только добавим квадратик, чтоб не падал
        //        squareViews.append(newSquare)
        
        // реализуем столкновение
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: newSquare.center, to: newSquare.center)//CGPoint(x: 0, y: h90), to: CGPoint(x: w, y: h90))
        
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, for: UIBezierPath(rect: newSquare.frame))
        
        //        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, for: UIBezierPath(rect: squareViews[0].frame))
        //        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, for: UIBezierPath(rect: squareViews[1].frame))
        
        //yourBehavior.collider.addBoundaryWithIdentifier("aBarrierName", forPath: UIBezierPath(rect: yourPlayerPaddle.frame))
        
        collision.collisionDelegate = self
        print(animator)
        print(collision)
        animator.addBehavior(collision)
        //

    }
    
    //создаем таймер для
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(makeNewBullet), userInfo: nil, repeats: true)
    }
    //создаем пулю
    @objc func makeNewBullet(){
        
        // создаем аниматор и тяготение
//        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [squareViews[0]])
        gravity.setAngle(-CGFloat.pi / 2, magnitude: 4)
        animator.addBehavior(gravity)
        
        
//        UIView.animate(withDuration: 1, animations: {
//            self.squareViews[0].center.y = 0
//        })
        
    }

    
    func setNewSquare(){
        greenViews = []
        newSquare = UIView(frame: CGRect(x: w40, y: h5, width: 70, height: h10))
        newSquare.backgroundColor = .green
        newSquare.center = CGPoint(x: w50, y: h5)
        view.addSubview(newSquare)
        greenViews.append(newSquare)
        
        
//        UIView.animate(withDuration: 2, animations: {
//            self.newSquare.center.x = 100
//        })
        
        let gravity2 = UIGravityBehavior(items: greenViews)
        gravity2.setAngle(-CGFloat.pi, magnitude: 1.4)
        animator.addBehavior(gravity2)
    }
    
}

extension VC22_13: UICollisionBehaviorDelegate{
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        
        let view = item as? UIView
        view?.center.y = 0
        
        let identifier = identifier as? String
        let kbottomBoundary = "bottomBoundary"
        
        if identifier == kbottomBoundary{
       
            //эта функция для отсрочки иполнения на две секунды
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            
            UIView.animate(withDuration: 1.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = .red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                view?.center.y = -20
                
                self.newSquare.backgroundColor = .red
                self.newSquare.alpha = 0.0
                self.newSquare.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                
            }, completion: { (finished) in
                let view = item as? UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
                self.newSquare.removeFromSuperview()
               
            })
              self.animator.removeAllBehaviors()
            })
        
            

            
        }
    }
}


