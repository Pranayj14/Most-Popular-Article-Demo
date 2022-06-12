//
//  ViewController.swift
//  Citrix
//
//  Created by Pranay Joshi on 11/06/22.
//

import UIKit

class ArticleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Declarations for outlets and variables.
    let services = CitrixService()
    var articleList = [AnyObject]()
    @IBOutlet weak var articleListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Article List"
        articleListTableView.register(UINib(nibName: "ArticleListTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleListTableViewCell")
        // Customizing our navigation bar
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 0.4)
        appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
                                          .foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .black
        mostPopular()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - mostPopular function called to get popular article list.
    func mostPopular()
    {
        services.mostPopular { response, error in
            guard let data = response else{return}
            self.articleList = data["results"] as! [AnyObject]
            DispatchQueue.main.async {
                self.articleListTableView.reloadData()
            }
            
        }
    }
    
    // MARK: - Displays numberOfRowsInSection according to array count in tableview.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    // MARK: - Loads tableview cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListTableViewCell", for: indexPath) as! ArticleListTableViewCell
        let articleObject = ArticleListModel()
        articleObject.parseData(articleObject:articleList[indexPath.row] as! NSDictionary)
        cell.loadData(data: articleObject)
        return cell
    }
    
    // MARK: - This function is used for implementation of pagination.
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    // MARK: - Selects a particular cell in tableview or navigates to particular controller on cell selection.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ArticleWebviewViewController") as! ArticleWebviewViewController
        vc.webUrl = articleList[indexPath.row]["url"] as? String ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

