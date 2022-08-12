//
//  BarcodeSpiderProductModel.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 10/08/2022.
//

import Foundation

struct BarcodeSpiderProductModel : Codable {
    let item_response : Item_response?
    let item_attributes : Item_attributes?
    let stores : [BarcodeSpiderProductModel_Stores]?

    enum CodingKeys: String, CodingKey {

        case item_response = "item_response"
        case item_attributes = "item_attributes"
        case stores = "Stores"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        item_response = try values.decodeIfPresent(Item_response.self, forKey: .item_response)
        item_attributes = try values.decodeIfPresent(Item_attributes.self, forKey: .item_attributes)
        stores = try values.decodeIfPresent([BarcodeSpiderProductModel_Stores].self, forKey: .stores)
    }

}


struct Item_response : Codable {
    let code : Int?
    let status : String?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct Item_attributes : Codable {
    let title : String?
    let upc : String?
    let ean : String?
    let parent_category : String?
    let category : String?
    let brand : String?
    let model : String?
    let mpn : String?
    let manufacturer : String?
    let publisher : String?
    let asin : String?
    let color : String?
    let size : String?
    let weight : String?
    let image : String?
    let is_adult : String?
    let description : String?
    let lowest_price : String?
    let highest_price : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case upc = "upc"
        case ean = "ean"
        case parent_category = "parent_category"
        case category = "category"
        case brand = "brand"
        case model = "model"
        case mpn = "mpn"
        case manufacturer = "manufacturer"
        case publisher = "publisher"
        case asin = "asin"
        case color = "color"
        case size = "size"
        case weight = "weight"
        case image = "image"
        case is_adult = "is_adult"
        case description = "description"
        case lowest_price = "lowest_price"
        case highest_price = "highest_price"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        upc = try values.decodeIfPresent(String.self, forKey: .upc)
        ean = try values.decodeIfPresent(String.self, forKey: .ean)
        parent_category = try values.decodeIfPresent(String.self, forKey: .parent_category)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        model = try values.decodeIfPresent(String.self, forKey: .model)
        mpn = try values.decodeIfPresent(String.self, forKey: .mpn)
        manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
        publisher = try values.decodeIfPresent(String.self, forKey: .publisher)
        asin = try values.decodeIfPresent(String.self, forKey: .asin)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        size = try values.decodeIfPresent(String.self, forKey: .size)
        weight = try values.decodeIfPresent(String.self, forKey: .weight)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        is_adult = try values.decodeIfPresent(String.self, forKey: .is_adult)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        lowest_price = try values.decodeIfPresent(String.self, forKey: .lowest_price)
        highest_price = try values.decodeIfPresent(String.self, forKey: .highest_price)
    }

}

struct BarcodeSpiderProductModel_Stores : Codable {
    let store_name : String?
    let title : String?
    let image : String?
    let price : String?
    let currency : String?
    let link : String?
    let updated : String?

    enum CodingKeys: String, CodingKey {

        case store_name = "store_name"
        case title = "title"
        case image = "image"
        case price = "price"
        case currency = "currency"
        case link = "link"
        case updated = "updated"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        store_name = try values.decodeIfPresent(String.self, forKey: .store_name)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        updated = try values.decodeIfPresent(String.self, forKey: .updated)
    }

}
