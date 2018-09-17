////
////  DrawingVC_6.swift
////  EZ_UIKit_lessons
////
////  Created by 1234 on 9/18/18.
////  Copyright © 2018 Sergey Riabinin. All rights reserved.
////очень страрое, не уверен смогу ли адаптировать
////https://www.raywenderlich.com/1934-how-to-make-a-simple-drawing-app-with-uikit-and-swift
//
//import UIKit
//
//class DrawingVC_6: MyVC {
//
//    var tempImageView = UIImageView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//
//
//
//    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
//
//        // 1
//        UIGraphicsBeginImageContext(view.frame.size)
//        let context = UIGraphicsGetCurrentContext()
//        tempImageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
//
//        // 2
//        //CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
//        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
//
//        // 3
//        CGContextSetLineCap(context, kCGLineCapRound)
//        CGContextSetLineWidth(context, brushWidth)
//        CGContextSetRGBStrokeColor(context, red, green, blue, 1.0)
//        CGContextSetBlendMode(context, kCGBlendModeNormal)
//
//        // 4
//        CGContextStrokePath(context)
//
//        // 5
//        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
//        tempImageView.alpha = opacity
//        UIGraphicsEndImageContext()
//
//    }
//}
//
//
