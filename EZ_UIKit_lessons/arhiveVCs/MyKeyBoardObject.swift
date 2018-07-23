//
//  MyKeyBoardObject.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 7/16/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
var button = UIButton()
var keyboard : KeyBoardView?
class MyKeyBoardObjectVC: MyVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        button = ssButton(title: "new", width: 20, height: 20, x: 50, y: 50)

        let _ = ssButton(title: "nee", width: 20, height: 20, x: 50, y: 80)
        keyboard = KeyBoardView(b: button)
        view.addSubview(keyboard!)
    }
    override func ffButton(sender: UIButton) {

        sender.setTitle("", for: .normal)
        sender.titleLabel?.text = ""
        keyboard?.buttonToChange = sender
        keyboard?.show()
        
    }

  
}


class KeyBoardView: UIView {
    
//    var height : CGFloat
//    var width : CGFloat
    var buttonToChange: UIButton
    
    init(b: UIButton) {
        self.buttonToChange = b
        super.init(frame: CGRect(x: 0, y: h, width: w, height: h40))

        self.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 0.8)
        
        
        
        let height = super.frame.height
        let width = super.frame.width
        
        let _ = KeyboardButton(title: "1", x: width * 0.17, y: height * 0.2)
        
        let _ = KeyboardButton(title: "2", x: width * 0.39, y: height * 0.2)
        
        let _ = KeyboardButton(title: "3", x: width * 0.61, y: height * 0.2)

        let _ = KeyboardButton(title: "4", x: width * 0.83, y: height * 0.2)
        
        let _ = KeyboardButton(title: "5", x: width * 0.17, y: height * 0.5)
        
        let _ = KeyboardButton(title: "6", x: width * 0.39, y: height * 0.5)
        
        let _ = KeyboardButton(title: "7", x: width * 0.61, y: height * 0.5)
        
        let _ = KeyboardButton(title: "8", x: width * 0.83, y: height * 0.5)
        
        let _ = KeyboardButton(title: "del", x: width * 0.17, y: height * 0.8)

        let _ = KeyboardButton(title: "9", x: width * 0.39, y: height * 0.8)
        
        let _ = KeyboardButton(title: "0", x: width * 0.61, y: height * 0.8)
        
        let _ = KeyboardButton(title: "done", x: width * 0.83, y: height * 0.8)
        
