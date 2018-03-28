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
        
        UIApplication.statusBarBackgroundColor = .blue
        navController.navigationBar.tintColor = .red
        navController.navigationBar.backgroundColor = .orange
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

extension UIApplication {
    class var statusBarBackgroundColor: UIColor? {
        get {
            return (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor
        } set {
            (shared.value(forKey: "statusBar") as? UIView)?.backgroundColor = newValue
        }
    }
}
