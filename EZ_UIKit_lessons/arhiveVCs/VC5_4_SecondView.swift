//
//  VC5_4_SecondView.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC5_4_SecondView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        view.backgroundColor = .orange
        setLabel()

    }
    override func viewDidAppear(_ animated: Bool) {
        if isYearBissextile {
            currentLabel.text = "The year is bissextile"
        }
        else{
            currentLabel.text = "The year is not bissextile"
        }
    }
    func setLabel() {
        currentLabel = UILabel()
        if isYearBissextile {
            currentLabel.text = "The year is bissextile"
        }
        else{
            currentLabel.text = "The year is not bissextile"
        }
        currentLabel.textAlignment = .center
        currentLabel.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.05, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.minimumScaleFactor = 0.5
        titleLabel = currentLabel
        view.addSubview(titleLabel)
    }
}

