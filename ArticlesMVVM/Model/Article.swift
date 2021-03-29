//
//  Article.swift
//  ArticlesMVVM
//
//  Created by Neria Jerafi on 29/03/2021.
//

import Foundation

struct ArticleList:Decodable {
    let data:[Article]
}
struct Article:Decodable {
    let title:String
    let imageUrl:String
    let isLiked:Bool
    let author:Author
}
struct Author:Decodable {
    let authorName:String
    let authorAvatar:AuthorAvatar
}
struct AuthorAvatar:Decodable {
    let imageUrl:String
}
