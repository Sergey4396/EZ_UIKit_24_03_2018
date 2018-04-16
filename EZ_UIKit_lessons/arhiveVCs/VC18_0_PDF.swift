
import UIKit
import WebKit

class VC18_0_PDF: MyVC, UIWebViewDelegate {
    var toolBar : UIToolbar!
    var webView: UIWebView!
    //    var webView: WKWebView!
    //    var barItem :  UIBarButtonItem!
    let application = UIApplication.shared
    
    var items = [UIBarButtonItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView()
        webView.bounds = CGRect(x: 0, y: 0, width: w, height: h95)
        webView.center = CGPoint(x: w50, y: h * 0.475)
        webView.backgroundColor = .gray
        //webView.delegate = self
        webView.delegate = self
        webView.scalesPageToFit = true
        
        if let urlPDF = Bundle.main.url(forResource: "patterns 2", withExtension: "pdf") {
            let request = URLRequest(url: urlPDF)
            webView.loadRequest(request)
            
            print("🔵")
            print("urlPDF.port = \(String(describing: urlPDF.port)), urlPDF.user = \(String(describing: urlPDF.user)), urlPDF.scheme = \(String(describing: urlPDF.scheme))")
            
        }
        view.addSubview(webView)
        
        
        toolBar = UIToolbar()
        toolBar.barTintColor = .green
        toolBar.tintColor = .white
        toolBar.bounds = CGRect(x: 0, y: 0, width: w, height: h5)
        toolBar.center = CGPoint(x: w50, y: h * 0.975)
        toolBar.backgroundColor = .lightGray
        view.addSubview(toolBar)
        
        items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapsOnAdd))
        )
        items.append(
            UIBarButtonItem(title: "reload", style: .plain, target: self  , action: #selector(tapsReload))
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .undo, target: self, action: #selector(backItemPressed))
        )
        items.append(UIBarButtonItem(title: "<<", style: .plain, target: self  , action: #selector(backItemPressed)))
        items.append(UIBarButtonItem(title: ">>", style: .done, target:  self, action: #selector(forwardItemPressed)))
        
        
        toolBar.setItems(items, animated: true)
        
        
        
        
        //        tabBar = UITabBar()
        //        tabBar.tintColor = .green
        //        tabBar.bounds = CGRect(x: 0, y: 97.5, width: w, height: h5)
        //        tabBar.center = CGPoint(x: w50, y: h * 0.975)
        //        tabBar.barTintColor = .red
        //        view.addSubview(tabBar)
        //
        //        barItem = UIBarButtonItem()
        //        barItem.title = ">"
        
        
    }
    
    @objc func tapsReload(){
        if let url2 = URL(string: "https://apple.com") {
            let request2 = URLRequest(url: url2)
            webView.loadRequest(request2)
        }
        
    }
    
    @objc func tapsOnAdd(){
        print("add tapped")
    }
    @objc func backItemPressed(){
        if webView.canGoBack{
            print("🛑canGoBack")
            webView.goBack()
        }
        else{
            print("🛑can not go back")
        }
        
    }
    @objc func forwardItemPressed(){
        if webView.canGoForward{
            print("🛑canGoForvard")
            webView.goForward()
        }
        else{
            print("🛑can not go forvard")
        }
    }
    @objc func reloadItemPressed(){
        webView.reload()
        
    }
    
    //    func didFinishNavigation(_ webView: WKWebView) {
    //        print("🔷 webViewDidStartLoad is called ")
    //
    //    }
    //    private func webView(webView: WKWebView!, didFinishNavigation navigation: WKNavigation!) {
    //        print("🔷 Finished navigating to url \(String(describing: webView.url))");
    //    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("🔔 webViewDidStartLoad")
        items[4].isEnabled = false
        items[5].isEnabled = false
        application.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("🔷🔔🔷 and now webViewDidFinishLoad")
        
        items[4].isEnabled = true
        items[5].isEnabled = true
        
        application.isNetworkActivityIndicatorVisible = false
        
        
        
    }
    //    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
    //        return true
    //    }
    
    
}

