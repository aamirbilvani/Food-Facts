//
//  SearchProductsVC.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 04/08/2022.
//

import UIKit

class SearchProductsVC: UIViewController {

    @IBOutlet weak var productsSearchBar: UISearchBar!
    @IBOutlet weak var productsSearchTableView: UITableView!
    
    var dataArray: [String] = ["dataArray", "dataArray", "dataArray", "dataArray", "dataArray"]
//    var filteredArray: [String] = ["filteredArray", "filteredArray", "filteredArray", "filteredArray", "filteredArray"]
    
    var filteredArray: [OpenFoodFactsProducts] = []
        var shouldShowSearchResults = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productsSearchTableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        productsSearchTableView.delegate = self
        productsSearchTableView.dataSource = self
        
        productsSearchBar.delegate = self

        self.title = "Search"
    }
    
    func showSimpleAlert(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

extension SearchProductsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shouldShowSearchResults ? filteredArray.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell

        
        if shouldShowSearchResults {
            cell.setupData(product: filteredArray[indexPath.row])
        }
        else {
//            cell.nameLabel.text = "\(dataArray[indexPath.row]) \(indexPath.row)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension SearchProductsVC: UISearchBarDelegate {
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//          shouldShowSearchResults = true
//          productsSearchTableView.reloadData()
//      }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            shouldShowSearchResults = false
            filteredArray.removeAll()
            searchBar.endEditing(true)
            DispatchQueue.main.async {
                self.productsSearchTableView.reloadData()
            }
//            productsSearchTableView.reloadData()
        } else {
            if searchText.count > 2 {
                shouldShowSearchResults = true
                WebService.shared.getSearchedFoodFactsProduct(query: searchText.lowercased()) { [weak self] products, error, response in
                    
                    guard let self = self else { return }
                    guard error == nil else {
                        print(error?.localizedDescription)
                        //                    barcodeCapture.isEnabled = true
                        self.showSimpleAlert(errorMessage: error?.localizedDescription ?? "Error Found!")
                        return
                    }
                    
                    guard response as? HTTPURLResponse == nil else {
                        print("Error with the response, unexpected status code: \(response)")
                        //                          barcodeCapture.isEnabled = true
                        self.showSimpleAlert(errorMessage: response?.description ?? "Error Found!")
                        return
                    }
                    
                    
                    
                    guard let product = products else { return }
                    guard product.products!.count > 0 else {
//                        self.showSimpleAlert(errorMessage: "Product Not Found!")
                        return
                    }
                    self.filteredArray = product.products ?? []
                    
                    DispatchQueue.main.async {
                        self.productsSearchTableView.reloadData()
                    }
                    
                }
            }
        }

//        DispatchQueue.main.async {
//            self.productsSearchTableView.reloadData()
//        }
        
    }

}
