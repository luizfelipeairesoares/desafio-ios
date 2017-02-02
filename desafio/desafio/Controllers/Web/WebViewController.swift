//
//  WebViewController.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, ControllersProtocol {
    
    @IBOutlet weak var webView: UIWebView!
    
    private var currentURL: URL?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Github Webview"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = self.currentURL {
            self.webView.loadRequest(URLRequest(url: url))
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.currentURL = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func assignURL(url: URL) {
        self.currentURL = url
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WebViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.showLoading()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.hideLoading()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.hideLoading()
    }
    
}
