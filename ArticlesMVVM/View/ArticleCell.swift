//
//  ArticleCell.swift
//  ArticlesMVVM
//
//  Created by Neria Jerafi on 29/03/2021.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var articleVM: ArticleViewModel! {
        didSet{
            backgroundImageView.load(urlString: articleVM.bgImageUrl)
            isLike = articleVM.isLiked
            titleLabel.text = articleVM.title
            authorLabel.text = articleVM.authorName
           avatarImageView.load(urlString: articleVM.avatarImageUrl)
        }
    }
    
    var isLike: Bool = false {
        didSet{
            likeImageView.image = isLike ? UIImage(named: "like_blue") : UIImage(named: "like_gray")
        }
    }
    
    static let identifier = "ArticleCell"
   static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        shadowView.createShadow(radius: 8.0, opacity: 1)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        likeImageView.image = nil
        backgroundImageView.image = nil
        
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
