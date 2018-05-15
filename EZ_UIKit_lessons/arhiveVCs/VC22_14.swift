
import UIKit
class VC22_14: MyVC {

    var greenSquareView = UIView()
    var redSquareView = UIView()
    
    var squareViews = [UIDynamicItem]()
    override func viewDidLoad() {
        super.viewDidLoad()

        makeNewSquareView(currentView: redSquareView, x: w50, y: h15, color: .red)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        makeNewSquareView(currentView: greenSquareView, x: w50, y: h90, color: .green)
        perform(#selector(goGreenGo), with: nil, afterDelay: 3.0)
        
        squareViews.append(redSquareView)
        squareViews.append(greenSquareView)
    }
    @objc func goGreenGo(){
        UIView.animate(withDuration: 2, animations: {
            self.greenSquareView.center.y = -100
        })
    }

    func makeNewSquareView(currentView: UIView, x: CGFloat, y: CGFloat, color: UIColor){

        currentView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        currentView.backgroundColor = color
        currentView.center = CGPoint(x: x, y: y)
        view.addSubview(currentView)
    }
}
