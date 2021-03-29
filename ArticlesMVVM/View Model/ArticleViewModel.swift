//
//  ArticleViewModel.swift
//  ArticlesMVVM
//
//  Created by Neria Jerafi on 29/03/2021.
//

import Foundation

class ArticleListViewModel{
 private(set) var articles:[Article] = []
    func fetchNumber(completion:@escaping (Bool)->()){
        WebService.getRequest {[weak self] (result:Result<ArticleList,WebServiceError>) in
            guard let strongSelf = self else { return}
            switch result {
            case .success(let data):
                strongSelf.articles = data.data
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
    
    var count: Int {
        return articles.count
    }
    
    func articleViewModel(atIndex index:Int) -> ArticleViewModel {
       return ArticleViewModel(withArticle: articles[index])
    }
}

class ArticleViewModel {
   private(set) var article:Article
    init(withArticle article:Article) {
        self.article = article
    }
    var title: String {
        article.title
    }
    var isLiked: Bool {
        article.isLiked
    }
    var bgImageUrl: String {
        article.imageUrl
    }
    var authorName: String {
        article.author.authorName
    }
    var avatarImageUrl: String {
        article.author.authorAvatar.imageUrl
    }
}
