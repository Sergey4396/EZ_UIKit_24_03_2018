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

class RecordingAudioVC2: MyVC, AVAudioRecorderDelegate, UITableViewDelegate, UITableViewDataSource{

    var recordingSession:AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    
    var numberOfRecords : Int = 0
    
    var recordButton: UIButton!
    var myTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// ask for permission
        recordingSession = AVAudioSession.sharedInstance()
        
        if let number:Int = UserDefaults.standard.object(forKey: "myNumber") as? Int{
            numberOfRecords = number
        }
        
        AVAudioSession.sharedInstance().requestRecordPermission { (hasPermission) in
            if hasPermission{
                print("ACCEPTED")
            }
        }

        recordButton = ssButton(title: "Start recording", width: 40, height: 10, x: 50, y: 15)
        myTableView = UITableView(frame: CGRect(x: 0, y: h30, width: w, height: h65))
        myTableView.delegate = self
        myTableView.dataSource = self
        view.addSubview(myTableView)
        
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    
    //🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻🔻 блок функций для тейблвью{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return numberOfRecords
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row + 1) sound"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("row selected: \(indexPath.row)")
        
        let path = getDirectory().appendingPathComponent("\(indexPath.row + 1).m4a")
        do{
          audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer.play()
        }

        catch{
            
        }

    }

    //🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹🔹}
    
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
            
            UserDefaults.standard.set(numberOfRecords, forKey: "myNumber")
            myTableView.reloadData()
            
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
