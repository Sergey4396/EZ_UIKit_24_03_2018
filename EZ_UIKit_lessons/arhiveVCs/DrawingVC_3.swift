//
//  DrawingVC_3.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 7/23/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
var myView3: UIView!
class DrawingVC_3: MyVC {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = DrawView3()
        myView.frame = CGRect(x: 0, y: 0, width: w, height: h80)
        view.addSubview(myView)
    }
    
    
}

class DrawView3: UIView {
    
    var touch : UITouch!
    var lineArray : [[CGPoint]] = [[CGPoint]()]
    var index = -1
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch = touches.first! as UITouch
        let lastPoint = touch.location(in: self)
        //my addition
        self.setNeedsDisplay()
        //
        
        index += 1
        lineArray.append([CGPoint]())
        lineArray[index].append(lastPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch = touches.first! as UITouch
        let currentPoint = touch.location(in: self)
        
        self.setNeedsDisplay()
        
        lineArray[index].append(currentPoint)
        
    }
    
    override func draw(_ rect: CGRect) {
        
        if(index >= 0){
            let context = UIGraphicsGetCurrentContext()
            context!.setLineWidth(5)
            context!.setStrokeColor((UIColor(red:0.00, green:0.38, blue:0.83, alpha:1.0)).cgColor)
            context!.setLineCap(.round)
            
            var j = 0
            while( j <= index ){
                context!.beginPath()
                var i = 0
                context?.move(to: lineArray[j][0])
                while(i < lineArray[j].count){
                    context?.addLine(to: lineArray[j][i])
                    i += 1
                }
                
                context!.strokePath()
                j += 1
                
            }
            
            
        }
        
        
    }
}

