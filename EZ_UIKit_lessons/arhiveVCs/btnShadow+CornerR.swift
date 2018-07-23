////
////  buttonShadowAndCornerR.swift
////  EZ_UIKit_lessons
////
////  Created by 1234 on 7/2/18.
////  Copyright © 2018 Sergey Riabinin. All rights reserved.
////
//
//import UIKit
//
//
//class buttonShadowAndCornerR: MyVC {
//
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let button = MyShrinkingButton(frame: CGRect(x: 100, y: 300, width: 200, height: 70))
//        button.setBackgroundImage(UIImage(named: "imgGray"), for: .normal)
//        button.setTitle("Button", for: .normal)
//        button.layer.cornerRadius = 5
//        button.layer.masksToBounds = true
//        view.addSubview(button)
//    }
//
//}
//
//
//class ShrinkinButtonWithShadow: UIButton {
//
//
//  /*
//    //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻 этот кусок создания тени{
//    override func draw(_ rect: CGRect) {
//        updateLayerProperties()
//    }
//    
//    func updateLayerProperties() {
//        let shadowLayer = CALayer()
//        shadowLayer.frame = self.frame
//        shadowLayer.shadowPath = UIBezierPath(roundedRect: CGRect(x: -100, y: -100, width: 150, height: 20       ), cornerRadius: 10).cgPath
//        shadowLayer.shadowOpacity = 0.8
//        shadowLayer.shadowRadius = 2
//        shadowLayer.masksToBounds = false
//        self.layer.insertSublayer(shadowLayer, at: 1)//.addSublayer(shadowLayer)
//        
//        
////        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
////        self.layer.shadowOffset = CGSize(width: 0, height: 3)
////        self.layer.shadowOpacity = 1.0
////        //   self.layer.shadowRadius = 10.0
////        self.layer.masksToBounds = false
//    }
//    //🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹}
//*/
//    
//    //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻а вот этот кусок для уменьшения при нажатии{
//    
//    override func backgroundRect(forBounds bounds: CGRect) -> CGRect {
//        var result = super.backgroundRect(forBounds:bounds)
//        if self.isHighlighted {
//            result = result.insetBy(dx: 3, dy: 3)
//            self.layer.cornerRadius = 30
//            self.layer.masksToBounds = true
//        }
//        return result
//    }
//    override var intrinsicContentSize : CGSize {
//        return super.intrinsicContentSize.sizeByDelta(dw:25, dh: 20)
//    }
//    
//    override func titleRect(forContentRect bounds: CGRect) -> CGRect {
//        var result = super.titleRect(forContentRect:bounds)
//        if self.isHighlighted {
//            result = result.insetBy(dx: 3, dy: 3)
//            self.layer.masksToBounds = true
//
//        }
//        else{
//        self.layer.masksToBounds = true
//        }
//        return result
//    }
//    
//    
//    //🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹}
//    
//    
//}
//
//extension CGSize {
//    func sizeByDelta(dw:CGFloat, dh:CGFloat) -> CGSize {
//        return CGSize(width:self.width + dw, height:self.height + dh)
//    }
//}
//class MyShrinkingButton: UIButton {
//    
//    override func backgroundRect(forBounds bounds: CGRect) -> CGRect {
//        var result = super.backgroundRect(forBounds:bounds)
//        if self.isHighlighted {
//            result = result.insetBy(dx: 3, dy: 3)
//        
//        }
//        return result
//    }
//    override var intrinsicContentSize : CGSize {
//        return super.intrinsicContentSize.sizeByDelta(dw:25, dh: 20)
//    }
//    
//    override func titleRect(forContentRect bounds: CGRect) -> CGRect {
//        var result = super.titleRect(forContentRect:bounds)
//        if self.isHighlighted {
//            result = result.insetBy(dx: 3, dy: 3)
//        }
//        return result
//    }
//    
//}
//
