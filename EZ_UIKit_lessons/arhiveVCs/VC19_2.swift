
import UIKit

final class VC19_2: MyVC {
    
   private var imgV0 = UIImageView()
   private var imgV1 = UIImageView()
   private var imgV2 = UIImageView()
   private var imgV3 = UIImageView()

//    static var xx : Int = 777
   private let imgNamesArray = ["fry", "Bender", "simpson", "pooh",]
    

    private var tapGesture0 = UITapGestureRecognizer()
    private var tapGesture1 = UITapGestureRecognizer()
    private var tapGesture2 = UITapGestureRecognizer()
    private var tapGesture3 = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        
        tapGesture0 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture0.numberOfTapsRequired = 1
        tapGesture0.numberOfTouchesRequired = 1
        
        tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.numberOfTouchesRequired = 1

        tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1
        
        tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1

        
        imgV0 = ssImageView(image: imgNamesArray[0], y: 25, x: 25, width: 40, height: 30, tag: 0)
        imgV1 = ssImageView(image: imgNamesArray[1], y: 25, x: 75, width: 40, height: 30, tag: 1)
        imgV2 = ssImageView(image: imgNamesArray[2], y: 75, x: 25, width: 40, height: 30, tag: 2)
        imgV3 = ssImageView(image: imgNamesArray[3], y: 75, x: 75, width: 40, height: 30, tag: 3)

        
        imgV0.addGestureRecognizer(tapGesture0)
        imgV1.addGestureRecognizer(tapGesture1)
        imgV2.addGestureRecognizer(tapGesture2)
        imgV3.addGestureRecognizer(tapGesture3)
        
        imgV0.isUserInteractionEnabled = true
        imgV1.isUserInteractionEnabled = true
        imgV2.isUserInteractionEnabled = true
        imgV3.isUserInteractionEnabled = true
        
//        imgV0.center = CGPoint(x: -500, y: -500)
        
        
      let defaults = UserDefaults.standard
        
        
        
        print(defaults.integer(forKey: "Age"))
    }

    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer){
        print("myviewTapped")
print("(sender.view?.tag)! = \((sender.view?.tag)!)")
       let defaults = UserDefaults.standard
        defaults.set((sender.view?.tag)!, forKey: "ImageNameNomber")
        print("‼️🅰️defaults.integer(forKey: \"ImageNameNomber\") = \( defaults.integer(forKey: "ImageNameNomber"))")

        
        goToVC(VC: VC19_1())
        
    }

}
