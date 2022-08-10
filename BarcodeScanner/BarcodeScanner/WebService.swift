//
//  WebService.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 02/08/2022.
//

import Foundation

class WebService {
    
    static let shared = WebService()
        
    init(){}
    
    
    func getProduct(from barcode: String, completion: @escaping (BarcodeProductModel?, Error?, URLResponse?) -> Void) {
        guard !barcode.isEmpty else { return }
        let url = URL(string: "https://api.barcodelookup.com/v3/products?barcode=\(barcode)&formatted=y&key=wpjx76f40s2g94auzjpzy0z1pftkdu")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                print("Error with fetching films: \(error)")
                completion(nil, error, nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(response)")
                      completion(nil, nil, response)
                      return
                  }
            
            if let data = data,
               let product = try? JSONDecoder().decode(BarcodeProductModel.self, from: data) {
                completion(product, nil, nil)
            }
        }
        task.resume()
    }
    
    func getFoodFactsProduct(from barcode: String, completion: @escaping (OpenFoodFactsProductModel?, Error?, URLResponse?) -> Void) {
        guard !barcode.isEmpty else { return }
        let url = URL(string: "https://world.openfoodfacts.org/api/v2/search?code=\(barcode)&fields=code,product_name,brands,nutriments")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let error = error {
                print("Error with fetching films: \(error)")
                completion(nil, error, nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(response)")
                      completion(nil, nil, response)
                      return
                  }
            
            if let data = data,
               let product = try? JSONDecoder().decode(OpenFoodFactsProductModel.self, from: data) {
                
                print("Product:", product)
                completion(product, nil, nil)
            }
        }
        task.resume()
    }
    
    
    
    func getSearchedFoodFactsProduct(query: String, completion: @escaping (OpenFoodFactsProductModel?, Error?, URLResponse?) -> Void) {
        guard !query.isEmpty else { return }
        let url = URL(string: "https://world.openfoodfacts.org/cgi/search.pl?search_terms=\(query)&search_simple=1&action=process&json=1&page=1&fields=code,product_name,brands,image_url")
        guard let url = url else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Error with fetching films: \(error)")
                completion(nil, error, nil)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(response)")
                      completion(nil, nil, response)
                      return
                  }
            
            if let data = data,
               let product = try? JSONDecoder().decode(OpenFoodFactsProductModel.self, from: data) {
                
                print("Product:", product)
                completion(product, nil, nil)
            }
        }
        task.resume()
    }
    

}
