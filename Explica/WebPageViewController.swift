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
    @IBOutlet weak var backButton: UIButton!

    var audioPlayer: AVAudioPlayer!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let targetURL = URL(string: pageURL)
        self.loadingIndicator.startAnimating()
        
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url: targetURL!))
        
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(animateBackButton), userInfo: nil, repeats: true)

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateBackButton(){
        
        let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        
        let randomColor = arc4random_uniform(3)
        
        let colorsArray = [cyan, color2, color4]
        
        print(randomColor)
        

        UIView.animate(withDuration: 0.1, animations: {
            
            self.backButton.titleLabel?.textColor =  cyan
        
        }) { (true) in
            
            
            UIView.animate(withDuration: 2.9, animations: {
                
                self.backButton.titleLabel?.textColor =  colorsArray[Int(randomColor)]
                
            }) { (true) in
            
            }}
        
        
        
        
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
