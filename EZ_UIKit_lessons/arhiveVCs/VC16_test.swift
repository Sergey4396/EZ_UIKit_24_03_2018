

import UIKit

class VC16_test: MyVC, UIGestureRecognizerDelegate {

    var imageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        

       let tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.delegate = self

        imageView = ssImageView(image: "fry", y: 50, width: 80, height: 80)
        imageView.addGestureRecognizer(tapGesture)
        view.isUserInteractionEnabled = true
        imageView.isUserInteractionEnabled = true

//        imageView = ssImageViewWithRecognizer(image: "fry", y: 50, width: 80, height: 80, tapGestureRecognizer: tapGesture)
        //        imageView.addGestureRecognizer(tapGesture)
        
        
//        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width/2.0, height: self.view.frame.size.height/2.0))
//        self.imageView.isUserInteractionEnabled = true
//        self.imageView.backgroundColor = UIColor.red
//        self.imageView.layer.masksToBounds = true
//        self.imageView.layer.cornerRadius = self.imageView.frame.size.width / 2
//        self.imageView.clipsToBounds = true
//        self.imageView.addGestureRecognizer(tapGesture)
//        self.view.addSubview(self.imageView)
    }

    @objc func myviewTapped(_ sender: UITapGestureRecognizer) {
        print("tap")
        if self.imageView.backgroundColor == UIColor.yellow {
            self.imageView.backgroundColor = UIColor.green
        }else{
            self.imageView.backgroundColor = UIColor.yellow
        }
    }


}
