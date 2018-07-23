//
//  NiseButtonwhithShadowVC.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 7/3/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class NiseButtonwhithShadowVC: MyVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // constants
        let radius: CGFloat = 20, dimension: CGFloat = 200, offset = 4
        let frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        // custom view
        let customView = ShrinkingButton2(frame: frame)
//        customView.contentMode = .scaleAspectFill
        customView.setTitle("Button", for: .normal)
        
        // image layer
        let imageLayer = CALayer()
 //       imageLayer.contentsGravity = kCAGravityResizeAspectFill
        //imageLayer.contents = UIImage(named: "imgGray")!.cgImage
        imageLayer.backgroundColor = UIColor.orange.cgColor
        imageLayer.masksToBounds = true
        imageLayer.frame = frame
        imageLayer.cornerRadius = radius
        imageLayer.masksToBounds = true
        
        // rounded layer
        let roundedLayer = CALayer()
        roundedLayer.shadowColor = UIColor.gray.cgColor
        roundedLayer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: dimension, height: 50), cornerRadius: radius).cgPath
        roundedLayer.shadowOffset = CGSize(width: offset, height: offset)
        roundedLayer.shadowOpacity = 0.5
        roundedLayer.shadowRadius = 2
        roundedLayer.frame = frame
        
        // views and layers hierarchy
        customView.layer.addSublayer(imageLayer)
        customView.layer.insertSublayer(roundedLayer, below: imageLayer)
        view.addSubview(customView)
        
        // layout
        customView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
 //       customView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
    }
    
}

class ShrinkingButton2: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.isHighlighted ? self.layer.setAffineTransform(CGAffineTransform(scaleX: 0.95, y: 0.95 )) :
                    self.layer.setAffineTransform(.identity)
            }
        }
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        layer.cornerRadius = 10
//
//        layer.shadowOffset = CGSize(width: -1, height: 2)
//        layer.shadowRadius = 5
//        layer.shadowOpacity = 0.5
//    }
}




// код отсюда изначально:
//
//  ListVC.swift
//  myExpenses2018
//
//  Created by 1234 on 6/29/18.
//  Copyright © 2018 1234. All rights reserved.
// две работающие версии кнопок с тенью и закруглением отсюда:
//https://stackoverflow.com/questions/3705687/cant-set-cornerradius-and-shadow-on-layer-that-has-an-image-view-stretched-to-i
//
//import UIKit
//
//class ViewController: MyVC {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // constants
//        let radius: CGFloat = 20, dimension: CGFloat = 200, offset = 8
//        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//
//        // custom view
//        let customView = MyShrinkingButton(frame: frame)
//        customView.contentMode = .scaleAspectFill
//        customView.setTitle("Button", for: .normal)
//
//        // image layer
//        let imageLayer = CALayer()
//        imageLayer.contentsGravity = kCAGravityResizeAspectFill
//        imageLayer.contents = UIImage(named: "grayImage")!.cgImage
//        imageLayer.masksToBounds = true
//        imageLayer.frame = frame
//        imageLayer.cornerRadius = radius
//        imageLayer.masksToBounds = true
//
//        // rounded layer
//        let roundedLayer = CALayer()
//        roundedLayer.shadowColor = UIColor.darkGray.cgColor
//        roundedLayer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: dimension, height: dimension), cornerRadius: radius).cgPath
//        roundedLayer.shadowOffset = CGSize(width: offset, height: offset)
//        roundedLayer.shadowOpacity = 0.8
//        roundedLayer.shadowRadius = 2
//        roundedLayer.frame = frame
//
//        // views and layers hierarchy
//        customView.layer.addSublayer(imageLayer)
//        customView.layer.insertSublayer(roundedLayer, below: imageLayer)
//        view.addSubview(customView)
//
//        // layout
//        customView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
//        customView.autoresizingMask = [UIViewAutoresizing.flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
//    }
//
//}
//
//



//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // constants
//        let radius: CGFloat = 20, dimension: CGFloat = 200, offset = 8
//
//        // image view
//        let imageView = UIImageView(image: UIImage(named: "grayImage"))
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = radius
//        imageView.layer.masksToBounds = true
//
//        // rounded view
//        let roundedView = UIView()
//        roundedView.layer.shadowColor = UIColor.darkGray.cgColor
//        roundedView.layer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: dimension, height: dimension), cornerRadius: radius).cgPath
//        roundedView.layer.shadowOffset = CGSize(width: offset, height: offset)
//        roundedView.layer.shadowOpacity = 0.8
//        roundedView.layer.shadowRadius = 2
//
//        // views hierarchy
//        roundedView.addSubview(imageView)
//        view.addSubview(roundedView)
//
//        // layout
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        roundedView.translatesAutoresizingMaskIntoConstraints = false
//        roundedView.widthAnchor.constraint(equalToConstant: dimension).isActive = true
//        roundedView.heightAnchor.constraint(equalToConstant: dimension).isActive = true
//        imageView.widthAnchor.constraint(equalTo: roundedView.widthAnchor).isActive = true
//        imageView.heightAnchor.constraint(equalTo: roundedView.heightAnchor).isActive = true
//        roundedView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        roundedView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: roundedView.centerYAnchor).isActive = true
//    }
//
//}
