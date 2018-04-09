//
//  VC17_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 09.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC17_0: MyVC, UIScrollViewDelegate {

    var myScrollView = UIScrollView()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageToLoad = UIImage(named: "fry")
        myImageView = UIImageView(image: imageToLoad)
        myScrollView = UIScrollView(frame: view.bounds)
        myScrollView.addSubview(myImageView)
        myScrollView.contentSize = myImageView.bounds.size
        myScrollView.delegate = self
        view.addSubview(myScrollView)
        print("view загружен")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("идет прокрутка")
        print(" y = \(scrollView.contentOffset.y)")
        print(" x = \(scrollView.contentOffset.x)")
        myScrollView.alpha = 0.5
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("scrollViewDidEndDecelerating - вызывается после прокрутки")
        myScrollView.alpha = 1.0
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("scrollViewDidEndDragging - гарантирует что вернет альку к 1")
        myScrollView.alpha = 1.0
    }

}
