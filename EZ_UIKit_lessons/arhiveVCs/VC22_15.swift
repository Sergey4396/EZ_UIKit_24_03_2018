//
//  VC22_15.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 15.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC22_15: MyVC, UICollisionBehaviorDelegate {


 
    
    var backButton = UIButton()
    var backButton2 : UIButton!
    var squareView = UIView()
    var tankTowerView = UIView()
    var barrelOfTankView = UIView()
    var bulletView = UIView()
    var targetView = UIView()
    var timer = Timer()
    var bulletDynamicViews = [UIDynamicItem]()
    var targetDynamicViews = [UIDynamicItem]()
    var allDynamicViews = [UIDynamicItem]()
    
    
    var animator = UIDynamicAnimator()
    var collision = UICollisionBehavior()
    var gravity = UIGravityBehavior()
    var bulletAttachmentBehavior: UIAttachmentBehavior?
    
        var attachmentBehavior: UIAttachmentBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
       animator = UIDynamicAnimator(referenceView: view)
        createGestureRecognizer()
        createSmallSquareView()
        
        createGestureRecognizerTap()
        scheduledTimerWithTimeInterval()
//        makeTarget()
  targetScheduledTimerWithTimeInterval()
        
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
    
    // создадим коллизию
    func setCollisionBevior(){
        
        let collision = UICollisionBehavior(items: allDynamicViews)

        collision.translatesReferenceBoundsIntoBoundary = true
        
        //       collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, for: UIBezierPath(rect: greenView.frame))
        collision.collisionDelegate = self
        

      //еще добавим границу, для столкновений
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: 0), to: CGPoint(x: w, y: 0))
        
        //       animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(collision)
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
    

    //создаем таймер для создания мишени
    func targetScheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(makeTarget), userInfo: nil, repeats: true)
    }
    
    // создадим мишень.
    @objc func makeTarget(){
        
        targetView = UIView(frame: CGRect(x: w15, y: h - 40, width: 70, height: 80))
        targetView.backgroundColor = .green
        targetView.center = CGPoint(x: getRandomIntFromXToY(first: w10, last: w90), y:  50)
        
        barrelOfTankView = UIView(frame: CGRect(x: 30, y: 60, width: 10, height: 65))
        barrelOfTankView.backgroundColor = .gray
        
        
        tankTowerView = UIView(frame: CGRect(x: 15, y: 20, width: 40, height: 40))
        tankTowerView.backgroundColor = .darkGray
        //      tankTowerView.center = CGPoint(x: w50, y: h - 40)
        
        
        targetView.addSubview(tankTowerView)
        targetView.addSubview(barrelOfTankView)
        
        
        view.addSubview(targetView)
        
        targetDynamicViews.append(targetView)
        

        attachmentBehavior = UIAttachmentBehavior(item: targetView, attachedToAnchor: view.center)
        attachmentBehavior?.anchorPoint = CGPoint(x: targetView.center.x, y: h * 2)
        attachmentBehavior?.length = 100
        attachmentBehavior?.frequency = 1
        attachmentBehavior?.damping = 50
        animator.addBehavior(attachmentBehavior!)
        
//        let gravity2 = UIGravityBehavior(items: targetDynamicViews)
//        gravity2.setAngle(CGFloat.pi / 2, magnitude: 0.1)
//        animator.addBehavior(gravity2)
        
        

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
        
        bulletDynamicViews = []
        bulletDynamicViews.append(bulletView)
        
        
        allDynamicViews = []

        allDynamicViews = bulletDynamicViews + targetDynamicViews

        view.addSubview(bulletView)

        
//        animator = UIDynamicAnimator(referenceView: view)
        
// хорошая была функция но пожалуй UIAttachmentBehavior тут будет правильнее
//        gravity = UIGravityBehavior(items: bulletDynamicViews)
//        gravity.setAngle(-CGFloat.pi / 2, magnitude: 4)
//        animator.addBehavior(gravity)
        
        bulletAttachmentBehavior = UIAttachmentBehavior(item: bulletView, attachedToAnchor: view.center)
        bulletAttachmentBehavior?.anchorPoint = CGPoint(x: bulletView.center.x, y: -h)
        bulletAttachmentBehavior?.length = 1
        bulletAttachmentBehavior?.frequency = 20
        bulletAttachmentBehavior?.damping = 50
        animator.addBehavior(bulletAttachmentBehavior!)
        
        
        
//        setCollisionBevior()
        collision = UICollisionBehavior(items: allDynamicViews)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        
        //       collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, for: UIBezierPath(rect: greenView.frame))
        collision.collisionDelegate = self
        
        
        //еще добавим границу, для столкновений
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying, from: CGPoint(x: 0, y: -1), to: CGPoint(x: w, y: -1))
        
        //       animator = UIDynamicAnimator(referenceView: view)
        animator.addBehavior(collision)

        
        
        
        
