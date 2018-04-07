//
//  VC16_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 05.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

var currentCartoonImageName: String!

    var myImage: UIImage!

class VC16_1: MyVC {
    var imgV1 = UIImageView()
    var imgV2 = UIImageView()
    var imgV3 = UIImageView()
    var imgV4 = UIImageView()
    var imgV5 = UIImageView()
    var imgV0 = UIImageView()
        var selectedImage: UIImageView?
    
var tapGesture = UITapGestureRecognizer()
    var tapGesture1 = UITapGestureRecognizer()
    var tapGesture2 = UITapGestureRecognizer()
    var tapGesture3 = UITapGestureRecognizer()
    var tapGesture4 = UITapGestureRecognizer()
    var tapGesture5 = UITapGestureRecognizer()

    let imgNamesArray = ["fry","Фрай","Bender","fry panic","simpson","pooh",]
//    let imgArray : [UIImageView] = [imgV0,imgV1,imgV2,imgV3,imgV4,imgV5]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        
        tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture1.numberOfTapsRequired = 1
        tapGesture1.numberOfTouchesRequired = 1

        tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture2.numberOfTapsRequired = 1
        tapGesture2.numberOfTouchesRequired = 1

        tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture3.numberOfTapsRequired = 1
        tapGesture3.numberOfTouchesRequired = 1

        tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture4.numberOfTapsRequired = 1
        tapGesture4.numberOfTouchesRequired = 1

        tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(myviewTapped(_:)))
        tapGesture5.numberOfTapsRequired = 1
        tapGesture5.numberOfTouchesRequired = 1
        
        
//makeImages()
        imgV0 = ssImageView(image: imgNamesArray[0], y: 25, x: 25, width: 50, height: 35, tag: 0)
        
        imgV1 = ssImageView(image: imgNamesArray[1], y: 25, x: 75, width: 50, height: 35, tag: 1)

        imgV2 = ssImageView(image: imgNamesArray[2], y: 50, x: 25, width: 50, height: 35, tag: 2)
        imgV3 = ssImageView(image: imgNamesArray[3], y: 50, x: 75, width: 50, height: 35, tag: 3)
        imgV4 = ssImageView(image: imgNamesArray[4], y: 75, x: 25, width: 50, height: 35,  tag: 4)
        imgV5 = ssImageView(image: imgNamesArray[5], y: 75, x: 75, width: 50, height: 35,  tag: 5)
        imgV0.addGestureRecognizer(tapGesture)
        imgV1.addGestureRecognizer(tapGesture1)
        imgV0.isUserInteractionEnabled = true
        imgV1.isUserInteractionEnabled = true
        
        imgV2.addGestureRecognizer(tapGesture2)
        imgV3.addGestureRecognizer(tapGesture3)
        imgV2.isUserInteractionEnabled = true
        imgV3.isUserInteractionEnabled = true
        
        imgV4.addGestureRecognizer(tapGesture4)
        imgV5.addGestureRecognizer(tapGesture5)
        imgV4.isUserInteractionEnabled = true
        imgV5.isUserInteractionEnabled = true
        
//        imgV0.addGestureRecognizer(tapGesture)
//        imgV1.addGestureRecognizer(createTap())
//        imgV2.addGestureRecognizer(createTap())
//        imgV3.addGestureRecognizer(createTap())
//        imgV4.addGestureRecognizer(createTap())
//        imgV5.addGestureRecognizer(createTap())
//
//        print("imgV3.tag = \(imgV3.tag)")
//        print("imgV3.image = \(imgV3.image)")
//        print("imgV4.image = \(imgV4.image)")
//        imgV3.tag = 3
//        print("imgV3.tag = \(imgV3.tag)")
        

    }

//    func makeImages(){
//
//        for i in 0...imgNamesArray.count - 1{
//            print("🅰️")
//
//       let x = CGFloat(25 + 50 * (i % 2))
//
//      let y = CGFloat(25 + 25 * (i / 2))
//                         print("x = \(x)")
//                         print("y = \(y)")
//            let _ = ssImageView(image: imgNamesArray[i], y: y, x: x, width: 40, height: 30, tapGestureRecognizer: createTap(), tag: i)
//
//            print("i = \(i)")
//        }
//
//    }
    
//     @objc func myviewTapped(_ sender:UITapGestureRecognizer){
//        guard let x = sender.view?.tag else {print("out of range"); return}
//
//        print("sender.view?.tag = \(sender.view?.tag ?? 999)")
//        currentCartoonImageName = imgNamesArray[x]
//
//        selectedImage = sender.view as? UIImageView
//           print("tag = \(selectedImage?.tag)")
//        myImage = selectedImage?.image
//
//        goToVC(VC: VC16_2())
//
//        print("selectedImage.image = \(selectedImage?.image)")
//        print("boo")
//    }
    
//    func createTap() -> UITapGestureRecognizer {
//        let tap = UITapGestureRecognizer(target: self, action: #selector(myviewTapped))
//        return tap
//    }
    
    @objc func myviewTapped(_ sender: UITapGestureRecognizer){
        print("myviewTapped")
//        print(sender.view?.tag)
        currentCartoonImageName = imgNamesArray[(sender.view?.tag)!]

        goToVC(VC: VC16_2())

    }
//    @objc func myviewTapped1(_ sender: UITapGestureRecognizer){
//        print("myviewTapped1")
//        print(sender.view?.tag)
//        currentCartoonImageName = imgNamesArray[1]
//
//        goToVC(VC: VC16_2())
//
//    }
//    @objc func myviewTapped2(_ sender: UITapGestureRecognizer){
//        print(sender.view?.tag)
//        currentCartoonImageName = imgNamesArray[2]
//
//        goToVC(VC: VC16_2())
//
//    }


}

