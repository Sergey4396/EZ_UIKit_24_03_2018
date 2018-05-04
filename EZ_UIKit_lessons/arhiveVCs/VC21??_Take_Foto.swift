//
//  VC21??_Take_Foto.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 23.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

//‼️ must be marked in info.plist!!!
// Обязательно должно быть указано об использовании камеры в info.plist!!!
class VC21___Take_Foto: MyVC, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var imageView : UIImageView!
    var button : UIButton!
    var imagePicker : UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = ssImageView(image: "fry", y: 40, width: 100, height: 80)
        button = ssButton(title: "foto", width: 20, height: 8, x: 50, y: 92)
        let _ = ssButton(title: "crapping", width: 20, height: 8, x: 75, y: 92)

        // Do any additional setup after loading the view.
    }

    override func ffButton(sender: UIButton) {
    
        if sender.titleLabel?.text == "foto"{
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        
        self.present(imagePicker, animated: true, completion:nil)

        }
        else{
          imageView.image = imageView.image?.crop(to: CGSize(width: w20, height: w20) )
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        imagePicker.dismiss(animated: true, completion: nil)
//        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        var image : UIImage!
        
        if let img = info[UIImagePickerControllerEditedImage] as? UIImage
        {
            image = img
            
        }
        else if let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            image = img
        }
        imageView.image = image
        
        picker.dismiss(animated: true,completion: nil)
    }

}

extension UIImage {
    
    func crop(to:CGSize) -> UIImage {
        guard let cgimage = self.cgImage else { return self }
        
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        
        let contextSize: CGSize = contextImage.size
        
        //Set to square
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        let cropAspect: CGFloat = to.width / to.height
        
        var cropWidth: CGFloat = to.width
        var cropHeight: CGFloat = to.height
        
        if to.width > to.height { //Landscape
            cropWidth = contextSize.width
            cropHeight = contextSize.width / cropAspect
            posY = (contextSize.height - cropHeight) / 2
        } else if to.width < to.height { //Portrait
            cropHeight = contextSize.height
            cropWidth = contextSize.height * cropAspect
            posX = (contextSize.width - cropWidth) / 2
        } else { //Square
            if contextSize.width >= contextSize.height { //Square on landscape (or square)
                cropHeight = contextSize.height
                cropWidth = contextSize.height * cropAspect
                posX = (contextSize.width - cropWidth) / 2
            }else{ //Square on portrait
                cropWidth = contextSize.width
                cropHeight = contextSize.width / cropAspect
                posY = (contextSize.height - cropHeight) / 2
            }
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)
        // Create bitmap image from context using the rect
        let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        UIGraphicsBeginImageContextWithOptions(to, true, self.scale)
        cropped.draw(in: CGRect(x: 0, y: 0, width: to.width, height: to.height))
        let resized = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resized!
    }
}
