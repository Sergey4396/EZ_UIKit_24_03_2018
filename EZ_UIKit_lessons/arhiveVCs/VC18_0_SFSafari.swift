

import UIKit
import SafariServices

class VC18_0_SFSafari: MyVC, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

  
        
        let url = URL(string: "https://google.com")!
        let controller = SFSafariViewController(url: url)
        self.present(controller, animated: true, completion: nil)
        controller.delegate = self
    
//        let safariVC = SFSafariViewController(url: NSURL(string: "www.google.com")! as URL)
//        self.present(safariVC, animated: true, completion: nil)
//        safariVC.delegate = self
        
        
//        let url = URL(string: "https://youtube.com")
//        init(url URL: URL,
//        configuration: SFSafariViewController.Configuration)

    }
    
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }



}
