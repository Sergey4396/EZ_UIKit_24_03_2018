//
//  VC6_2_Player.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 21.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC6_2_Player: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        let _ = letItBeLabel(text: "Игрок создан", width: w90, height: h15, x: w50, y: h40)

    }
    func letItBeLabel(text: String, width: CGFloat, height: CGFloat, x: CGFloat, y: CGFloat,  backgroundColor: UIColor = .yellow, titleColor: UIColor = .black ) -> UILabel{
        currentLabel = UILabel()
        currentLabel.backgroundColor = .orange
        currentLabel.text = text
        currentLabel.textAlignment = .center
        currentLabel.font = UIFont.systemFont(ofSize: 26)
        currentLabel.adjustsFontSizeToFitWidth = true
        currentLabel.contentScaleFactor = 0.5
        
        currentLabel.bounds = CGRect(x: 0, y: 0, width: width, height: height)
        currentLabel.center = CGPoint(x: x, y: y )
        
        currentLabel.textColor = .darkGray
        
        view.addSubview(currentLabel)
        return currentLabel
    }

}
