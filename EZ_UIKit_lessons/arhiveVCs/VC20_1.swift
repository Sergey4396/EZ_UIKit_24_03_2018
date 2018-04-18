//
//  VC20_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 18.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC20_1: MyVC {

    //Mark: - Image
    private let carImage : UIImageView = {
       let view = UIImageView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


//    Mark: Label
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   lazy var subView: [UIView] = [self.carImage, self.nameLabel]
    
    //Mark: Init
    init(carWith: CarHelper){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .purple
        edgesForExtendedLayout = []
        carImage.image = carWith.image
        nameLabel.text = carWith.name
        
        for view in subView{ self.view.addSubview(view)}
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)

            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
