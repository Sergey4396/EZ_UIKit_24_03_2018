import UIKit
class NiseButtonVC: UIViewController {
  
    var button = ShrinkingButton()
        var button2 = UIButton()
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            button = ShrinkingButton()
            button.bounds = CGRect(x: 0, y: 0, width: 200, height: 80)
    
            button.center = view.center
            button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    
    
            button.setTitle("button", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.backgroundColor = .orange
            button.setTitleColor(.white, for: .normal)
//            let backGroundImage = UIImage.from(color: .orange)
//            button.setBackgroundImage(backGroundImage, for: UIControlState())
            button.adjustsImageWhenHighlighted = false
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            view.addSubview(button)
         }
        @objc func buttonPressed(sender: UIButton){
            print("button pressed")
    
        }
    }


class ShrinkingButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) {
                self.isHighlighted ? self.layer.setAffineTransform(CGAffineTransform(scaleX: 0.9, y: 0.9 )) :
                    self.layer.setAffineTransform(.identity)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        layer.cornerRadius = 10

        layer.shadowOffset = CGSize(width: -1, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
    }
}













//1st variant

//class ShrinkingButton: UIButton {
//
//    override var isHighlighted: Bool {
//        didSet {
//            self.setNeedsLayout()
//            UIView.animate(withDuration: 0.1) {
//                self.layoutIfNeeded()
//            }
//        }
//    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        layer.cornerRadius = 10
//        layer.masksToBounds = true
//    }
//
//    override func layoutSubviews() {
//        super.layoutIfNeeded()
//
//        isHighlighted ? shrink() : extend()
//    }
//
//    private func shrink() {
//        layer.setAffineTransform(CGAffineTransform.init(scaleX: 0.9, y: 0.9 ))
//    }
//
//    private func extend() {
//        layer.setAffineTransform(.identity)
//    }
//}

/////





//import UIKit
//class NiseButtonVC: UIViewController {
//    var button = MyShrinkingButton()
//    var button2 = UIButton()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        button = MyShrinkingButton()
//        button.bounds = CGRect(x: 0, y: 0, width: 200, height: 80)
//
//        button.center = view.center
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//
//
//        button.setTitle("button", for: .normal)
//        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
//        button.titleLabel?.adjustsFontSizeToFitWidth = true
//        let backGroundImage = UIImage.from(color: .orange)
//        button.setBackgroundImage(backGroundImage, for: UIControlState())
//        button.adjustsImageWhenHighlighted = false
//        button.layer.cornerRadius = 10
//        button.layer.masksToBounds = true
//        view.addSubview(button)
//     }
//    @objc func buttonPressed(sender: UIButton){
//        print("button pressed")
//
//    }
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
//extension UIImage {
//    static func from(color: UIColor) -> UIImage {
//        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
//        UIGraphicsBeginImageContext(rect.size)
//        let context = UIGraphicsGetCurrentContext()
//        context!.setFillColor(color.cgColor)
//        context!.fill(rect)
//        let img = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return img!
//    }
//}

