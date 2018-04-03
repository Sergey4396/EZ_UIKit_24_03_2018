

import UIKit

class VC15_1: MyVC {

    var label : UILabel!
    var button : UIButton!
    var timer = Timer()
    var seconds = 0
    var isTimerCounting = false
    override func viewDidLoad() {
        super.viewDidLoad()
       scheduledTimerWithTimeInterval()
        label = ssLabel(text: "\(seconds)", width: 60, height: 10, x: 50, y: 20)
        button = ssButton(title: "play", width: 15, height: 10, x: 50, y: 80)
        let _ = ssButton(title: "stop", width: 15, height: 10, x: 75, y: 80, backgroundColor: .red)
    
    }
    

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: true)
    }
    

    
    @objc func updateLabel(){
        if isTimerCounting{
        seconds += 1
            label.text = "\(seconds / 100) : \(seconds % 100)"
        }
    }

    
    override func ffButton(sender: UIButton) {
        if sender.titleLabel?.text == "play"{
            isTimerCounting = true
            sender.setTitle("pause", for: .normal)
        }
       else if sender.titleLabel?.text == "pause"{
            isTimerCounting = false
            sender.setTitle("play", for: .normal)
            
        }
        else if sender.titleLabel?.text == "stop"{
            isTimerCounting = false
            seconds = 0
            label.text = "0"
            
        }
    }
    

}
