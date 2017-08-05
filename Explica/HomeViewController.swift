//
//  HomeViewController.swift
//  Explica
//
//  Created by Matt Milner on 8/2/17.
//  Copyright © 2017 Matt Milner. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
    let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    let color3 = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0)
    let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
    let color5 = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0)
    
    
    @IBOutlet weak var feedView: UITableView!
    @IBOutlet weak var popOutMenu: UIView!
    @IBOutlet weak var tableBackground: UIView!
    
    @IBAction func menuButtonPressed(){
        
        if(self.popOutMenu.isHidden){
            self.popOutMenu.isHidden = false
        } else {
            self.popOutMenu.isHidden = true
        }
        
    }
    
    @IBAction func closeButtonPressed() {
    
        if(self.popOutMenu.isHidden){
            self.popOutMenu.isHidden = false
        } else {
            self.popOutMenu.isHidden = true
        }
    }
    
    let articleTitles = ["McGregor and Draymond Green beef on Insta.","Kyrie Irving requesting trade out of Cleveland.","Shaq clowns Lavar, \"I’ll glue this wig to my head.\"","Karl Malone vs. Charles Barkley","Gordon Hayward to Boston Celtics.","Mr. Triple Double wins MVP.","Ranking all 30 NBA franchises.","Clippers no more.","NBA 2017 Draft: Round 1, Grades"]
    
    let webLinks = ["http://explica.co/draymond-green-mcgregor-beef/","http://explica.co/kyrie-irving-trade-17/","http://explica.co/oneal-ball-beef/", "http://explica.co/karl-malone-vs-charles-barkley/", "http://explica.co/uta-bos-trade-17/","http://explica.co/russell-westbrook-mvp/","http://explica.co/nba-franchise-17/","http://explica.co/lac-free-agent-17/","http://explica.co/nba-draft-17-r1/"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.feedView.delegate = self
        
        self.feedView.backgroundColor = UIColor.clear
        
        let randomColor = arc4random_uniform(5)
        
        let colorsArray = [self.cyan, self.color2, self.color3, self.color4, self.color5]
        self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
        
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(animateBackground), userInfo: nil, repeats: true)
        
        let loadingScreen = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        
        loadingScreen.backgroundColor = UIColor(red: 248.0/255.0, green: 254.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        let logoImage = UIImageView(frame: CGRect(x: (self.view.frame.size.width)/2 - 105, y: (self.view.frame.size.height)/2 - 225, width: 200, height: 250))
        logoImage.image = UIImage(named: "ExplicaLogo")
        loadingScreen.addSubview(logoImage)

        let logoText = UIImageView(frame: CGRect(x: (self.view.frame.size.width)/2 - 105, y: (self.view.frame.size.height)/2, width: 200, height: 100))
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
        
        UIView.animate(withDuration: 10.0, animations: {
            loadingScreen.backgroundColor = UIColor.green
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
    
    
    func animateBackground() {
        
        let randomColor = arc4random_uniform(5)
        
        let colorsArray = [self.cyan, self.color2, self.color3, self.color4, self.color5]
        
        UIView.animate(withDuration: 2.9) {
            self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
        }
        
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
        return 9
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
        

        // Configure the cell...
        
        let currentRow = indexPath.row
        
        cell.articleTitle.text = articleTitles[currentRow]
        cell.articlePhoto.image = UIImage(named: String(currentRow))
        cell.webLink = webLinks[currentRow]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 179
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier != "FootballMenuButton"){
            
        let destinationController = segue.destination as! WebPageViewController
        
        let sender2 = sender as! ArticleTableViewCell
        
        let selectedURL = sender2.webLink
        
        destinationController.pageURL = selectedURL
            
        }
        
        
    }
    

  /*
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
       
        
        
        let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        
        let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let color3 = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0)
        
        let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        
        let color5 = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        
        let colorsArray = [cyan, color2, color3, color4, color5]
        
        let randomColor = arc4random_uniform(4)
        
        
        self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]

       
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
        
        let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        let color3 = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0)
        
        let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        
        let color5 = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0)
        
        let colorsArray = [cyan, color2, color3, color4, color5]
        
        let randomColor = arc4random_uniform(4)
        
        
        self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
    }

    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

        let colorsArray = [self.cyan, self.color2, self.color3, self.color4, self.color5]
        
        let randomColor = arc4random_uniform(5)
        print(randomColor)
        
        UIView.animate(withDuration: 0.1, animations: {
            self.tableBackground.backgroundColor =  .white
        }) { (true) in
            self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
            UIView.animate(withDuration: 5.0) {
                self.tableBackground.backgroundColor = UIColor(red: 248.0/255.0, green: 254.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            }
        }
        

        
    }
    
*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
