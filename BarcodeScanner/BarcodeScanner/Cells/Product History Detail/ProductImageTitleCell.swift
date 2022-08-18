//
//  ProductImageTitleCell.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 16/08/2022.
//

import UIKit

class ProductImageTitleCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        productImageView.layer.cornerRadius = 50
        productImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with product: HistoryItem) {
        
        print("Product Item --**--", product)
        if let imageUrl = product.imageUrl, let url = URL(string: imageUrl) {
            productImageView.kf.indicatorType = .activity
            productImageView.kf.setImage(with: url)
        }
        
        productTitle.text = product.productName
        productDesc.text = product.itemDescription
    }
    
    func configure(with store: ProductStores) {
        
        print("Product Item --**--", store)
        if let imageUrl = store.image, let url = URL(string: imageUrl) {
            productImageView.kf.indicatorType = .activity
            productImageView.kf.setImage(with: url)
        }
        
        productTitle.text = store.store_name
        productDesc.text = store.price
    }
    
}
