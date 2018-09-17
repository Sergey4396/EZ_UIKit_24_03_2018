//
//  DrawingVC_5.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 9/17/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit


class DrawingVC_5: MyVC {

    let drawSize = w10
    var drawColor = UIColor.blue
    var myView: UIView!
    
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
//        let img = UIImage(named: "s1200")
//        let imgView = UIImageView(image: img)
//        imgView.frame = CGRect(x: 0, y: 0, width: w, height: h80)
//        imgView.contentMode = .scaleAspectFit
        
        //        view.addSubview(imgView)
        //       myView = DrawView3()
        //        myView.backgroundColor = .clear
        //        myView.tintColor = .clear
        
        //       let imgView = UIImageView(image: img)
        //        myView.addSubview(imgView)
        //        myView.frame = CGRect(x: 0, y: 0, width: w, height: h80)
        //       view.addSubview(myView)
        
        let _ = ssButton(title: "change", width: 10, height: 5, x: 10, y: 95)
        
      //  UIRectFill(CGRect(x: w50, y: h50, width: 1, height: 1))
        
        
        

        
        
        
        
    }
    
    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "change"{
            
            if drawColor == UIColor.blue{
                drawColor = .red//UIColor(patternImage: UIImage(named: "apple")!)//.red
            }
            else{
                drawColor = .blue
            }
            
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
       let location = touch.location(in:self.view)
        secondPoint = nil
        firstPoint = nil
        
        addCircle(x: location.x, y: location.y)
        
//                let x = UIView(frame: CGRect(x: 0, y: 0, width: w / 20, height: w / 20))
//                x.center = location
//                x.layer.cornerRadius = w / 40
//                x.backgroundColor = drawColor
//                view.addSubview(x)
        firstPoint = location
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for currentTouch in touches{
            let location = currentTouch.location(in:self.view)
            
            addCircle(x: location.x, y: location.y)
            
            guard let _ = firstPoint else {
                firstPoint = location
                return
            }
            secondPoint = location
            addLine(fromPoint: firstPoint!, toPoint: secondPoint!)
            firstPoint = location
            
            
            
//        let x = UIView(frame: CGRect(x: 0, y: 0, width: w / 20, height: w / 20))
//        x.center = location
//        x.layer.cornerRadius = w / 40
//        x.backgroundColor = drawColor
//        view.addSubview(x)
            
            
        }
     
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        secondPoint = nil
        firstPoint = nil
        
        
//          let touch = touches.first!
//        let location = touch.location(in:self.view)
//
//        let x = UIView(frame: CGRect(x: 0, y: 0, width: w / 20, height: w / 20))
//        x.center = location
//        x.layer.cornerRadius = w / 40
//        x.backgroundColor = .red
//        view.addSubview(x)
        
 //       print("end")
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
        
        let x = drawColor//UIColor.red//(patternImage: UIImage(named: "s1200")!)
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        linePath.fill()
        line.path = linePath.cgPath
        line.strokeColor = x.cgColor//UIColor.red.cgColor
        line.lineWidth = drawSize
        //line.lineJoin = kCALineJoinRound
        self.view.layer.addSublayer(line)
        
        //        let line2 = CAShapeLayer()
        //        let linePath2 = UIBezierPath()
        //        linePath2.move(to: CGPoint(x: start.x + 10, y: start.y + 10))//) start)
        //        linePath2.addLine(to: CGPoint(x: end.x + 10, y: end.y + 10))
        //        linePath2.fill()
        //        line2.path = linePath2.cgPath
        //        line2.strokeColor = x.cgColor//UIColor.red.cgColor
        //        line2.lineWidth = w/100
        //        //line.lineJoin = kCALineJoinRound
        //        self.view.layer.addSublayer(line2)
    }
    
    
    func addCircle(x: CGFloat, y: CGFloat){
    
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: x,y: y), radius: CGFloat(drawSize/2), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)

    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.cgPath
    
    //change the fill color
    shapeLayer.fillColor = drawColor.cgColor
    //you can change the stroke color
    shapeLayer.strokeColor = drawColor.cgColor
    //you can change the line width
    shapeLayer.lineWidth = 0.0
    
    view.layer.addSublayer(shapeLayer)
    }
    
}
