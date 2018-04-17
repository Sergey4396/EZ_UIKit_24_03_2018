
import UIKit

final class VC19_1: MyVC {
    private var myProgressView : UIProgressView = UIProgressView()

    private var currentProgressView : UIProgressView = UIProgressView()
    private var allProgressViewArray = [UIProgressView]()
    private var mainImageView : UIImageView!
    
    private var myTime = Timer()
    
    private var currentImageName : String!
    
    private let imgNamesArray = ["fry", "Bender", "simpson", "pooh",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        print("‼️defaults.integer(forKey: \"ImageNameNomber\") = \(defaults.integer(forKey: "ImageNameNomber"))")

// I don't need if else statement because default value is, not nil
            currentImageName = imgNamesArray[defaults.integer(forKey: "ImageNameNomber")]
        
        createProgress(myProgressView)
        
//        let _ = createHorizontalProgress(y: h80)
//        let _ = createHorizontalProgress(y: h85)
        createAllHorizontalProgress()

        
                createTimer()
        mainImageView = ssImageView(image: currentImageName, y: 30, x: 50, width: 90, height: 40, tag: 0)
        mainImageView.alpha = 0
        
//       print(VC19_2.xx)
        
    }
    
    //Mark :Timer
    private func createTimer(){
        myTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    //Mark :Timer
    
    
    //Mark: selector
    @objc func updateTimer(){
        if myProgressView.progress != 1.0{
            myProgressView.progress += 0.2
            self.mainImageView.alpha = CGFloat(myProgressView.progress)
            
            for x in allProgressViewArray{
                x.progress += 0.2
            }
        }
        else if myProgressView.progress == 1.0{
//            UIView.animate(withDuration: 0.7, animations: {
//                self.myButton.alpha = 1
//                self.myButton.setTitle("Старт", for: .normal)
//                self.myTime.invalidate()
//            })
            self.myTime.invalidate()
            
            goToVC(VC: VC19_2())
        }
        
    }
    //Mark: selector
        
    private func createProgress(_ progressView: UIProgressView){
        
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x, y: h10, width: w90, height: 10)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .gray
        progressView.center = CGPoint(x: w50, y: h10)
        view.addSubview(progressView)
        
    }
    
    private func createHorizontalProgress(y: CGFloat) -> UIProgressView{
        
        currentProgressView = UIProgressView()
        currentProgressView.progressViewStyle = .bar
        currentProgressView.frame = CGRect(x: view.center.x, y: h10, width: w90, height: 10)
        currentProgressView.setProgress(0.0, animated: false)
        currentProgressView.progressTintColor = .green
        currentProgressView.trackTintColor = .clear
        currentProgressView.alpha = 0.8
        currentProgressView.center = CGPoint(x: w50, y: y)
        view.addSubview(currentProgressView)
        allProgressViewArray.append(currentProgressView)
        return currentProgressView
        
    }
    private func createVerticalProgress(x: CGFloat) -> UIProgressView{
        
        currentProgressView = UIProgressView()
        currentProgressView.progressViewStyle = .bar
        currentProgressView.frame = CGRect(x: view.center.x, y: h10, width: w * 0.62, height: 10)
        currentProgressView.setProgress(0.0, animated: false)
        currentProgressView.progressTintColor = .red
        currentProgressView.trackTintColor = .clear
        currentProgressView.alpha = 0.5
        currentProgressView.center = CGPoint(x: x, y: h * 0.775)
        currentProgressView.transform = CGAffineTransform(rotationAngle: -CGFloat((Double.pi / 2)))
        view.addSubview(currentProgressView)
        allProgressViewArray.append(currentProgressView)
        return currentProgressView

        
    }
    private func createAllHorizontalProgress(){
        
        for i in 60...95{
          let _ = createHorizontalProgress(y: h * CGFloat(i) / 100)
        }
        for i in 3...48{
        let _ = createVerticalProgress(x: w * CGFloat(i) / 50 - (w / 200))
        }
    }
    
}

