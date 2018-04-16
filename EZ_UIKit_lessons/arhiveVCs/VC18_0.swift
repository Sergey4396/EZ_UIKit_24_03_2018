//
//  VC18_0.swift
//  EZ_UIKit_lessons
//
//  Created by 1234 on 10.04.2018.
//  Copyright © 2018 Sergey Riabinin. All rights reserved.
//

import UIKit
import WebKit

class VC18_0: MyVC, UIWebViewDelegate, WKNavigationDelegate {
    var toolBar : UIToolbar!
    var webViewNew: UIWebView!
    var webView: WKWebView!
    //    var barItem :  UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.bounds = CGRect(x: 0, y: 0, width: w, height: h95)
        webView.center = CGPoint(x: w50, y: h * 0.475)
        webView.backgroundColor = .gray
//webView.delegate = self
        webView.navigationDelegate = self
        
        if let url = URL(string: "https://apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        view.addSubview(webView)
        
        
        toolBar = UIToolbar()
        toolBar.barTintColor = .green
        toolBar.tintColor = .white
        toolBar.bounds = CGRect(x: 0, y: 0, width: w, height: h5)
        toolBar.center = CGPoint(x: w50, y: h * 0.975)
        toolBar.backgroundColor = .lightGray
        view.addSubview(toolBar)
        
        var items = [UIBarButtonItem]()
        items.append(
            UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
        )
        items.append(
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapsOnAdd))
        )
        items.append(
            UIBarButtonItem(title: "reload", style: .plain, target: self  , action: #selector(reloadItemPressed))
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
        if let url = URL(string: "https://apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
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
    private func webView(webView: WKWebView!, didFinishNavigation navigation: WKNavigation!) {
        print("🔷 Finished navigating to url \(String(describing: webView.url))");
    }
    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//
//    }
//    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
//        return true
//    }
    
    
}
