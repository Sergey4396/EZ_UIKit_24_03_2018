//
//  VC22_11.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 12.05.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC22_11: MyVC {

    
    let squareView = UIView()
    var animator = UIDynamicAnimator()
    var tapGesture = UITapGestureRecognizer()
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        // создадим квадрат
    
//        makeNewSquareView(currentView: squareView, x: w50, y: h10)
//
//        tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
//        tapGesture.numberOfTapsRequired = 1
//        tapGesture.numberOfTouchesRequired = 1
//
//        squareView.addGestureRecognizer(tapGesture)
//        squareView.isUserInteractionEnabled = true
    
        scheduledTimerWithTimeInterval()
    }
    
    func fallViewDown(item: UIView){
         // создаем аниматор и тяготение
        animator = UIDynamicAnimator(referenceView: view)
        let gravity = UIGravityBehavior(items: [item])
        animator.addBehavior(gravity)
    }
    
    func makeNewSquareView(/*currentView: UIView, */x: CGFloat, y: CGFloat) -> UIView{
        // создадим квадрат
        let currentView = UIView()
        currentView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        currentView.backgroundColor = .green
        currentView.center = CGPoint(x: x, y: y)
        view.addSubview(currentView)
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        currentView.addGestureRecognizer(tapGesture)
        currentView.isUserInteractionEnabled = true
        return currentView
    }
    // при нажатии на квадрат происходит это
    @objc func myviewTapped(_ sender: UITapGestureRecognizer){
       
        if sender.view!.backgroundColor == .green{
         sender.view!.backgroundColor = .red
        }
        else{
        fallViewDown(item: sender.view!)
        }
    }

    //таймер для создания новых квадратиков
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(setNewRandomSquare), userInfo: nil, repeats: true)
    }
    
    @objc func setNewRandomSquare(){
        let _ = makeNewSquareView(x: getRandomIntFromXToY(first: w5, last: w95), y: getRandomIntFromXToY(first: h5, last: h40))

    }

    func getRandomIntFromXToY(first: CGFloat, last: CGFloat) -> CGFloat{
        let random = CGFloat(arc4random_uniform(UInt32(last - first)))
        let result = random + first
        return CGFloat(result)
    }
    
}
