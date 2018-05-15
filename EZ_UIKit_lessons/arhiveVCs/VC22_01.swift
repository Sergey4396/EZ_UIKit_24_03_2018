//
//  VC22_01.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 11.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC22_01: MyVC {

    //    UISnapBehavior - снимок экрана
    
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var snapBehavior: UISnapBehavior?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGestureRecognizer()
        createSmallSquareView()
        createAnimatorBehaviors()
    }

    func createGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap: )))
        view.addGestureRecognizer(tap)
    }

    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    func createAnimatorBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        //Зацеп
        snapBehavior = UISnapBehavior(item: squareView, snapTo: squareView.center)
        //осциляция
        snapBehavior?.damping = 0.9

        animator.addBehavior(snapBehavior!)
    }
    
    @objc func handleTap(paramTap: UITapGestureRecognizer){
 
//        UIView.animate(withDuration: 0.2, animations: {
//     self.squareView.center.x = paramTap.location(in: self.view).x
//        })

  
        //вариант ниже был в уроке. вариант выше это мой, он без колебаний, просто перемещение по прямой
        
//         получаем угол между центром квадрата view и точкой касания
        let tapPoint = paramTap.location(in: view)
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehavior?.damping = 0.9 // средняя осцилляция (колебания)
        animator.addBehavior(snapBehavior!)
    }
}
