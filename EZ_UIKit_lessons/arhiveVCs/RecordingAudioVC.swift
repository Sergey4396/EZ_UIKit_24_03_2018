// не получилось в общем.


////
////  RecordingAudioVC.swift
////  EZ_UIKit_lessons
////
////  Created by 1234 on 6/21/18.
////  Copyright © 2018 Sergey Riabinin. All rights reserved.
////
//
//import UIKit
//import AVFoundation
//
//class RecordingAudioVC: MyVC, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
//    var recordButton : UIButton!
//    var playButton : UIButton!
//
//    var soundRecorder = AVAudioRecorder()
//    var soundPlayer = AVAudioPlayer()
//
//    var fileName = "audio.m4a"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        recordButton = ssButton(title: "record", width: 30, height: 7, x: 25, y: 50)
//        playButton = ssButton(title: "play", width: 30, height: 7, x: 75, y: 50)
//
//    }
//
//    func setupRecorder(){
//        var recordSettings = [AVFormatIDKey : kAudioFormatAppleLossless,
//    AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
//            AVEncoderBitRateKey : 320000,
//            AVNumberOfChannelsKey : 2,
//            AVSampleRateKey : 44100.0
//            ] as [String : Any]
//
//        var error: NSError?
//
//        soundRecorder = AVAudioRecorder(url: <#T##URL#>, settings: <#T##[String : Any]#>)//(url: NSURL!, settings: <#T##[String : Any]#>)
//    }
//
//
//    func getCacheDirectory() -> String{
//
//        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) as! [String]
//        return paths[0]
//    }
//
//    func getFileURL() ->NSURL{
//      let path = getCacheDirectory() as NSURL.appendingPathComponent(fileName)
//    }
//
//
//    override func ffButton(sender: UIButton) {
//        if sender.titleLabel?.text == "record"{
//
//        }
//        if sender.titleLabel?.text == "play"{
//
//        }
//    }
//
//
//
//}

