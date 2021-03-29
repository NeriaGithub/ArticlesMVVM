//
//  ViewExtension.swift
//  ArticlesMVVM
//
//  Created by Neria Jerafi on 29/03/2021.
//

import Foundation
import UIKit

extension UIView{
    func createShadow(radius:CGFloat = 12.0, opacity:Float = 1.0, color:UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))  {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
