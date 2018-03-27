//
//  VC9_0_3.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 26.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC9_0_3: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "VC9_0_3"
        
        let items = ["up", "down"]
        
        let segmentController = UISegmentedControl(items: items)
        segmentController.isMomentary = true
        segmentController.addTarget(self, action: #selector(segmtntControllerTapped(sender:)), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
    }

    @objc func segmtntControllerTapped(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
    }


}
