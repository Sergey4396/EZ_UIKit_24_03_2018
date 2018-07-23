//
//  MyKeyboard.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 7/16/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit

class MyKeyboardVC: MyVC {

     var ammountButtonLabel = UIButton()
    var keyboardView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()

        ammountButtonLabel = ssButton(title: "enter ammaunt", width: 30, height: 10, x: 50, y: 20)
        setMyKeyboard()
        
        
    }


    override func ffButton(sender: UIButton) {
        if sender == ammountButtonLabel {
            

        ammountButtonLabel.setTitle("", for: .normal)
        // если этого не написать, то почему-то текст исчезает, а titleLabel?.text отстается тем же.
        ammountButtonLabel.titleLabel?.text = ""

        showMyKeyBoard()
        }
        

    }
    
    func setMyKeyboard(){
        keyboardView = UIView(frame: CGRect(x: 0, y: h, width: w, height: h40))
        keyboardView.backgroundColor = .blue
        
        view.addSubview(keyboardView)
        
        
        let button1 = UIButton(frame: CGRect(x: w5, y: h5, width: w20, height: h10))
        button1.setTitle("1", for: .normal)
        button1.backgroundColor = .red
        button1.tag = 33
        button1.addTarget(self, action: #selector(keyBoardButtonPressed(sender:)), for: .touchUpInside)
        keyboardView.addSubview(button1)
        
        let button2 = copyButton(button1)
        button2.setTitle("2", for: .normal)
        button2.frame = CGRect(x: w35, y: h5, width: w20, height: h10)
        keyboardView.addSubview(button2)
        
        let button3 = copyButton(button1)
        button3.setTitle("3", for: .normal)
        button3.frame = CGRect(x: w65, y: h5, width: w20, height: h10)
        keyboardView.addSubview(button3)
        
        let button4 =  copyButton(button1)
        button4.setTitle("4", for: .normal)
        button4.frame = CGRect(x: w5, y: h15, width: w20, height: h10)
        keyboardView.addSubview(button4)

        let button5 = copyButton(button1)
        button5.setTitle("4", for: .normal)
        button5.frame = CGRect(x: w35, y: h15, width: w20, height: h10)
        keyboardView.addSubview(button5)
        
        
        
        let removeButton = copyButton(button1)
        removeButton.setTitle("del", for: .normal)
        removeButton.frame = CGRect(x: w5, y: h25, width: w20, height: h10)
        removeButton.tag = 44
        keyboardView.addSubview(removeButton)
        
        let doneButton = copyButton(button1)
        doneButton.setTitle("done", for: .normal)
        doneButton.frame = CGRect(x: w65, y: h25, width: w20, height: h10)
        doneButton.tag = 55
        keyboardView.addSubview(doneButton)
        
    }
    
    func showMyKeyBoard(){
        
        UIView.animate(withDuration: 0.5) {
            self.keyboardView.frame = CGRect(x: 0, y: h60, width: w, height: h40)
        }
        
    }
    
    
    func copyButton(_ button:UIButton) -> UIButton{
        let b = UIButton()
        b.setTitle(button.titleLabel?.text, for: .normal)
        b.frame = button.frame
        b.backgroundColor = button.backgroundColor
        b.setTitleColor(button.titleLabel?.textColor, for: .normal)
        b.tag = button.tag
        b.addTarget(self, action: #selector(keyBoardButtonPressed(sender:)), for: .touchUpInside)

        
        return b
    }
    
    @objc func keyBoardButtonPressed(sender: UIButton){
        if sender.tag == 33{
            

            guard let newString1 = ammountButtonLabel.titleLabel?.text else{return}
            guard let newString2 = sender.titleLabel?.text else{return}
            ammountButtonLabel.setTitle(newString1 + newString2, for: .normal)
        }
        if sender.tag == 44{
            
            
            guard var newString = ammountButtonLabel.titleLabel?.text else{return}
            if newString.count > 0{
            newString.removeLast()
            }
            ammountButtonLabel.setTitle(newString, for: .normal)
        }
        if sender.tag == 55{
            UIView.animate(withDuration: 0.5) {
                self.keyboardView.frame = CGRect(x: 0, y: h, width: w, height: h40)
            }
        if ammountButtonLabel.titleLabel?.text == ""
        {
          ammountButtonLabel.setTitle("enter ammaunt", for: .normal)
            }
        }
    }


}


