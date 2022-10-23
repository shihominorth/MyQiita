//
//  ArticleListItemCollectionViewCell.swift
//  MyQiita
//
//  Created by 北島　志帆美 on 2022-10-20.
//

import UIKit

class ArticleListItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var publisherNameLabel: UILabel!
    @IBOutlet weak var pusblisherImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
