//
//  ViewController.swift
//  ArticlesMVVM
//
//  Created by Neria Jerafi on 29/03/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var articleTableView: UITableView!{
        didSet{
            articleTableView.register(ArticleCell.nib(), forCellReuseIdentifier: ArticleCell.identifier)
            articleTableView.rowHeight = UITableView.automaticDimension
            articleTableView.estimatedRowHeight = 88.0
            articleTableView.dataSource = self
        }
    }
    var articleListVM: ArticleListViewModel! {
        didSet{
            articleListVM.fetchNumber { [weak self](succeed) in
                guard let strongSelf = self else { return}
                if succeed{
                    strongSelf.articleTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articleListVM = ArticleListViewModel()
    }
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleListVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.identifier, for: indexPath) as! ArticleCell
        cell.articleVM = articleListVM.articleViewModel(atIndex: indexPath.row)
        return cell
    }
    
    
}

