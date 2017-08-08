//
//  SettingsSelectionViewController.swift
//  Explica
//
//  Created by Matt Milner on 8/8/17.
//  Copyright © 2017 Matt Milner. All rights reserved.
//

import UIKit

class SettingsSelectionViewController: UIViewController {
    
    @IBOutlet weak var pageHeaderLabel: UILabel!
    
    var pageHeaderText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.pageHeaderLabel.text = pageHeaderText.uppercased() 
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
