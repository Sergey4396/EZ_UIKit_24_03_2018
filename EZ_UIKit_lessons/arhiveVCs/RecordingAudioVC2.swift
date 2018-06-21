//tutorial by swift guy
//
//  RecordingAudioVC2.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 6/21/18.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingAudioVC2: MyVC, AVAudioRecorderDelegate{

    var recordingSession:AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    var numberOfRecords = 0
    
    var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// ask for permission
        recordingSession = AVAudioSession.sharedInstance()
        
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission{
                print("ACCEPTED")
            }
        }

        recordButton = ssButton(title: "Start recording", width: 40, height: 10, x: 50, y: 50)

    }
    
    override func ffButton(sender: UIButton) {
        //chek if we have an active recorder
        if audioRecorder == nil{
            numberOfRecords += 1
            let fileName = getDirectory().appendingPathComponent("\(numberOfRecords).m4a")
            
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC),AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            // Start audio recording
            do{
                audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                recordButton.setTitle("Stop Recording", for: .normal)
            }
            catch{
                displayAlert(title: "Ups!", message: "Recording failed")
            }
        }
        else{
            // Stoping audiorecording
            audioRecorder.stop()
            audioRecorder = nil
            
            recordButton.setTitle("Start recording", for: .normal)
        }
        
    }

 
    //Function that gets path to directory
    func getDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
// Function that displays an alert
    func displayAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "dismiss", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
