//
//  ProductVC.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 02/08/2022.
//

import UIKit
//import ScanditCaptureCore
import ScanditBarcodeCapture

class ProductVC: UIViewController {

    @IBOutlet weak var productDetailTableView: UITableView!
//    @IBOutlet weak var detailsLabel: UILabel!
//    var barcode: Barcode? = nil
    
    var product: Products? = nil
    var openFoodFactProduct: OpenFoodFactsProducts? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDetailTableView.register(UINib(nibName: "ProductInfoCell", bundle: nil), forCellReuseIdentifier: "ProductInfoCell")
        productDetailTableView.delegate = self
        
        productDetailTableView.dataSource = self
//        self.detailsLabel.text = "barcode_number: \(product.barcode_number) \n Name: \(products.title) \n Category: \(products.category) \n Manufacturer: \(products.manufacturer), \n Brand: \(products.brand)"
//        
//        guard let barcode = barcode, let code = barcode.data else {
//            return
//        }
//
//        WebService.shared.getProduct(from: code) { [weak self] product, error in
//            print(product)
//            print(error?.localizedDescription)
//            guard let self = self else { return }
//            
//            guard let product = product, let products = product.products?[0] else { return }
//            
//            self.detailsLabel.text = "barcode_number: \(products.barcode_number) \n Name: \(products.title) \n Category: \(products.category) \n Manufacturer: \(products.manufacturer), \n Brand: \(products.brand)"
//            
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productDetailTableView.reloadData()
//        guard let product = product else { return }
//
//        if let barcodeNumber = product.barcode_number,
//           let title = product.title,
//           let category = product.category,
//           let manufacturer = product.manufacturer,
//           let brand = product.brand {
//            self.detailsLabel.text = "barcode_number: \(barcodeNumber) \n Name: \(title) \n Category: \(category) \n Manufacturer: \(manufacturer), \n Brand: \(brand)"
//        }
        
    }

}

extension ProductVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoCell", for: indexPath) as! ProductInfoCell
        guard let product = product else { return UITableViewCell() }
        cell.setupData(product: product)
//        guard let product = openFoodFactProduct else { return UITableViewCell() }
//        cell.setupData(product: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
