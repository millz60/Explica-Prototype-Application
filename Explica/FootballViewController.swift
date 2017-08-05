//
//  FootballViewController.swift
//  Explica
//
//  Created by Matt Milner on 8/2/17.
//  Copyright © 2017 Matt Milner. All rights reserved.
//

import UIKit

class FootballViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cyan = UIColor(red: 51.0/255.0, green: 227.0/255.0, blue: 210.0/255.0, alpha: 1.0)
    let color2 = UIColor(red: 65.0/255.0, green: 210.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    let color3 = UIColor(red: 253.0/255.0, green: 77.0/255.0, blue: 110.0/255.0, alpha: 1.0)
    let color4 = UIColor(red: 53.0/255.0, green: 230.0/255.0, blue: 215.0/255.0, alpha: 1.0)
    let color5 = UIColor(red: 89.0/255.0, green: 68.0/255.0, blue: 251.0/255.0, alpha: 1.0)

    @IBOutlet weak var feedView: UITableView!
    @IBOutlet weak var tableBackground: UIView!

    
    let articleTitles = ["NFL: Quarterbacks returning from injuries.","Le’Veon Bell vs. Ezekiel Elliott","O.J. Simpson granted parole.","Top 10 all-time greatest running backs.","Pre-season Top 25 college football poll.","Antonio Brown vs. Julio Jones","NFL: Top defensive teams this season.","NFL: Fantasy football sleepers.","Von Miller vs. Jadeveon Clowney"]
    
    let webLinks = ["http://explica.co/nfl-qbs-injury-2017/","http://explica.co/leveon-bell-v-ezekiel-elliott/","http://explica.co/oj-simpson-parole-17/", "http://explica.co/nfl-all-time-rb/", "http://explica.co/colleges-top-25/","http://explica.co/antonio-brown-vs-julio-jones/","http://explica.co/nfl-top-defense-17/","http://explica.co/nfl-sleepers-17/","http://explica.co/von-miller-v-jadaveon-clowney/"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.feedView.delegate = self
        
        self.feedView.backgroundColor = UIColor.clear
        
        let randomColor = arc4random_uniform(5)
        
        let colorsArray = [self.cyan, self.color2, self.color3, self.color4, self.color5]
        self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
        
        let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(animateBackground), userInfo: nil, repeats: true)

        
        // Do any additional setup after loading the view.
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
        cell.articlePhoto.image = UIImage(named: String(currentRow+9))
        cell.webLink = webLinks[currentRow]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 179
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationController = segue.destination as! WebPageViewController
        
        let sender2 = sender as! ArticleTableViewCell
        
        let selectedURL = sender2.webLink
        
        destinationController.pageURL = selectedURL
        
        
    }
    /*
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        let colorsArray = [self.cyan, self.color2, self.color3, self.color4, self.color5]
        
        let randomColor = arc4random_uniform(5)
        print(randomColor)
        
        
        self.tableBackground.backgroundColor =  colorsArray[Int(randomColor)]
        
        UIView.animate(withDuration: 5.0) {
            self.tableBackground.backgroundColor = UIColor(red: 248.0/255.0, green: 254.0/255.0, blue: 255.0/255.0, alpha: 1.0)
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


