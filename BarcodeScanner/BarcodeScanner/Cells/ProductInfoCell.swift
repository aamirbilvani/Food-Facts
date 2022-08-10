//
//  ProductInfoCell.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 02/08/2022.
//

import UIKit
import Kingfisher

class ProductInfoCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(product: Products) {
        titleLabel.text = product.title
        brandLabel.text = product.brand
        descLabel.text = product.description
        let url = URL(string: product.images?[0] ?? "https://images.openfoodfacts.org/images/products/301/762/042/2003/front_en.399.400.jpg")
        productImageView.kf.setImage(with: url)
    }
    
    func setupData(product: OpenFoodFactsProducts) {
        titleLabel.text = product.product_name
        brandLabel.text = product.brands
        descLabel.text = ""
        let url = URL(string: product.image_url ?? "https://images.openfoodfacts.org/images/products/301/762/042/2003/front_en.399.400.jpg")
        productImageView.kf.setImage(with: url)
    }
    
    
    
}
