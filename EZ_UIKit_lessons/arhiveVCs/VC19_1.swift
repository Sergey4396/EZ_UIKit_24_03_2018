
import UIKit

final class VC19_1: MyVC {
    private var myProgressView : UIProgressView = UIProgressView()
    private var myTime = Timer()
    private var myButton : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        createProgress(myProgressView)
        myButton = ssButton(title: "button", width: 30, height: 10, x: 50, y: 90)
        myButton.alpha = 0.2
        
        
    }
    
    //Mark :Timer
    private func createTimer(){
        myTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    //Mark :Timer
    
    
    //Mark: selector
    @objc func updateTimer(){
        if myProgressView.progress != 1.0{
            myProgressView.progress += 0.1
        }
        else if myProgressView.progress == 1.0{
            UIView.animate(withDuration: 0.7, animations: {
                self.myButton.alpha = 1
                self.myButton.setTitle("Старт", for: .normal)
                self.myTime.invalidate()
            })
        }
        
    }
    //Mark: selector
    private func createProgress(_ progressView: UIProgressView){
        
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: view.center.y, width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .gray
        progressView.center = view.center
        view.addSubview(progressView)
        
    }
    
    internal override func ffButton(sender: UIButton) {
        createTimer()
    }
    
}

