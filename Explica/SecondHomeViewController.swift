//
//  SecondHomeViewController.swift
//  Explica
//
//  Created by Matt Milner on 8/7/17.
//  Copyright © 2017 Matt Milner. All rights reserved.
//

import UIKit
import AVFoundation

class SecondHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
    let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    let color3 = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0)
    let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
    let color5 = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var articlesTableView: UITableView!
    @IBOutlet weak var popOutMenu: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var tableBackground: UIView!
    @IBOutlet weak var pageHeaderLabel: UILabel!
    
    var homeSelected = true
    var footballSelected = false
    var basketballSelected = false
    
    var audioPlayer: AVAudioPlayer!
    
    let menuImages = [UIImage(named: "HomeMenuTransparent"), UIImage(named: "BasketballMenuTransparent"), UIImage(named: "FootballMenuTransparent"), UIImage(named: "MusicMenuTransparent"), UIImage(named: "GamingMenuTransparent")]
    
    let HomeScreenArticleTitles = ["Two days to Hellblade release.", "EA just dropped Madden’s soundtrack.", "Neymar leaves Barcelona for PSG.", "Matic goes to Manchester.", "NFL: Quarterbacks returning from injuries.", "The latest from NBA 2K soon.", "One month to Madden 18.", "McGregor and Draymond Green beef on Insta.", "Kyrie Irving requesting trade out of Cleveland."]
    
    let HomeScreenWebLinks = ["http://explica.co/hellblade/", "http://explica.co/madden-2018-track/", "http://explica.co/neymar-trade-17/", "http://explica.co/matic-trade-17/","http://explica.co/nfl-qbs-injury-2017/","http://explica.co/nba-2k18/","http://explica.co/madden-2018/", "http://explica.co/draymond-green-mcgregor-beef/", "http://explica.co/kyrie-irving-trade-17/"]
    
    
    
    
    let FootballArticleTitles = ["NFL: Quarterbacks returning from injuries.","Le’Veon Bell vs. Ezekiel Elliott","O.J. Simpson granted parole.","Top 10 all-time greatest running backs.","Pre-season Top 25 college football poll.","Antonio Brown vs. Julio Jones","NFL: Top defensive teams this season.","NFL: Fantasy football sleepers.","Von Miller vs. Jadeveon Clowney"]
    
    let FootballWebLinks = ["http://explica.co/nfl-qbs-injury-2017/","http://explica.co/leveon-bell-v-ezekiel-elliott/","http://explica.co/oj-simpson-parole-17/", "http://explica.co/nfl-all-time-rb/", "http://explica.co/colleges-top-25/","http://explica.co/antonio-brown-vs-julio-jones/","http://explica.co/nfl-top-defense-17/","http://explica.co/nfl-sleepers-17/","http://explica.co/von-miller-v-jadaveon-clowney/"]
    
    let BasketballArticleTitles = ["McGregor and Draymond Green beef on Insta.","Kyrie Irving requesting trade out of Cleveland.","Shaq clowns Lavar, \"I’ll glue this wig to my head.\"","Karl Malone vs. Charles Barkley","Gordon Hayward to Boston Celtics.","Mr. Triple Double wins MVP.","Ranking all 30 NBA franchises.","Clippers no more.","NBA 2017 Draft: Round 1, Grades"]
    
    let BasketballWebLinks = ["http://explica.co/draymond-green-mcgregor-beef/","http://explica.co/kyrie-irving-trade-17/","http://explica.co/oneal-ball-beef/", "http://explica.co/karl-malone-vs-charles-barkley/", "http://explica.co/uta-bos-trade-17/","http://explica.co/russell-westbrook-mvp/","http://explica.co/nba-franchise-17/","http://explica.co/lac-free-agent-17/","http://explica.co/nba-draft-17-r1/"]
    
    let HomeScreenImages = [18,19,20,21,9,22,23,0,1]
    let FootballImages = [9,10,11,12,13,14,15,16,17]
    let BasketballImages = [0,1,2,3,4,5,6,7,8]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(animateBackground), userInfo: nil, repeats: true)
        
        self.articlesTableView.backgroundView?.backgroundColor = .clear
        self.pageHeaderLabel.text = "H O M E"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateBackground() {
        
        let randomColor = arc4random_uniform(5)
        
        let colorsArray = [self.cyan, self.color2, self.color3, self.color4, self.color5]
        
        
        UIView.animate(withDuration: 2.9) {
            self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
            
        }
        
        
        
    }
    
    func loadNewTopic() {
        
        let loadingScreen = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        loadingScreen.backgroundColor = UIColor(red: 248.0/255.0, green: 254.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        let logoImage = UIImageView(frame: CGRect(x: (self.view.frame.size.width)/2 - 100, y: (self.view.frame.size.height)/2 - 225, width: 200, height: 250))
        logoImage.image = UIImage(named: "ExplicaLogo")
        loadingScreen.addSubview(logoImage)
        
        let logoText = UIImageView(frame: CGRect(x: (self.view.frame.size.width)/2 - 100, y: (self.view.frame.size.height)/2, width: 200, height: 100))
        logoText.image = UIImage(named: "ExplicaTextTransparent")
        loadingScreen.addSubview(logoText)
        
        let mottoLabel = UILabel(frame: CGRect(x: (self.view.frame.size.width)/2 - 200, y: (self.view.frame.size.height)/2 + 100, width: 400, height: 50))
        mottoLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 25.0)
        mottoLabel.text = "Noise-cancelling News."
        mottoLabel.textColor = .white
        mottoLabel.textAlignment = .center
        loadingScreen.addSubview(mottoLabel)
        
        let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        
        let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let color3 = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0)
        
        let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        
        let color5 = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        
        self.view.addSubview(loadingScreen)
        
        UIView.animate(withDuration: 0.1, animations: {
            loadingScreen.backgroundColor = color5
        }) { (true) in
            
            
            
            UIView.animate(withDuration: 0.5, animations: {
                loadingScreen.backgroundColor = cyan
            }) { (true) in
                
                UIView.animate(withDuration: 0.5, animations: {
                    loadingScreen.backgroundColor = color2
                }) { (true) in
                    
                    UIView.animate(withDuration: 0.5, animations: {
                        loadingScreen.backgroundColor = color3
                    }) { (true) in
                        
                        UIView.animate(withDuration: 0.5, animations: {
                            loadingScreen.backgroundColor = color4
                        }) { (true) in
                            
                            UIView.animate(withDuration: 0.5, animations: {
                                loadingScreen.backgroundColor = color5
                            }) { (true) in
                                
                                UIView.animate(withDuration: 1.0, animations: {
                                    loadingScreen.alpha = 0.0
                                })
                                
                                
                            }
                        }
                        
                    }
                    
                }
            }
        }
        
        
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if(tableView == articlesTableView){
            
            return 9
            
        } else if (tableView == menuTableView){
            
            return 5
        }
        
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView == self.menuTableView){
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
            
            
            // Configure the cell...
            
            let currentRow = indexPath.row
            
            cell.cellImage.image = menuImages[currentRow]
            cell.backgroundColor = UIColor(red: 248.0/255.0, green: 254.0/255.0, blue: 255.0/255.0, alpha: 1.0)  //248, 254, 255
            
            if(homeSelected && cell.cellImage.image == UIImage(named:"HomeMenuTransparent") ){
                
                cell.backgroundColor = UIColor(red: 255.0/255.0, green: 61.0/255.0, blue: 88.0/255.0, alpha: 1.0) //255, 61, 88
                
            } else if (basketballSelected && cell.cellImage.image == UIImage(named: "BasketballMenuTransparent")){
                
                cell.backgroundColor = UIColor(red: 255.0/255.0, green: 61.0/255.0, blue: 88.0/255.0, alpha: 1.0) //255, 61, 88
                
            } else if (footballSelected && cell.cellImage.image == UIImage(named: "FootballMenuTransparent")){
                
                cell.backgroundColor = UIColor(red: 255.0/255.0, green: 61.0/255.0, blue: 88.0/255.0, alpha: 1.0) //255, 61, 88
                
            }
            
            return cell
        } else {
            
            if(self.homeSelected){
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
                let currentRow = indexPath.row
                
                cell.articleTitle.text = HomeScreenArticleTitles[currentRow]
                cell.articlePhoto.image = UIImage(named: String(HomeScreenImages[currentRow]))
                cell.webLink = HomeScreenWebLinks[currentRow]
                cell.topicLabel.text = "H O M E"
                
                return cell
                
                
            
            } else if(self.footballSelected){
                
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
                let currentRow = indexPath.row
            
                cell.articleTitle.text = FootballArticleTitles[currentRow]
                cell.articlePhoto.image = UIImage(named: String(FootballImages[currentRow]))
                cell.webLink = FootballWebLinks[currentRow]
                cell.topicLabel.text = "F O O T B A L L"

                return cell
            } else if (self.basketballSelected){
                
                
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
                let currentRow = indexPath.row
                
                cell.articleTitle.text = BasketballArticleTitles[currentRow]
                cell.articlePhoto.image = UIImage(named: String(BasketballImages[currentRow]))
                cell.webLink = BasketballWebLinks[currentRow]
                cell.topicLabel.text = "B A S K E T B A L L"
                
                return cell
                
            }

            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // change the articlestableview from here to the correct articles
        
        // highlight menu cell this color: 255, 61, 88 ; then unhighlight all others
        
        // reload articletableviewdata
        
        loadNewTopic()
        
        if(tableView == self.menuTableView){
            
            // Home, Basketball, Football,
            if(indexPath.row == 0){
                
                self.homeSelected = true
                self.footballSelected = false
                self.basketballSelected = false
                
                self.menuButtonPressed()
                self.pageHeaderLabel.text = "H O M E"
                
                
                self.menuTableView.reloadData()
                tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor(red: 255.0/255.0, green: 61.0/255.0, blue: 88.0/255.0, alpha: 1.0)
                self.articlesTableView.reloadData()
                
                
                
                
                
            } else if(indexPath.row == 1){
            
                self.homeSelected = false
                self.footballSelected = false
                self.basketballSelected = true
                
                self.menuButtonPressed()
                self.pageHeaderLabel.text = "B A S K E T B A L L"
                
                
                self.menuTableView.reloadData()
                tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor(red: 255.0/255.0, green: 61.0/255.0, blue: 88.0/255.0, alpha: 1.0)
                self.articlesTableView.reloadData()
                
            
            } else if(indexPath.row == 2){
                
                self.homeSelected = false
                self.footballSelected = true
                self.basketballSelected = false
                
                
                
                self.menuButtonPressed()
                self.pageHeaderLabel.text = "F O O T B A L L"
                
                
                tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor(red: 255.0/255.0, green: 61.0/255.0, blue: 88.0/255.0, alpha: 1.0)
                self.articlesTableView.reloadData()
                
            }
            
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(tableView == self.articlesTableView){
            return 179
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
    
    @IBAction func closeButtonPressed() {
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
            
            let destinationController = segue.destination as! WebPageViewController
            
            let sender2 = sender as! ArticleTableViewCell
            
            let selectedURL = sender2.webLink
            
            destinationController.pageURL = selectedURL
            
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


    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
