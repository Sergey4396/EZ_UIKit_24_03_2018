//
//  DrawingVC_4.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 9/17/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class DrawingVC_4: MyVC {
    
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.showMoreActions(touch:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func showMoreActions(touch: UITapGestureRecognizer) {
        let touchPoint = touch.location(in: self.view)
        
        guard let _ = firstPoint else {
            firstPoint = touchPoint
            return
        }
        
        guard let _  = secondPoint else {
            secondPoint = touchPoint
            addLine(fromPoint: firstPoint!, toPoint: secondPoint!)
            
            firstPoint = nil
            secondPoint = nil
            
            return
        }
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        self.view.layer.addSublayer(line)
    }
}
