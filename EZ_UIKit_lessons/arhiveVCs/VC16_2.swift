
import UIKit

class VC16_2: MyVC {
    var slider : UISlider!
    
    var detailImageView : UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        detailImageView = ssImageView(image: currentCartoonImageName, y: 35, x: 50, width: 100, height: 60)
  //      detailImageView.image = myImage
        
        slider = ssSlider(width: 40, height: 10, x: 10, y: 80)
        
        let rotationAngle = -CGFloat(Double.pi / 2)
        slider.transform = CGAffineTransform(rotationAngle: rotationAngle)
        slider.value = 0.8
        
        let _ = ssPickerView(width: 70, height: 30, x: 60, y: 80)
        
        let _ = ssButton(title: "back", width: 10, height: 5, x: 7, y: 7)
    }


    override func ffSlider(sender: UISlider) {
        detailImageView.alpha = CGFloat(sender.value)
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            detailImageView?.contentMode = .bottom
        case 1:
            detailImageView?.contentMode = .scaleAspectFill
        case 2:
            detailImageView?.contentMode = .scaleAspectFit
        case 3:
            detailImageView?.contentMode = .scaleToFill
        case 4:
            detailImageView?.contentMode = .topLeft
        case 5:
            detailImageView?.contentMode = .redraw
        default:
            detailImageView?.contentMode = .bottom
        }
    }
    override func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            return ".bottom"
        case 1:
            return ".scaleAspectFill"
        case 2:
            return ".scaleAspectFit"
        case 3:
            return ".scaleToFill"
        case 4:
            return ".topLeft"
        case 5:
            return ".redraw"
        default:
            return ".bottom"
        }
    }
    
    override func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     return 6
    }
    override func ffButton(sender: UIButton) {
        goToVC(VC: VC16_1())
    }

}