        for b in KeyboardButton.allKeyBoardButtons{
            self.addSubview(b)
            b.addTarget(self, action: #selector(addDigit(sender:)), for: .touchUpInside)
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

   @objc func addDigit(sender: UIButton){
   
    if sender.titleLabel?.text == "done"{
        self.hide()
    }
    else if sender.titleLabel?.text == "del"{
        guard var newString1 = buttonToChange.titleLabel?.text else{return}
        if newString1.count > 0{
        newString1.removeLast()
        }
        buttonToChange.setTitle(newString1, for: .normal)
        buttonToChange.titleLabel?.text = ""
    }
    else{
        guard let newString1 = buttonToChange.titleLabel?.text else{return}
        guard let newString2 = sender.titleLabel?.text else{return}
        buttonToChange.setTitle(newString1 + newString2, for: .normal)
    }
    }

    
    
    
    
    
    
    func show(){
        UIView.animate(withDuration: 0.5) {
        self.frame = CGRect(x: 0, y: h60, width: w, height: h40)
        }
    }
    func hide(){
        UIView.animate(withDuration: 0.5) {
                self.frame = CGRect(x: 0, y: h, width: w, height: h40)
            }
        

    }
    
    
    //    var button: UIButton
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
//    init(button: UIButton) {
//
//        self.button = button
//        self.backgroundColor = .red
//    }

}

class KeyboardButton: UIButton{
//    var x : CGFloat
//    var y : CGFloat
//    var title: String
    static var allKeyBoardButtons = [KeyboardButton]()
    init(title: String, x: CGFloat, y: CGFloat) {
//        self.title = title
  //      self.x = x
 //       self.y = y
        super.init(frame: CGRect(x: 0, y: 0, width: w20, height: h10))
        self.center = CGPoint(x: x, y: y)
        self.setTitle(title, for: .normal)
//        self.backgroundColor = .blue
        KeyboardButton.allKeyBoardButtons.append(self)
        
        
        
        
        
        
        
        
        
        let frame = CGRect(x: 0, y: 0, width: w20, height: h10)
        
        // custom view
 //       let currentButton = NiseButton(frame: frame)
 //       currentButton.tag = tag
        
        
        // image layer
        let imageLayer = CALayer()
        var buttonColor = UIColor.blue
        if title == "del"{
            buttonColor = .red
        }
        if title == "done"{
            buttonColor = .green
        }
        imageLayer.backgroundColor = buttonColor.cgColor
        imageLayer.masksToBounds = true
        imageLayer.frame = frame
        imageLayer.cornerRadius = 15
        
        // rounded layer
        let roundedLayer = CALayer()
        roundedLayer.shadowColor = UIColor.gray.cgColor
        roundedLayer.shadowPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: w20, height: h10), cornerRadius: 15).cgPath
        roundedLayer.shadowOffset = CGSize(width: 3, height: 3)
        roundedLayer.shadowOpacity = 1
        roundedLayer.shadowRadius = 2
        roundedLayer.frame = frame
        
        // views and layers hierarchy
        self.layer.addSublayer(imageLayer)
        self.layer.insertSublayer(roundedLayer, below: imageLayer)

        

        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        


        
        
        
        
        
        
        
        
        
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isHighlighted: Bool {
        didSet {
            //           UIView.animate(withDuration: 0.1) {
            self.isHighlighted ? self.layer.setAffineTransform(CGAffineTransform(scaleX: 0.97, y: 0.97 )) :
                self.layer.setAffineTransform(.identity)
            //            }
        }
    }
}

//class MyKeyboard : UIView{
//
////    var keyboardView : UIView
//    var buttonToChange: UIButton
//
//    init(button: UIButton) {
//        self.buttonToChange = button
// //       self.frame = CGRect(x: 0, y: h, width: w, height: h40)
////        self.keyboardView = UIView()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//    func setMyKeyboard(){
// //       self.frame = CGRect(x: 0, y: h, width: w, height: h40)
//        self.backgroundColor = .blue
//
//
//
//
//        let button1 = UIButton(frame: CGRect(x: w5, y: h5, width: w20, height: h10))
//        button1.setTitle("1", for: .normal)
//        button1.backgroundColor = .red
//        button1.tag = 33
//        button1.addTarget(self, action: #selector(keyBoardButtonPressed(sender:)), for: .touchUpInside)
//        self.addSubview(button1)
//
//        let button2 = copyButton(button1)
//        button2.setTitle("2", for: .normal)
//        button2.frame = CGRect(x: w35, y: h5, width: w20, height: h10)
//        self.addSubview(button2)
//
//        let button3 = copyButton(button1)
//        button3.setTitle("3", for: .normal)
//        button3.frame = CGRect(x: w65, y: h5, width: w20, height: h10)
//        self.addSubview(button3)
//
//        let button4 =  copyButton(button1)
//        button4.setTitle("4", for: .normal)
//        button4.frame = CGRect(x: w5, y: h15, width: w20, height: h10)
//        self.addSubview(button4)
//
//        let button5 = copyButton(button1)
//        button5.setTitle("4", for: .normal)
//        button5.frame = CGRect(x: w35, y: h15, width: w20, height: h10)
//        self.addSubview(button5)
//
//
//
//        let removeButton = copyButton(button1)
//        removeButton.setTitle("del", for: .normal)
//        removeButton.frame = CGRect(x: w5, y: h25, width: w20, height: h10)
//        removeButton.tag = 44
//        self.addSubview(removeButton)
//
//        let doneButton = copyButton(button1)
//        doneButton.setTitle("done", for: .normal)
//        doneButton.frame = CGRect(x: w65, y: h25, width: w20, height: h10)
//        doneButton.tag = 55
//        self.addSubview(doneButton)
//
//    }
//
//    func showMyKeyBoard(){
//
//        UIView.animate(withDuration: 0.5) {
//            self.frame = CGRect(x: 0, y: h60, width: w, height: h40)
//        }
//
//    }
//
//
//    func copyButton(_ button:UIButton) -> UIButton{
//        let b = UIButton()
//        b.setTitle(button.titleLabel?.text, for: .normal)
//        b.frame = button.frame
//        b.backgroundColor = button.backgroundColor
//        b.setTitleColor(button.titleLabel?.textColor, for: .normal)
//        b.tag = button.tag
//        b.addTarget(self, action: #selector(keyBoardButtonPressed(sender:)), for: .touchUpInside)
//
//
//        return b
//    }
//
//    @objc func keyBoardButtonPressed(sender: UIButton){
//        if sender.tag == 33{
//
//
//            guard let newString1 = buttonToChange.titleLabel?.text else{return}
//            guard let newString2 = sender.titleLabel?.text else{return}
//            buttonToChange.setTitle(newString1 + newString2, for: .normal)
//        }
//        if sender.tag == 44{
//
//
//            guard var newString = buttonToChange.titleLabel?.text else{return}
//            if newString.count > 0{
//                newString.removeLast()
//            }
//            buttonToChange.setTitle(newString, for: .normal)
//        }
//        if sender.tag == 55{
//            UIView.animate(withDuration: 0.5) {
//                self.frame = CGRect(x: 0, y: h, width: w, height: h40)
//            }
//            if buttonToChange.titleLabel?.text == ""
//            {
//                buttonToChange.setTitle("enter ammaunt", for: .normal)
//            }
//        }
//    }
//
//
//
//}

