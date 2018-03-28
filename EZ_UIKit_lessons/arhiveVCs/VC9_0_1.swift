//
//  VC9_0_1.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 26.03.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC9_0_1: MyVC {

    var displaySecondButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "First VC"        // всё ещё можно обходиться без self
        setButton()
        createImageTitleView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(forBarButton(sender:)))
        
        setSwipeForNav()

        UIApplication.statusBarBackgroundColor = .white
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.statusBarBackgroundColor = .white
        navController.navigationBar.isTranslucent = true
        navController.navigationBar.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navController.navigationBar.isTranslucent = true
    }
    

    
    
    func setSwipeForNav(){
        //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻{добавляем свайп - это когда пальцем двигаешь влево и телефон это понимает
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeNavDetected(swipe:)))
        upSwipe.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(upSwipe)
        //🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹}
    }
    
    @objc func swipeNavDetected(swipe: UISwipeGestureRecognizer){
        navController.navigationBar.isTranslucent = false// = falsetintColor = .clear
    }
    
    
    fileprivate func createImageTitleView() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "apple")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }
    
    fileprivate func setButton() {

        
        displaySecondButton = UIButton(type: .system)
        displaySecondButton.setTitle("SecondVC", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.center = view.center
        displaySecondButton.addTarget(self, action: #selector(forButton(sender:)), for: .touchUpInside)
        view.addSubview(displaySecondButton)
    }

    @objc func forButton(sender: UIButton){

        let secondVC = VC9_0_2()
        navigationController?.pushViewController(secondVC, animated: true)
        

    }
    @objc func forBarButton(sender: UIButton){

            let secondVC = VC9_0_3()
            navigationController?.pushViewController(secondVC, animated: true)

        
    }


}
