//
//  ArticleListTableViewCell.swift
//  Citrix
//
//  Created by Pranay Joshi on 12/06/22.
//

import UIKit

class ArticleListTableViewCell: UITableViewCell {
    // MARK: - Declarations for outlets and variables.
    @IBOutlet weak var articleView: UIView!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var abstract: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var author: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        articleView.layer.cornerRadius = 10.0
        articleView.layer.borderWidth = 0.6
        articleView.layer.borderColor = UIColor(red: 34.0/255.0, green: 8.0/255.0, blue: 220.0/255.0, alpha: 0.4).cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - Load Data to load MovieListTableViewCell.
    func loadData(data: ArticleListModel){
        author.text = data.authorName
        articleTitle.text = data.title
        createdAt.text = data.publishedDate
        abstract.text = data.abstract
        let articleImageLink = data.imageUrl
        if(articleImageLink == "")
        {
            articleImage.image = UIImage(named: "brokenImage")
        }
        else
        {
            articleImage.imageFromURL(urlString: articleImageLink)
        }
    }
    
}
