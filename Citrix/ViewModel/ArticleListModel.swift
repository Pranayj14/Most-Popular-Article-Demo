//
//  ArticleListModel.swift
//  Citrix
//
//  Created by Pranay Joshi on 12/06/22.
//

import Foundation

class ArticleListModel: NSObject {
    // MARK: - Declarations for outlets and variables.
    var title = String()
    var publishedDate = String()
    var abstract = String()
    var imageUrl = String()
    var authorName = String()
    
    // MARK: - Parse mostPopularArticle  detail data.
    func parseData(articleObject:NSDictionary){
        title = articleObject["title"] as? String ?? ""
        publishedDate = articleObject["published_date"] as? String ?? ""
        abstract = articleObject["abstract"] as? String ?? ""
        let imageArray = articleObject["media"] as! [NSDictionary]
        if(imageArray.count > 0)
        {
            let image0Array = imageArray[0]["media-metadata"] as! [NSDictionary]
            imageUrl = image0Array[0]["url"] as? String ?? ""
        }
        authorName = articleObject["byline"] as? String ?? ""
    }
}
