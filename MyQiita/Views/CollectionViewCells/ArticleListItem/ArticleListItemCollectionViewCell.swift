//
//  ArticleListItemCollectionViewCell.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-24.
//

import UIKit

class ArticleListItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publisherNameLabel: UILabel!
    @IBOutlet weak var publisherImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        contentView.layer.cornerRadius = 10
    }

}
