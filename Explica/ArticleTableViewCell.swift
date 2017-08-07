//
//  ArticleTableViewCell.swift
//  Explica
//
//  Created by Matt Milner on 7/29/17.
//  Copyright © 2017 Matt Milner. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articlePhoto: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    var webLink = ""
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
