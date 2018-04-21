//
//  VC20_2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC20_2: MyVC {

    //Mark: - Image
    private let greetingImage : UIImageView = {
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
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    
    //Mark: Button
    private let okButton : UIButton = {
    let button = UIButton()
        button.setTitle("Ok Ok", for: .normal)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
//        button.bounds = CGRect(x: 0, y: 0, width: w30, height: h10)
        button.addTarget(self, action: #selector(okokPressed), for: .touchUpInside)

        return button
        
    }()
    
     let greetingTextView : UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .orange
//        textView.layer.cornerRadius = 10
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 18)
        return textView
    }()
    
    
    
    
    lazy var subView: [UIView] = [self.greetingImage, self.okButton, self.greetingTextView, self.nameLabel]
    
    //Mark: Init
    init(greetingWith: GreetingsHelper){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .lightGray
        edgesForExtendedLayout = []
        greetingImage.image = greetingWith.image
        nameLabel.text = greetingWith.name
        greetingTextView.text = greetingWith.text

        
        for view in subView{ self.view.addSubview(view)}
        

        
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: greetingTextView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: h70),
            NSLayoutConstraint(item: greetingTextView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: w),
            NSLayoutConstraint(item: greetingTextView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: h10),
            NSLayoutConstraint(item: greetingTextView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: greetingImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: greetingImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: greetingImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: greetingImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: nameLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: w90),
            NSLayoutConstraint(item: nameLabel, attribute: .bottom, relatedBy: .equal, toItem: greetingTextView, attribute: .top, multiplier: 1, constant: -h * 0.02),
            NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            
            ])
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: okButton, attribute: .top, relatedBy: .equal, toItem: greetingTextView, attribute: .bottom, multiplier: 1, constant: h * 0.02),
            NSLayoutConstraint(item: okButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            
            NSLayoutConstraint(item: okButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: h * 0.085),
            NSLayoutConstraint(item: okButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: h30),
            
            ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func okokPressed(){
        goToVC(VC: InitViewController())
    }
    //Mark: func to start textView from top - позволяет начинать текствью с самого верха
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greetingTextView.setContentOffset(CGPoint.zero, animated: false)
    }
    
}
