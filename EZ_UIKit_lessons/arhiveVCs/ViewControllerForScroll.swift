

import UIKit

class ViewControllerForScroll: UIViewController, UITextFieldDelegate {
    
    var scrolView : UIScrollView!
    
    var textField1 : UITextField!
    var textField2 : UITextField!
    var textField3 : UITextField!
    var textField4 : UITextField!
    var textField5 : UITextField!
    var currentTextField : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        scrolView = UIScrollView(frame: view.bounds)
        scrolView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 2)
        scrolView.isScrollEnabled = false
        view.addSubview(scrolView)
        
        textField1 = makeTextField(placeholder: "первое поле", y: 10)
        textField2 = makeTextField(placeholder: "второе поле", y: 25)
        textField3 = makeTextField(placeholder: "третье поле", y: 40)
        textField4 = makeTextField(placeholder: "4 поле", y: 55)
        textField5 = makeTextField(placeholder: "5 поле", y: 70)
    }
    
    
    func makeTextField(placeholder: String, y: CGFloat, x : CGFloat = 50, width: CGFloat = 90, height: CGFloat = 8, bacgroundColor : UIColor = .orange ) -> UITextField{
        
        currentTextField = UITextField()
        currentTextField.backgroundColor = bacgroundColor
        currentTextField.placeholder = placeholder
        currentTextField.textAlignment = .center
        currentTextField.font = UIFont.systemFont(ofSize: 26)
        currentTextField.adjustsFontSizeToFitWidth = true
        currentTextField.contentScaleFactor = 0.5
        
        currentTextField.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * width / 100, height: self.view.bounds.height * height / 100)
        currentTextField.center = CGPoint(x: self.view.bounds.width * x / 100, y: self.view.bounds.height * y / 100)
        
        currentTextField.textColor = .darkGray
        currentTextField.delegate = self
        scrolView.addSubview(currentTextField)
        return currentTextField
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        print("textFieldShouldBeginEditing - можно ли редактировать true - можно, false - нельзя")
        if textField.center.y > view.bounds.height * 0.4{
            
            addNotificationForMoovingTEXTFIELDWithKeybard(height: textField.center.y )
        }
        
        return true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("textFieldShouldReturn == хотите убрать клавиатуру")
        if textField == textField1{
            
            textField2.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        if textField == textField2{
            
            textField3.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        if textField == textField3{
            
            textField4.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        if textField == textField4{
            
            textField5.becomeFirstResponder()// переносит внимание на следующие текстфилд
            return true
        }
        else{
            textField.resignFirstResponder()// убирает клавиатуру, убирает внимание с текстфилда
            return true
        }
    }
    
    
    func addNotificationForMoovingTEXTFIELDWithKeybard(height: CGFloat){
        
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (nc) in

            self.scrolView.scrollRectToVisible(CGRect(x: self.view.bounds.width * 0.5, y: height - self.view.bounds.height * 0.3, width: self.view.bounds.width, height: self.view.bounds.height), animated: true)
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (nc) in

            self.scrolView.scrollRectToVisible(CGRect(x: self.view.bounds.width * 0.5, y: 0.0, width: self.view.bounds.width, height: self.view.bounds.height), animated: true)
        }
        
        
    }

}
