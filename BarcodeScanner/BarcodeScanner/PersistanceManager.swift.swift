//
//  PersistanceManager.swift.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 12/08/2022.
//

import Foundation
import RealmSwift

class PersistanceManager {
    
    private func getRealm() -> Realm {
        do {
            return try Realm()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        fatalError("Could not get Realm instance")
    }
    
    func getHistory() -> [HistoryItem] {
        let realm = getRealm()
        return Array(realm.objects(HistoryItem.self).sorted(byKeyPath: "timestamp", ascending: false))
    }

    func addHistoryItem(_ product: Item_attributes) {
        DispatchQueue.global(qos: .background).async {
            guard let barcode = product.upc else { return }

            let realm = self.getRealm()

            do {
                let item = HistoryItem()

                item.barcode = barcode
                item.productName = product.title
                item.category = product.category
                item.imageUrl = product.image
                item.timestamp = Date()
                item.brand = product.brand
                
    //            item.barcode = barcode
    //            item.productName = product.name
    //            item.quantity = product.quantity
    //            item.packaging = product.packaging?.compactMap {$0}.joined(separator: ", ")
    //            item.labels = product.labels?.compactMap {$0}.joined(separator: ", ")
    //            item.imageUrl = product.imageUrl
    //            item.nutriscore = product.nutriscore
    //            item.novaGroup.value = product.novaGroup
    //            item.ecoscore = product.ecoscore
    //            item.timestamp = Date()
    //
    //            if let brands = product.brands, !brands.isEmpty {
    //                item.brand = brands[0]
    //            }

                try realm.write {
                    realm.add(item, update: .all)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
    //            AnalyticsManager.record(error: error)
            }
        }
    }
    
    func removeHistroyItem(_ item: HistoryItem) {
        let realm = self.getRealm()

        do {
            try realm.write {
                realm.delete(item)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    func clearHistory() {
        DispatchQueue.global(qos: .background).async {
            let realm = self.getRealm()

            do {
                try realm.write {
                    realm.delete(realm.objects(HistoryItem.self))
                }
            } catch let error as NSError {
//                AnalyticsManager.record(error: error)
            }
        }
    }

}
