//
//  DrawingVC_3.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 7/23/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit


class DrawingVC_3: MyVC {
 var myView: UIView!
    var drawColor = UIColor.blue
    var firstPoint: CGPoint?
    var secondPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        let img = UIImage(named: "s1200")
        let imgView = UIImageView(image: img)
        imgView.frame = CGRect(x: 0, y: 0, width: w, height: h80)
        imgView.contentMode = .scaleAspectFit
//        view.addSubview(imgView)
 //       myView = DrawView3()
//        myView.backgroundColor = .clear
//        myView.tintColor = .clear

 //       let imgView = UIImageView(image: img)
//        myView.addSubview(imgView)
//        myView.frame = CGRect(x: 0, y: 0, width: w, height: h80)
 //       view.addSubview(myView)
        
        let _ = ssButton(title: "change", width: 10, height: 5, x: 10, y: 95)
        
        UIRectFill(CGRect(x: w50, y: h50, width: 1, height: 1))
    }
   
    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "change"{
        
            if drawColor == UIColor.blue{
                drawColor = .red
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
//        let x = UIView(frame: CGRect(x: 0, y: 0, width: w / 50, height: w / 50))
//        x.center = location
//        x.layer.cornerRadius = w / 100
//        x.backgroundColor = .red
//        view.addSubview(x)
                //
        
            }
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           
    
            for currentTouch in touches{
                let location = currentTouch.location(in:self.view)
               
                guard let _ = firstPoint else {
                    firstPoint = location
                    return
                }
                secondPoint = location
                addLine(fromPoint: firstPoint!, toPoint: secondPoint!)
                firstPoint = location
                
                
                
//                let x = UIView(frame: CGRect(x: 0, y: 0, width: w / 50, height: w / 50))
//                x.center = location
//                x.layer.cornerRadius = w / 100
//                x.backgroundColor = .red
//                view.addSubview(x)
            }
            
            
            func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
                secondPoint = nil
                firstPoint = nil
            }
//            func touchesEnded(_: Set<UITouch>, with: UIEvent?){
//                secondPoint = nil
//                firstPoint = nil
//            }
    
            
    
        }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
      
        let context = UIGraphicsGetCurrentContext()
        
        let x = UIColor(patternImage: UIImage(named: "s1200")!)
        
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        
        
        
        
        linePath.lineWidth = w/50
 //       linePath.lineJoinStyle = .miter
        linePath.addClip()
        linePath.fill()
        linePath.lineCapStyle = .butt
        
        
        
        linePath.move(to: start)
        linePath.addLine(to: end)
        linePath.lineCapStyle = .round
        linePath.stroke(with: CGBlendMode.normal, alpha: 1)
        
        linePath.fill()
        line.path = linePath.cgPath
        line.strokeColor = x.cgColor//UIColor.red.cgColor
        
        
        //line.speed = 200
     line.miterLimit = 10
        //line.fillRule = kCAFillRuleEvenOdd
        line.shouldRasterize = true
        line.fillColor = x.cgColor
        
        
        
        
        
        line.lineWidth = w/50
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
    


    
}

//class DrawView3: UIView {
//
//
//    init() {
//        super.init(frame: CGRect(x: 0, y: 0, width: w, height: h90))
//        self.backgroundColor = .clear
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    var touch : UITouch!
//    var lineArray : [[CGPoint]] = [[CGPoint]()]
//    var index = -1
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touch = touches.first! as UITouch
//        let lastPoint = touch.location(in: self)
//        //my addition
//        self.setNeedsDisplay()
//        //
//
//        index += 1
//        lineArray.append([CGPoint]())
//        lineArray[index].append(lastPoint)
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touch = touches.first! as UITouch
//        let currentPoint = touch.location(in: self)
//
//        self.setNeedsDisplay()
//
//        lineArray[index].append(currentPoint)
//
//    }
//
//    override func draw(_ rect: CGRect) {
//
//        if(index >= 0){
//            let context = UIGraphicsGetCurrentContext()
//            context!.setLineWidth(15)
//            context!.setStrokeColor((drawColor).cgColor)
//            context!.setLineCap(.round)
//
//            var j = 0
//            while( j <= index ){
//                context!.beginPath()
//                var i = 0
//                context?.move(to: lineArray[j][0])
//                while(i < lineArray[j].count){
//                    context?.addLine(to: lineArray[j][i])
//                    i += 1
//                }
//
//                context!.strokePath()
//                j += 1
//
//            }
//
//
//        }
//
//
//    }
//}

