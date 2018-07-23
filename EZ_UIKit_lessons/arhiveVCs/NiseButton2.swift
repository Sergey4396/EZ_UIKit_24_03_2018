//
//  NiseButton2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 7/3/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class NiseButton2VC: MyVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let d = ssButton(title: "titlew", width: 80, height: 10, x: 50, y: 20)
        d.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        
        let title = "Title"
        let fontSize : CGFloat = 25
        let titleColor = UIColor.red
        let backgroundColor = UIColor.orange
        let x : CGFloat = w50
        let y : CGFloat = h50
        let width : CGFloat = 200
        let height : CGFloat = 50
        let cornerRadius : CGFloat = 10
        let shadowOffset : CGFloat = 2
        let shadowRadius : CGFloat = 2
        let shadowOpacity : Float = 0.9
        
        // constants
    
//        let radius: CGFloat = cornerRadius
//        let dimension: CGFloat = width
//        let offset = shadowOffset
        let frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        // custom view
        let currentButton = ShrinkingButton3(frame: frame)
        //        customView.contentMode = .scaleAspectFill

 //       currentButton.titleLabel?.font = currentButton.titleLabel?.font.withSize(20)
//        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true//UIFont.systemFontSize    //UIFont.systemFont(ofSize: 40) //UIFont.systemFont(ofSize: fontSize)

        
        // image layer
        let imageLayer = CALayer()
        //       imageLayer.contentsGravity = kCAGravityResizeAspectFill
        //imageLayer.contents = UIImage(named: "imgGray")!.cgImage
        imageLayer.backgroundColor = backgroundColor.cgColor
        imageLayer.masksToBounds = true
        imageLayer.frame = frame
        imageLayer.cornerRadius = cornerRadius
  //      imageLayer.masksToBounds = true
        
        // rounded layer
        let roundedLayer = CALayer()
        roundedLayer.shadowColor = UIColor.gray.cgColor
        roundedLayer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: width, height: height), cornerRadius: cornerRadius).cgPath
        roundedLayer.shadowOffset = CGSize(width: shadowOffset, height: shadowOffset)
        roundedLayer.shadowOpacity = shadowOpacity
        roundedLayer.shadowRadius = shadowRadius
        roundedLayer.frame = frame
        
        // views and layers hierarchy
        currentButton.layer.addSublayer(imageLayer)
        currentButton.layer.insertSublayer(roundedLayer, below: imageLayer)
        view.addSubview(currentButton)
        
        // layout
        currentButton.center = CGPoint(x: x, y: y)
  //             currentButton.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        
        currentButton.setTitle(title, for: .normal)
        currentButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        currentButton.setTitleColor(titleColor, for: .normal)
    }
    
}

class ShrinkingButton3: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
 //           UIView.animate(withDuration: 0.5) {
                self.isHighlighted ? self.layer.setAffineTransform(CGAffineTransform(scaleX: 0.98, y: 0.98 )) :
                    self.layer.setAffineTransform(.identity)
//            }
        }
}
}
