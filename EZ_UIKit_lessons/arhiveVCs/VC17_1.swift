//
//  VC17_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 07.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//
import UIKit


class VC17_1: MyVC, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
 var imageView: UIImageView!
 var chooseBuuton: UIButton!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView()
        imageView.bounds = CGRect(x: 0, y: 0, width: w, height: h * 0.5)
        imageView.center = CGPoint(x: w50, y: h30)
        view.addSubview(imageView)
        imageView.backgroundColor = .lightGray
     chooseBuuton = ssButton(title: "choose", width: 20, height: 7, x: 50, y: 90)
    }
    
   
    override func ffButton(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    

    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo:  [NSObject: AnyObject]!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        print(image)
        imageView.image = image
    }
}
