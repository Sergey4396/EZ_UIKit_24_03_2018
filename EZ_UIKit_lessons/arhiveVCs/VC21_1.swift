//
//  VC21_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 10.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC21_1: MyVC {
    var squareView = UIView()
    var circleView = UIView()
    var animator = UIDynamicAnimator()
    var animatorForCircle = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        createGestureRecognazer()
        createSmallSquareView()
        createSmallCircleView()
        createAnimationAndBehaviors()
        gravityForCircleView()
    }
    // создаем квадрат
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        
        // двумя следующими строчками создаем квадрат
//        squareView.layer.masksToBounds = true
//        squareView.layer.cornerRadius = 40
        
        view.addSubview(squareView)
        
    }
  
    // создаем круг но не используем
    func createSmallCircleView(){
        
        let width:CGFloat = UIScreen.main.bounds.width*0.0533
        circleView = UIView(frame: CGRect(x:0, y:0, width:width, height:width))
        
     
        circleView.backgroundColor = .red
        circleView.center = CGPoint(x: 100, y: 100)
        circleView.layer.masksToBounds = true
        circleView.layer.cornerRadius = width/2
        view.addSubview(circleView)
        
//        circleView.layer.masksToBounds = true
//        circleView.layer.cornerRadius = width/2
    }
    

    func gravityForCircleView(){
        // создаем аниматор и тяготение
        animatorForCircle = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [circleView])
        animatorForCircle.addBehavior(gravity)
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
        let collision = UICollisionBehavior(items: [squareView, circleView])
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
