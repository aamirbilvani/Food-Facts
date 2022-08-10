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
        let url = URL(string: product.image_url ?? "https://images.openfoodfacts.org/images/products/301/762/042/2003/front_en.399.400.jpg")
        productImageView.kf.setImage(with: url)
    }
    
}
