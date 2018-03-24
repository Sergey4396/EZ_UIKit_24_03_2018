import UIKit
    var you = ""
class VC5_5: UIViewController {
    var buttonClient : UIButton!
    var buttonDeveloper : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        setClientButton()
        setDeveloperButton()

    }
    
    func setClientButton() -> Void {
        currentButton = UIButton()

        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.1, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentButton.setTitle("Клиент", for: .normal)
        currentButton.backgroundColor = .orange
        currentButton.setTitleColor(UIColor.black, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC5_5.buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
        buttonClient = currentButton
        view.addSubview(buttonClient)
    }
    @objc func buttonPressed(sender: UIButton){
        print("button pressed")
        you = "client"
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = VC5_5_SecondView()
        window.makeKeyAndVisible()
        
    }
    func setDeveloperButton() -> Void {
        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.4, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentButton.setTitle("Разработчик", for: .normal)
        currentButton.backgroundColor = .orange
        currentButton.setTitleColor(UIColor.black, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC5_5.buttonDeveloperPressed(sender:)), for: UIControlEvents.touchUpInside)
        buttonDeveloper = currentButton
        view.addSubview(buttonDeveloper)
    }
    @objc func buttonDeveloperPressed(sender: UIButton){
        print("button pressed")
        you = "developer"
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = VC5_5_SecondView()
        window.makeKeyAndVisible()
        
    }

    
}

