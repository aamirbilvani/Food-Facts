//
//  HistoryTableViewCell.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 12/08/2022.
//

import UIKit
import Kingfisher

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(withHistoryItem historyItem: HistoryItem) {
        productNameLabel.text = historyItem.productName ?? historyItem.barcode

        if let brand = historyItem.brand {
            brandNameLabel.text = brand
            brandNameLabel.isHidden = false
        } else {
            brandNameLabel.isHidden = true
        }

        if let imageUrl = historyItem.imageUrl, let url = URL(string: imageUrl) {
            productImageView.kf.indicatorType = .activity
            productImageView.kf.setImage(with: url)
        }

//        if let nutriscoreValue = historyItem.nutriscore, let score = NutriScoreView.Score(rawValue: nutriscoreValue) {
//            nutriscoreView.currentScore = score
//        } else {
//            nutriscoreView.currentScore = .unknown
//        }

//        if let novaGroupValue = historyItem.novaGroup.value,
//            let novaGroup = NovaGroupView.NovaGroup(rawValue: "\(novaGroupValue)") {
//            novaGroupView.novaGroup = novaGroup
//        } else {
//            novaGroupView.novaGroup = .unknown
//        }

        if let category = historyItem.category {
           categoryLabel.text = category
            categoryLabel.isHidden = false 
        } else {
            categoryLabel.isHidden = true
        }

        timeLabel.text = "\(historyItem.age)"
       

    }
    
}
