//
//  VC17_0_second.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 09.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC17_0_second: MyVC, UIScrollViewDelegate {

    var myScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fryImage = UIImage(named: "fry")
        let simpsonImage = UIImage(named: "simpson")
        let benderImage = UIImage(named: "Bender")
        
        let scrollViewRect = view.bounds
        //create scroll
        myScrollView = UIScrollView(frame: scrollViewRect)
        myScrollView.isPagingEnabled = true
        myScrollView.contentSize = CGSize(width: scrollViewRect.size.width * 3, height: scrollViewRect.size.height)
        view.addSubview(myScrollView)
        
        
//      create fry
        var imageViewRect = view.bounds
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

}
