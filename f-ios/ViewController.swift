//
//  ViewController.swift
//  f-ios
//
//  Created by DeNAri on 2016/04/03.
//  Copyright © 2016年 denari01. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var navigationBarItem: UINavigationItem!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loadingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleImageView = UIImageView(image: UIImage(named: "logo"))
        self.navigationBarItem.titleView = titleImageView;
        self.webView.delegate = self;
        let url = NSURL(string: "https://sonoba-webclient.herokuapp.com/#/")
        let urlRequest = NSURLRequest(URL: url!)
        self.webView.loadRequest(urlRequest)
        self.animationStart()
        self.webView.opaque = true
        self.webView.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UIWebViewDelegate
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.animationEnd()
    }
    
    //MARK: - Animation

    func animationStart() {
        let animateOption:UIViewAnimationOptions = [.Repeat, .CurveEaseInOut, .Autoreverse]
        UIView.animateWithDuration(
            1.0,
            delay: 0.0,
            options: animateOption,
            animations: {() -> Void in
                self.logoImageView.transform = CGAffineTransformMakeScale(0.8, 0.8)
            },
            completion: nil)
    }
    
    func animationEnd() {
        let animateOption:UIViewAnimationOptions = [.CurveEaseInOut]
        UIView.animateWithDuration(
            1.0,
            delay: 0.0,
            options: animateOption,
            animations: {() -> Void in
                self.loadingView.alpha = 0
            },
            completion: nil)
        
    }
    
    //MARK: - Browser

    @IBAction func refreshButtonTapped(sender: AnyObject) {
        self.webView.reload()
    }

    @IBAction func backButtonTapped(sender: AnyObject) {
        self.webView.goBack()
    }
    
    @IBAction func closeKeyBoard(sender: AnyObject) {
        self.webView.endEditing(true)
    }
    
}

