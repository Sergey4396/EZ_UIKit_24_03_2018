//
//  GlobalVariables.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 19.03.18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import Foundation
import UIKit

var switchN1: UISwitch!
var switchN2: UISwitch!
var switchN3: UISwitch!

var currentSwitch : UISwitch!
var currentButton : UIButton!
var currentPickerView : UIPickerView!
var currentLabel: UILabel!
var currentTextField : UITextField!
var currentSegmentedControl : UISegmentedControl!
var currentImageView : UIImageView!
var currentTextView : UITextView!
var currentScrollView : UIScrollView!
var currentSlider : UISlider!


var canUseNotification = false

var opsButton : UIButton!
var isButtonAvailable = false
var newLabel : UILabel!
var newLabel2 : UILabel!
var window : UIWindow!
var titleLabel: UILabel!

//for CoreData
var allEntityVC6_2Array : [EntityVC6_2] = []



//for ease acsess to view.bounds.height
var h = CGFloat(0)
var w = CGFloat(0)
var (h5,h10,h15,h20,h25,h30,h35,h40,h45,h50,h55,h60,h65,h70,h75,h80,h85,h90,h95,h100) = (CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0))
var (w5,w10,w15,w20,w25,w30,w35,w40,w45,w50,w55,w60,w65,w70,w75,w80,w85,w90,w95,w100) = (CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0),CGFloat(0))

struct AllFirstControllersStruct{
    static var allFirstControllersDictsArray : [AllFirstControllersStruct] = []
    var name : String
    var controller : UIViewController
    init(name:String, controller: UIViewController) {
        self.name = name
        self.controller = controller
        AllFirstControllersStruct.allFirstControllersDictsArray.append(self)
    }
}
var isVCset = false
func setVCNamesForAllLessons(){
    _ = AllFirstControllersStruct(name: "5 lesson", controller: VC1())
    _ = AllFirstControllersStruct(name: "5 - 1", controller: VC5_1())
    _ = AllFirstControllersStruct(name: "5 - 1_2", controller: VC5_1_2())
    _ = AllFirstControllersStruct(name: "5 - 2", controller: VC5_2())
    _ = AllFirstControllersStruct(name: "5 - 4", controller: VC5_4())
    _ = AllFirstControllersStruct(name: "5 - 5", controller: VC5_5())
    _ = AllFirstControllersStruct(name: "6 - 1", controller: VC6_1())
    _ = AllFirstControllersStruct(name: "6 - 2", controller: VC6_2())
    _ = AllFirstControllersStruct(name: "7 - 1", controller: VC7_1())
    _ = AllFirstControllersStruct(name: "8 - 1", controller: VC8_1())
    _ = AllFirstControllersStruct(name: "9 - 0", controller: VC9_0())
    _ = AllFirstControllersStruct(name: "11 - 0", controller: VC11_1())
    _ = AllFirstControllersStruct(name: "11 - 3", controller: VC11_3())
    _ = AllFirstControllersStruct(name: "12", controller: VC12())
    _ = AllFirstControllersStruct(name: "13 - 0", controller: VC13_0())
    _ = AllFirstControllersStruct(name: "13 - 1", controller: VC13_1())
    _ = AllFirstControllersStruct(name: "14 - 0", controller: VC14_0())
    _ = AllFirstControllersStruct(name: "14 - 1", controller: VC14_1())
    _ = AllFirstControllersStruct(name: "15 - 1", controller: VC15_1())
    _ = AllFirstControllersStruct(name: "16 - 1", controller: VC16_1())
    _ = AllFirstControllersStruct(name: "17 - 0", controller: VC17_0())
    _ = AllFirstControllersStruct(name: "17 - 0 - second", controller: VC17_0_second())
    _ = AllFirstControllersStruct(name: "17 - 1", controller: VC17_1())
    _ = AllFirstControllersStruct(name: "17 - 2", controller: VC17_2())
    _ = AllFirstControllersStruct(name: "17 - 3", controller: VC17_3())
    _ = AllFirstControllersStruct(name: "18 - 0", controller: VC18_0())
    _ = AllFirstControllersStruct(name: "18 - 0_UI", controller: VC18_0_UI())
    _ = AllFirstControllersStruct(name: "18 - 0_PDF", controller: VC18_0_PDF())
    _ = AllFirstControllersStruct(name: "VC18_0_SFSafari", controller: VC18_0_SFSafari())
    _ = AllFirstControllersStruct(name: "VC19_0", controller: VC19_0())
    _ = AllFirstControllersStruct(name: "VC19_1", controller: VC19_1())
    _ = AllFirstControllersStruct(name: "VC20_0", controller: VC20_0())
    isVCset = true
}

