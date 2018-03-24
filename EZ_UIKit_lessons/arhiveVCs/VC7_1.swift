//
//  VC7_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 22.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC7_1: MyVC {

    var segmentedControl = UISegmentedControl()

    
    var imageView = UIImageView()

    var menuArray = ["one","two","three",]
    var imageArray = [UIImage(named: "fry"),
                      UIImage(named: "simpson"),
                      UIImage(named: "pooh")]
    override func viewDidLoad() {
        super.viewDidLoad()
imageView.frame = CGRect(x: 0, y: 0, width: w45, height: w45)
imageView.center = view.center
        imageView.image = imageArray[0]

        
        
        view.addSubview(imageView)
        
        
        segmentedControl = UISegmentedControl(items: self.menuArray)
        segmentedControl.frame = CGRect(x: w5, y: h30, width: w90, height: h5)
        segmentedControl.center = CGPoint(x: w50, y: h30)
        
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(selectedValue(sender:)), for: .valueChanged)
        
        let _ = ssButton(title: "Go", width: 40, height: 10, x: 50, y: 85)

    }

    @objc func selectedValue(sender: UISegmentedControl){
        if sender == segmentedControl{
            let segmentIndex = sender.selectedSegmentIndex
            imageView.image = imageArray[segmentIndex]
            let pr = sender.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
    }
    
    override func ffButton(sender: UIButton) {
        print("it is new CV")
        goToVC(VC:VC7_1_Second())
    }
    
    
}
