//
//  HistoryItem.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 12/08/2022.
//

import Foundation
import RealmSwift

enum Age: Int {
    case last24h
    case fewDays
    case fewWeeks
    case fewMonths
    case longTime
}

class HistoryItem: Object {
    @objc dynamic var barcode = ""
    @objc dynamic var productName: String?
    @objc dynamic var brand: String?
    @objc dynamic var category: String?
//    @objc dynamic var quantity: String?
//    @objc dynamic var packaging: String?
//    @objc dynamic var labels: String?
    @objc dynamic var imageUrl: String?
    @objc dynamic var timestamp = Date()
//    @objc dynamic var nutriscore: String?
//    @objc dynamic var ecoscore: String?
//    let novaGroup = RealmOptional<Int>()

    var age: Age {
        let days: Double = 1 * 60 * 60 * 24
        let interval = (abs(timestamp.timeIntervalSinceNow) / days).rounded()
        switch interval {
        case 0:
            return .last24h
        case 1...7:
            return .fewDays
        case 8...30:
            return .fewWeeks
        case 31...90:
            return .fewMonths
        default:
            return .longTime
        }
    }

    override static func primaryKey() -> String? {
        return "barcode"
    }
}
