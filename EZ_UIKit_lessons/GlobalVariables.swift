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
    _ = AllFirstControllersStruct(name: "VC21_0", controller: VC21_0())
    _ = AllFirstControllersStruct(name: "VC21_01", controller: VC21_01())
    _ = AllFirstControllersStruct(name: "VC21_02", controller: VC21_02())
    _ = AllFirstControllersStruct(name: "VC21_1", controller: VC21_1())
    _ = AllFirstControllersStruct(name: "Take_Foto", controller: VC21___Take_Foto())
    _ = AllFirstControllersStruct(name: "VC22_0", controller: VC22_0())
    _ = AllFirstControllersStruct(name: "VC22_01", controller: VC22_01())
    _ = AllFirstControllersStruct(name: "VC22_1", controller: VC22_1())
    _ = AllFirstControllersStruct(name: "VC22_11", controller: VC22_11())
    _ = AllFirstControllersStruct(name: "VC22_12", controller: VC22_12())
    _ = AllFirstControllersStruct(name: "VC22_13", controller: VC22_13())
    _ = AllFirstControllersStruct(name: "VC22_14", controller: VC22_14())
    _ = AllFirstControllersStruct(name: "VC22_15", controller: VC22_15())
    _ = AllFirstControllersStruct(name: "VC22_16", controller: VC22_16())
    _ = AllFirstControllersStruct(name: "VC24_0", controller: VC24_0())
    _ = AllFirstControllersStruct(name: "VC24_01", controller: VC24_01())
    _ = AllFirstControllersStruct(name: "VC24_02", controller: VC24_02())
    _ = AllFirstControllersStruct(name: "VC24_03", controller: VC24_03())
    _ = AllFirstControllersStruct(name: "VC24_04", controller: VC24_04())
    _ = AllFirstControllersStruct(name: "Patterns", controller: PatternsVC())
     _ = AllFirstControllersStruct(name: "VC_Drawing", controller: VC_Drawing())
    _ = AllFirstControllersStruct(name: "VC_Drawind2", controller: VC_Drawind2())
//    _ = AllFirstControllersStruct(name: "RecordingAudioVC", controller: RecordingAudioVC())
    _ = AllFirstControllersStruct(name: "RecordingAudioVC2", controller: RecordingAudioVC2())
    _ = AllFirstControllersStruct(name: "CALayerVC", controller: CALayerVC())
//    _ = AllFirstControllersStruct(name: "ButtonWithShadow", controller: buttonShadowAndCornerR())
    _ = AllFirstControllersStruct(name: "NiseButtonVC", controller: NiseButtonVC())
    _ = AllFirstControllersStruct(name: "NiseButton whithShadowVC", controller: NiseButtonwhithShadowVC())
    _ = AllFirstControllersStruct(name: "NiseButton2VC", controller: NiseButton2VC())
    _ = AllFirstControllersStruct(name: "JSONFromSiteVC", controller: JSONFromSiteVC())
     _ = AllFirstControllersStruct(name: "MyKeyboardVC", controller: MyKeyboardVC())
     _ = AllFirstControllersStruct(name: "MyKeyBoardObject", controller: MyKeyBoardObjectVC())
     _ = AllFirstControllersStruct(name: "DrawingVC_3", controller: DrawingVC_3())
     _ = AllFirstControllersStruct(name: "DrawingVC_4", controller: DrawingVC_4())
    _ = AllFirstControllersStruct(name: "DrawingVC_5", controller: DrawingVC_5())
    
    isVCset = true
}



struct AllPatternsControllersStruct{
    static var allFirstControllersDictsArray : [AllPatternsControllersStruct] = []
    var name : String
    var controller : UIViewController
    init(name:String, controller: UIViewController) {
        self.name = name
        self.controller = controller
        AllPatternsControllersStruct.allFirstControllersDictsArray.append(self)
    }
}
var isPatternsVCset = false
func setVCNamesForAllPatterns(){
    _ = AllPatternsControllersStruct(name: "observer", controller: ObserverVC())
    _ = AllPatternsControllersStruct(name: "prototype", controller: PrototypeVC())
    _ = AllPatternsControllersStruct(name: "strategy", controller: StrategyVC())
    _ = AllPatternsControllersStruct(name: "decorator", controller: DecoratorVC())
    _ = AllPatternsControllersStruct(name: "Simple Factory", controller: SimpleFactoryVC())
    _ = AllPatternsControllersStruct(name: "Factory Methot", controller: FactoryMethotVC())
    _ = AllPatternsControllersStruct(name: "Abstract Factory", controller: AbstractFactoryVC())
    _ = AllPatternsControllersStruct(name: "Singletone", controller: SingletoneVC())
    _ = AllPatternsControllersStruct(name: "Command", controller: CommandVC())
    _ = AllPatternsControllersStruct(name: "Adapter", controller: AdapterVC())
    

    

    isPatternsVCset = true
}

