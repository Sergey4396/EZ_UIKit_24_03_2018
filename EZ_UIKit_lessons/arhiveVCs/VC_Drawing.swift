//
//  VC_Drawing.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 6/19/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC_Drawing: MyVC {
    
    var canvasView: UIView!
//    var button: UIButton!
    
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvasView = UIView(frame: CGRect(x: 0, y: h20, width: w, height: h80))
        canvasView.backgroundColor = .lightGray
        view.addSubview(canvasView)
        

        canvasView.clipsToBounds = true
        canvasView.isMultipleTouchEnabled = false
        
//        button = ssButton(title: "clear", width: 40, height: 5, x: 50, y: 10)


    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView){
            startPoint = point
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: canvasView){
            touchPoint = point
        }
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        //call draw
        draw()
    }


    func draw(){
        let strokeLayer = CAShapeLayer()
        strokeLayer.fillColor = UIColor.black.cgColor
        strokeLayer.lineWidth = 15
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.path = path.cgPath
        canvasView.layer.addSublayer(strokeLayer)
        canvasView.layer.setNeedsDisplay()
        
    }
    

//    override func ffButton(sender: UIButton) {
//        path.removeAllPoints()
//        canvasView.layer.sublayers = nil
//        canvasView.setNeedsDisplay()
//    }

}
