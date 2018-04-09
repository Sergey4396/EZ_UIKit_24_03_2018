//
//  VC17_3.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 09.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC17_3: MyVC, UIScrollViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imgArray : [UIImage] = []

    var myScrollView = UIScrollView()
    
    var imagePicker = UIImagePickerController()
    
    var imageViewRect : CGRect!
    
    var scrollViewRect : CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = ssButton(title: "new", width: 30, height: 5, x: 50, y: 94)
        
        let fryImage = UIImage(named: "fry")
        let simpsonImage = UIImage(named: "simpson")
        let benderImage = UIImage(named: "Bender")
        
        scrollViewRect = view.bounds
        //create scroll
        myScrollView = UIScrollView()
        myScrollView.contentSize = CGSize(width: w, height: h * 2)
        myScrollView.bounds = CGRect(x: 0, y: 0, width: w, height: h90)
        myScrollView.center = CGPoint(x: w50, y: h45)
        myScrollView.backgroundColor = .lightGray
        myScrollView.isPagingEnabled = true
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        view.addSubview(myScrollView)
        
        
        //      create fry
        imageViewRect = view.bounds
        guard let fry = fryImage else {return}
        let fryImageView = newIamgeVeiwWithImage(paramImage: fry, paramFrame: imageViewRect)
        myScrollView.addSubview(fryImageView)
        
        //        next page
        imageViewRect.origin.x += imageViewRect.size.width
        guard let simpson = simpsonImage else {return}
        let simpsonImageView = newIamgeVeiwWithImage(paramImage: simpson, paramFrame: imageViewRect)
        myScrollView.addSubview(simpsonImageView)
        
        //        next page
        
        imageViewRect.origin.x += imageViewRect.size.width
        guard let bender = benderImage else {return}
        let benderImageView = newIamgeVeiwWithImage(paramImage: bender, paramFrame: imageViewRect)
        myScrollView.addSubview(benderImageView)
        
    }
    
    func newIamgeVeiwWithImage(paramImage: UIImage, paramFrame: CGRect) -> UIImageView {
        let result = UIImageView(frame: paramFrame)
        result.contentMode = .scaleAspectFit
        result.image = paramImage
        return result
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        let image = info[UIImagePickerControllerOriginalImage] as! UIImage

        print(image)
        imgArray.append(image)
 
        imageViewRect.origin.x += imageViewRect.size.width
//        guard let newImg = image else {return}
        let newImageView = newIamgeVeiwWithImage(paramImage: image, paramFrame: imageViewRect)
        myScrollView.addSubview(newImageView)
        
        myScrollView.contentSize.width = myScrollView.contentSize.width + scrollViewRect.size.width
        
        dismiss(animated: true, completion: nil)
    }

    }


