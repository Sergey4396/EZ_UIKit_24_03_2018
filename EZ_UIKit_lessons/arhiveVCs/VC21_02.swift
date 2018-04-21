//
//  VC21_02.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 22.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC21_02: MyVC {
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGestureRecognazer()
        createSmallSquareView()
        createAnimationAndBehaviors()
    }
// создаем квадрат
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    //создаем жест
    func createGestureRecognazer(){
        let tapGestureRecognazer = UITapGestureRecognizer(target: self, action: #selector(hendleTap(paramTap:)))
        view.addGestureRecognizer(tapGestureRecognazer)
    }
    
    //задаем столкновение и толчек у view
    
    func createAnimationAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        //создаем столкновение
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBehavior)
    }
    
    

    @objc func hendleTap(paramTap:UITapGestureRecognizer){
     //Получаем угол view
        let tapPoint : CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint: CGPoint = squareView.center
        //arc tangent 2((p1.x -p2.x), (p1.y -p2.y))
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angle: CGFloat = atan2(deltaY,deltaX)
        pushBehavior.angle = angle
        
        let distanceBetweenPoints: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehavior.magnitude = distanceBetweenPoints / 200
    }
}
