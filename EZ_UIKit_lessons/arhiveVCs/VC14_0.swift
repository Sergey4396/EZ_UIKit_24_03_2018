//
//  VC14_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 01.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class VC14_0: MyVC {

    var myTextView : UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(updateTextView(param:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        myTextView = ssTextView(text: "Some text", y: 50, width: 60, height: 50)
        myTextView.contentInset = UIEdgeInsets(top: h5, left: w10 / 5, bottom: h5, right: w10 / 5)
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextView.resignFirstResponder()
    }

 @objc func updateTextView(param: Notification){
        let userInfo = param.userInfo
        
        let getKeyboardRect = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keycoardFrame = self.view.convert(getKeyboardRect, to: view.window)
        if param.name == Notification.Name.UIKeyboardDidHide{
            myTextView.contentInset = UIEdgeInsets.zero
        }
        else{
            myTextView.contentInset = UIEdgeInsetsMake(0, 0, keycoardFrame.height, 0)
            myTextView.scrollIndicatorInsets = myTextView.contentInset
        }
       
        myTextView.scrollRangeToVisible(myTextView.selectedRange)
    }
    
}
