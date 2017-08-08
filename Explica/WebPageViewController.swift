//
//  WebPageViewController.swift
//  Explica
//
//  Created by Matt Milner on 8/2/17.
//  Copyright © 2017 Matt Milner. All rights reserved.
//

import UIKit
import AVFoundation

class WebPageViewController: UIViewController, UIWebViewDelegate {
    
    var pageURL = ""
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingImage: UIImageView!
    @IBOutlet weak var loadingLogo: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingWebForeground: UIView!

    var audioPlayer: AVAudioPlayer!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let targetURL = URL(string: pageURL)
        self.loadingIndicator.startAnimating()
        
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url: targetURL!))
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadingImage.isHidden = true
        loadingLogo.isHidden = true
        loadingWebForeground.isHidden = true
        self.loadingIndicator.stopAnimating()
        self.loadingIndicator.isHidden = true

    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