//        UIView.animate(withDuration: 1.5, animations: {
//            self.bulletView.center.y = -h5
//        })
        
    }
    
    
    
    //функция для появления случайных координат
    func getRandomIntFromXToY(first: CGFloat, last: CGFloat) -> CGFloat{
        let random = CGFloat(arc4random_uniform(UInt32(last - first)))
        let result = random + first
        return CGFloat(result)
    }
    
    
    
    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "back"{
            goToVC(VC: InitViewController())
        }
    }
    
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item1: UIDynamicItem, with item2: UIDynamicItem, at p: CGPoint) {
        print("что-то происходит")
        
        
        //self.animator.removeAllBehaviors()
        self.animator.removeBehavior(collision)
        self.animator.removeBehavior(bulletAttachmentBehavior!)

        allDynamicViews = []
        bulletDynamicViews = []
 //       targetDynamicViews.remove(
  
        //объяснение почему эта хрень должна работать по другому
        //https://stackoverflow.com/questions/44485191/swift-4-cannot-invoke-index-with-an-argument-list-of-type
        if let index = (self.targetDynamicViews as! [UIView]).index(of: item2 as! UIView) {
            targetDynamicViews.remove(at: index)
            //просто для красоты пуля изчезает из виду
            (item1 as! UIView).alpha = 0
        }
        if let index = (self.targetDynamicViews as! [UIView]).index(of: item1 as! UIView) {
            targetDynamicViews.remove(at: index)
            //просто для красоты пуля изчезает из виду
            (item2 as! UIView).alpha = 0
        }
        
//        UIView.animate(withDuration: 2, animations: {
//            let view = item1 as? UIView
//            view?.backgroundColor = .black
//            view?.removeFromSuperview()
//            let view2 = item2 as? UIView
//            view2?.backgroundColor = .black
//            view2?.removeFromSuperview()
//        })
        //
                UIView.animate(withDuration: 1.0, animations: {
                    let view = item1 as? UIView
                    view?.backgroundColor = .red
                    view?.alpha = 0.0
                    view?.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
                    let view2 = item2 as? UIView
                    view2?.backgroundColor = .blue
                    view2?.alpha = 0.0
                    view2?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                    
        
                }, completion: { (finished) in
                    let view = item1 as? UIView
                    behavior.removeItem(item1)
                    view?.removeFromSuperview()
                    let view2 = item2 as? UIView
                    behavior.removeItem(item2)
                    view2?.removeFromSuperview()
                })






    }
    
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let identifier = identifier as? String
        let kbottomBoundary = "bottomBoundary"
        
        if identifier == kbottomBoundary{

            
                            let view = item as? UIView
                            behavior.removeItem(item)
                            view?.removeFromSuperview()
//            UIView.animate(withDuration: 1.0, animations: {
//                let view = item as? UIView
//                view?.backgroundColor = .red
//                view?.alpha = 0.0
//                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            }, completion: { (finished) in
//                let view = item as? UIView
//                behavior.removeItem(item)
//                view?.removeFromSuperview()
//
//            })
            
            
        }
    }

}
