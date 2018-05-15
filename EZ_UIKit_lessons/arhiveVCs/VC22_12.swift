//
//  VC22_12.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 14.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC22_12: MyVC {

    //    UISnapBehavior - снимок экрана
    
    var backButton = UIButton()
    var backButton2 : UIButton!
    var squareView = UIView()
    var tankTowerView = UIView()
    var barrelOfTankView = UIView()
    var bulletView = UIView()
    var targetView = UIView()
    var timer = Timer()
    
    
//    var animator = UIDynamicAnimator()
 //   var attachmentBehavior: UIAttachmentBehavior?
    override func viewDidLoad() {
        super.viewDidLoad()

        createGestureRecognizer()
        createSmallSquareView()
//        createAncorView()
//        createAnimationAndBehavior()
        createGestureRecognizerTap()
        scheduledTimerWithTimeInterval()
        makeTarget()
    setBackButton()
        
    }
    
    //кнопка назад прозрачная
    func setBackButton(){
        backButton = ssButton(title: "back", width: 15, height: 10, x: 15, y: 10)
        backButton.backgroundColor = .clear
        backButton.setTitleColor(.clear, for: .normal)
    }
    
    //создадим квадрат с башней
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: w50, y: h - 40, width: 70, height: 80))
        squareView.backgroundColor = .green
        squareView.center = CGPoint(x: w50, y: h - 45)
        
        barrelOfTankView = UIView(frame: CGRect(x: 30, y: 20, width: 10, height: -65))
        barrelOfTankView.backgroundColor = .gray
    
        
        tankTowerView = UIView(frame: CGRect(x: 15, y: 20, width: 40, height: 40))
        tankTowerView.backgroundColor = .darkGray
  //      tankTowerView.center = CGPoint(x: w50, y: h - 40)
        
        
        squareView.addSubview(tankTowerView)
        squareView.addSubview(barrelOfTankView)
        view.addSubview(squareView)
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
    
    
    // создадим мишень.
    func makeTarget(){
        targetView = UIView(frame: CGRect(x: w50, y: h - 40, width: 70, height: 80))
        targetView.backgroundColor = .green
        targetView.center = CGPoint(x: w15, y:  45)
        view.addSubview(targetView)
    }
 
    
    //создаем таймер для создания пули
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(makeNewBullet), userInfo: nil, repeats: true)
    }
    //создаем пулю
    @objc func makeNewBullet(){
        
        bulletView = UIView(frame: CGRect(x: 0, y: 105, width: 3, height: 3))
        bulletView.backgroundColor = .red
        bulletView.center.x = squareView.center.x
        bulletView.center.y = h - 130
        view.addSubview(bulletView)
        
        UIView.animate(withDuration: 1.5, animations: {
            self.bulletView.center.y = -h5
        })
        
    }
    
    
//    //создаем столкновение и прикрепление
//    func createAnimationAndBehavior(){
//        animator = UIDynamicAnimator(referenceView: view)
//        //столкновения
//        let collision = UICollisionBehavior(items: [squareView])
//        collision.translatesReferenceBoundsIntoBoundary = true
//        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
//        animator.addBehavior(collision)
//        animator.addBehavior(attachmentBehavior!)
//    }
    
    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "back"{
            goToVC(VC: InitViewController())
        }
    }
    
}


