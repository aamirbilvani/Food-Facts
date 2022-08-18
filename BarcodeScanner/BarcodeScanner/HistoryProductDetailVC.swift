//
//  HistoryProductDetailVC.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 16/08/2022.
//

import UIKit

class HistoryProductDetailVC: UIViewController {

    
    var product: HistoryItem?
    var stores: [ProductStores] = []
    
    
    @IBOutlet weak var historyDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        historyDetailTableView.register(UINib(nibName: "ProductImageTitleCell", bundle: nil), forCellReuseIdentifier: "ProductImageTitleCell")
        historyDetailTableView.delegate = self
        historyDetailTableView.dataSource = self
    }

}


extension HistoryProductDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductImageTitleCell", for: indexPath) as! ProductImageTitleCell
            if let product = product {
                cell.configure(with: product)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductImageTitleCell", for: indexPath) as! ProductImageTitleCell
            
                cell.configure(with: stores[indexPath.row])
            

            return cell
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
