import UIKit

class VC5_5_SecondView: UIViewController, UITextFieldDelegate {

    var nameClientTextField : UITextField!
    var surnameClientTextField : UITextField!
    var passClientTextField : UITextField!
    var cardNomberClientTextField : UITextField!
    var fourDigitsClientTextField : UITextField!
    var mailClientTextField : UITextField!
    var nameDevTextField : UITextField!
    var surnameDevTextField : UITextField!
    var langDevTextField : UITextField!
    var cardNomberDevTextField : UITextField!
    var expirienceDevTextField : UITextField!
    var mailDevTextField : UITextField!
    var tehDevTextField : UITextField!
    
    
    var saveButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstFuncForVC()
        if you == "client"{
            setClientTextViews()
        }
        if you == "developer"{
            setDeveloperTextViews()
        }
        setSaveButton()

    }

    func setClientTextViews(){
//        имя, фамилия, пароль, номер банковской карты(4 любых цифры), и емейл.
        nameClientTextField = setTextField(placeholder: "введите имя", y: view.bounds.height * 0.1)
      
        surnameClientTextField = setTextField(placeholder: "введите фамилию", y: view.bounds.height * 0.2)
        passClientTextField = setTextField(placeholder: "введите пароль", y: view.bounds.height * 0.3)
        fourDigitsClientTextField = setTextField(placeholder: "4 цифры", y: view.bounds.height * 0.4)
        cardNomberClientTextField = setTextField(placeholder: "номер карты", y: view.bounds.height * 0.5)
        mailClientTextField = setTextField(placeholder: "укажите почту", y: view.bounds.height * 0.6)

        passClientTextField.isSecureTextEntry = true
        
//        view.addSubview(nameClientTextField)
//        view.addSubview(surnameClientTextField)
//        view.addSubview(passClientTextField)
//        view.addSubview(fourDigitsClientTextField)
//        view.addSubview(cardNomberClientTextField)
//        view.addSubview(mailClientTextField)
    }
    func setDeveloperTextViews(){
//переход на второй контроллер и заполнение 7 текстфилдов: емейл, имя, фамилия, номер банковской карты, технология(к примеру ios, android, web), язык на котором пишет, опыт в годах.
        
        mailDevTextField = setTextField(placeholder: "укажите почту", y: view.bounds.height * 0.1)
        
        nameDevTextField = setTextField(placeholder: "введите имя", y: view.bounds.height * 0.2)
        surnameDevTextField = setTextField(placeholder: "введите фамилию", y: view.bounds.height * 0.3)
        cardNomberDevTextField = setTextField(placeholder: "номер карты", y: view.bounds.height * 0.4)
        tehDevTextField = setTextField(placeholder: "технология", y: view.bounds.height * 0.5)
        langDevTextField = setTextField(placeholder: "используемый язык", y: view.bounds.height * 0.6)
        expirienceDevTextField = setTextField(placeholder: "опыт работы", y: view.bounds.height * 0.7)
        
//        view.addSubview(mailDevTextField)
//        view.addSubview(nameDevTextField)
//        view.addSubview(surnameDevTextField)
//        view.addSubview(cardNomberDevTextField)
//        view.addSubview(tehDevTextField)
//        view.addSubview(langDevTextField)
//        view.addSubview(expirienceDevTextField)
    }
    
    func setSaveButton(){

        currentButton = UIButton()
        
        currentButton.frame = CGRect(x: view.bounds.width * 0.25, y: view.bounds.height * 0.85, width: view.bounds.width * 0.5, height: view.bounds.height * 0.1)
        currentButton.setTitle("Сохранить", for: .normal)
        currentButton.backgroundColor = .black
        currentButton.setTitleColor(UIColor.white, for: .normal)
        currentButton.titleLabel?.adjustsFontSizeToFitWidth = true
        currentButton.addTarget(self, action: #selector(VC5_5_SecondView.buttonPressed(sender:)), for: UIControlEvents.touchUpInside)
        saveButton = currentButton
        view.addSubview(saveButton)
    }
    @objc func buttonPressed(sender: UIButton){
        let alert = UIAlertController(title: "Ow..", message: "Вы же знаете, что никуда эти данные не сохранятся", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Да, я понимаю", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

    func setTextField(placeholder: String, y: CGFloat ) -> UITextField{
        
        currentTextField = UITextField()
        currentTextField.backgroundColor = .orange
        currentTextField.placeholder = placeholder
        currentTextField.textAlignment = .center
        currentTextField.font = UIFont.systemFont(ofSize: 26)
        currentTextField.adjustsFontSizeToFitWidth = true
        currentTextField.contentScaleFactor = 0.5
        
        currentTextField.bounds = CGRect(x: 0, y: 0, width: view.bounds.width * 0.9, height: view.bounds.height * 0.08)
        currentTextField.center = CGPoint(x: view.bounds.width * 0.5, y: y )
        
        currentTextField.textColor = .darkGray
        currentTextField.delegate = self
        view.addSubview(currentTextField)
        return currentTextField
    }
    
}


