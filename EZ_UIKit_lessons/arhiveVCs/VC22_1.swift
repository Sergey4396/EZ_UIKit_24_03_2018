//
//  VC22_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 11.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC22_1: MyVC {

    //    UISnapBehavior - снимок экрана
    
    var squareView = UIView()
    var squareViewAnnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior?
    override func viewDidLoad() {
        super.viewDidLoad()
        createGestureRecognizer()
        createSmallSquareView()
        createAncorView()
        createAnimationAndBehavior()
        createGestureRecognizerTap()
        
    }
    
    //создадим квадрат и в нем еще один
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = .green
        squareView.center = view.center
        squareViewAnnchorView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
        squareViewAnnchorView.backgroundColor = .brown
        squareView.addSubview(squareViewAnnchorView)
        view.addSubview(squareView)
    }
    
    //view с точкой привязки
    
    func createAncorView(){
        anchorView = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
        anchorView.backgroundColor = .red
        view.addSubview(anchorView)
    }
    
    //создадим регистратор жеста панорамирования
    
    func createGestureRecognizer(){
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(paramPan:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    //создаем метод селектора. Определяет где палец туда красный квадрат а потом привязка к большому
    @objc func handlePan(paramPan: UIPanGestureRecognizer){
        let tapPoint = paramPan.location(in: view)
        print(tapPoint)
//        attachmentBehavior?.anchorPoint = tapPoint
//        anchorView.center = tapPoint
        squareView.center.x = tapPoint.x
        
        
    }
    
    // создадим регистратор прикосновения
    func createGestureRecognizerTap(){
   //      let t = UITapGestureRecognizer
        let tap = UILongPressGestureRecognizer(target: self, action: #selector(handleTap(paramTap: )))
        view.addGestureRecognizer(tap)
    }
    // создадим функцию которая вызывается по тапу.
    @objc func handleTap(paramTap: UIGestureRecognizer){
        
        UIView.animate(withDuration: 0.1, animations: {
            self.squareView.center.x = paramTap.location(in: self.view).x
        })     

    }

    
    //создаем столкновение и прикрепление
    func createAnimationAndBehavior(){
        animator = UIDynamicAnimator(referenceView: view)
        //столкновения
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehavior!)
    }
    
}

