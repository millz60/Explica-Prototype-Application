//
//  SettingsViewController.swift
//  Explica
//
//  Created by Matt Milner on 8/8/17.
//  Copyright © 2017 Matt Milner. All rights reserved.
//

import UIKit
import AVFoundation

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
    let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    let color3 = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0)
    let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
    let color5 = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var popOutMenu: UIView!
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var settingsTableView: UITableView!
    @IBOutlet weak var tableBackground: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var pageHeader: UILabel!
    
    let settingsList = ["About", "Notification Settings", "Connect with Facebook", "Subscribe", "My Favorites", "Version History", "Sounds"]
    
    let menuImages = [UIImage(named: "HomeMenuTransparent"), UIImage(named: "BasketballMenuTransparent"), UIImage(named: "FootballMenuTransparent"), UIImage(named: "MusicMenuTransparent"), UIImage(named: "GamingMenuTransparent")]
    
    var audioPlayer: AVAudioPlayer!
    
    var selectedCellIndex: Int!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageHeader.text = "S E T T I N G S"
        

        
        

        
        let timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(animateGradient), userInfo: nil, repeats: true)
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func animateGradient() {
        
        let gradient = CAGradientLayer()
        var gradientSet = [[CGColor]]()
        var currentGradient: Int = 0
        
        let gradientOne = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0).cgColor
        let gradientTwo = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0).cgColor
        let gradientThree = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0).cgColor
        let gradientFour = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0).cgColor
        let gradientFive = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0).cgColor
        
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        // gradientSet.append([gradientThree, gradientFour])
        //  gradientSet.append([gradientFour, gradientFive])
        //  gradientSet.append([gradientFive, gradientOne])
        
        
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        self.tableBackground.layer.addSublayer(gradient)
        
        
        if currentGradient < gradientSet.count - 1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = kCAFillModeForwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(tableView == settingsTableView){
            
            return self.settingsList.count
            
        } else if (tableView == menuTableView){
            
            return 5
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView == self.menuTableView){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
            
            let currentRow = indexPath.row

            cell.cellImage.image = self.menuImages[currentRow]
            
            
            return cell
            

        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
            
            let currentRow = indexPath.row

            cell.textLabel?.text = self.settingsList[currentRow]
            
            cell.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.5)
            
            cell.textLabel?.backgroundColor = .clear
            
            return cell
            
        }
        
    }
    
    func animateBackground() {
        
        let randomColor = arc4random_uniform(5)
        
        let colorsArray = [self.cyan, self.color2, self.color3, self.color4, self.color5]
        
        
        
        UIView.animate(withDuration: 2.9) {
            self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView == self.settingsTableView){
            return 75
        } else {
            return 51
        }
    }

    @IBAction func menuButtonPressed(){
        
        self.menuTableView.reloadData()
        
        if(self.popOutMenu.isHidden){
            self.popOutMenu.isHidden = false
            self.menuButton.setImage(UIImage(named: "menu_selected" ), for: .normal)
            
            var audioFilePath = Bundle.main.path(forResource: "ExplicaItemSelected", ofType: "mp3")
            
            if audioFilePath != nil {
                
                var audioFileUrl = NSURL.fileURL(withPath: audioFilePath!)
                
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOf: audioFileUrl)
                } catch{
                    print("error")
                }
                self.audioPlayer.setVolume(0.15, fadeDuration: 1.0)
                self.audioPlayer.play()
                
            } else {
                print("audio file is not found")
            }
            
        } else {
            self.popOutMenu.isHidden = true
            self.menuButton.setImage(UIImage(named: "menu" ), for: .normal)
            
            var audioFilePath = Bundle.main.path(forResource: "ExplicaItemSelected", ofType: "mp3")
            
            if audioFilePath != nil {
                
                var audioFileUrl = NSURL.fileURL(withPath: audioFilePath!)
                
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOf: audioFileUrl)
                } catch{
                    print("error")
                }
                self.audioPlayer.setVolume(0.15, fadeDuration: 1.0)
                self.audioPlayer.play()
                
            } else {
                print("audio file is not found")
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView == self.menuTableView){
            self.selectedCellIndex = indexPath.row
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "MenuSegue"){
            
            let destination = segue.destination as! SecondHomeViewController
            
            let sender2 = sender as! MenuTableViewCell
            
            
            if(sender2.imageView?.image == menuImages[0]){
                destination.homeSelected = true
                destination.basketballSelected = false
                destination.footballSelected = false
                destination.musicSelected = false
                destination.gamingSelected = false
                destination.articlesTableView.reloadData()
            } else if (sender2.imageView?.image == menuImages[1]){
                destination.homeSelected = false
                destination.basketballSelected = true
                destination.footballSelected = false
                destination.musicSelected = false
                destination.gamingSelected = false
                destination.articlesTableView.reloadData()

            } else if (sender2.imageView?.image == menuImages[2]){
                destination.homeSelected = false
                destination.basketballSelected = false
                destination.footballSelected = true
                destination.musicSelected = false
                destination.gamingSelected = false
                destination.articlesTableView.reloadData()

            } else if (sender2.imageView?.image == menuImages[3]){
                destination.homeSelected = false
                destination.basketballSelected = false
                destination.footballSelected = false
                destination.musicSelected = true
                destination.gamingSelected = false
                destination.articlesTableView.reloadData()

            } else if (sender2.imageView?.image == menuImages[4]){
                destination.homeSelected = false
                destination.basketballSelected = false
                destination.footballSelected = false
                destination.musicSelected = false
                destination.gamingSelected = true
                destination.articlesTableView.reloadData()

            }
            
            
        } else if (segue.identifier == "SettingsSelectionSegue"){
            
            
            let destination = segue.destination as! SettingsSelectionViewController
            
            let sender2 = sender as! UITableViewCell
            
            destination.pageHeaderText = sender2.textLabel!.text!
            
            
        }
        
        
        
        
        
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
