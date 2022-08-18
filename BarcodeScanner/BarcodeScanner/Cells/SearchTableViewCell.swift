//
//  SearchTableViewCell.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 04/08/2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupData(product: OpenFoodFactsProducts) {
        nameLabel.text = product.product_name
//        brandLabel.text = product.brands
//        descLabel.text = ""
        let url = URL(string: product.image_url ?? "https://peugeot.navigation.com/static/WFS/Shop-CitroenEMEA-Site/-/Shop/en_US/Product%20Not%20Found.png")
        productImageView.kf.setImage(with: url)
    }
    
}
