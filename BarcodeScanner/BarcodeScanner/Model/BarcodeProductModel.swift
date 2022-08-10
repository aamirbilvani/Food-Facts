//
//  BarcodeProductModel.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 02/08/2022.
//

import Foundation

struct BarcodeProductModel : Codable {
    let products : [Products]?

    enum CodingKeys: String, CodingKey {

        case products = "products"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        products = try values.decodeIfPresent([Products].self, forKey: .products)
    }

}

struct Products : Codable {
    let barcode_number : String?
    let barcode_formats : String?
    let mpn : String?
    let model : String?
    let asin : String?
    let title : String?
    let category : String?
    let manufacturer : String?
    let brand : String?
    let contributors : [String]?
    let age_group : String?
    let ingredients : String?
    let nutrition_facts : String?
    let energy_efficiency_class : String?
    let color : String?
    let gender : String?
    let material : String?
    let pattern : String?
    let format : String?
    let multipack : String?
    let size : String?
    let length : String?
    let width : String?
    let height : String?
    let weight : String?
    let release_date : String?
    let description : String?
    let features : [String]?
    let images : [String]?
    let last_update : String?
    let stores : [Stores]?
    let reviews : [String]?

    enum CodingKeys: String, CodingKey {

        case barcode_number = "barcode_number"
        case barcode_formats = "barcode_formats"
        case mpn = "mpn"
        case model = "model"
        case asin = "asin"
        case title = "title"
        case category = "category"
        case manufacturer = "manufacturer"
        case brand = "brand"
        case contributors = "contributors"
        case age_group = "age_group"
        case ingredients = "ingredients"
        case nutrition_facts = "nutrition_facts"
        case energy_efficiency_class = "energy_efficiency_class"
        case color = "color"
        case gender = "gender"
        case material = "material"
        case pattern = "pattern"
        case format = "format"
        case multipack = "multipack"
        case size = "size"
        case length = "length"
        case width = "width"
        case height = "height"
        case weight = "weight"
        case release_date = "release_date"
        case description = "description"
        case features = "features"
        case images = "images"
        case last_update = "last_update"
        case stores = "stores"
        case reviews = "reviews"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        barcode_number = try values.decodeIfPresent(String.self, forKey: .barcode_number)
        barcode_formats = try values.decodeIfPresent(String.self, forKey: .barcode_formats)
        mpn = try values.decodeIfPresent(String.self, forKey: .mpn)
        model = try values.decodeIfPresent(String.self, forKey: .model)
        asin = try values.decodeIfPresent(String.self, forKey: .asin)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
        brand = try values.decodeIfPresent(String.self, forKey: .brand)
        contributors = try values.decodeIfPresent([String].self, forKey: .contributors)
        age_group = try values.decodeIfPresent(String.self, forKey: .age_group)
        ingredients = try values.decodeIfPresent(String.self, forKey: .ingredients)
        nutrition_facts = try values.decodeIfPresent(String.self, forKey: .nutrition_facts)
        energy_efficiency_class = try values.decodeIfPresent(String.self, forKey: .energy_efficiency_class)
        color = try values.decodeIfPresent(String.self, forKey: .color)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        material = try values.decodeIfPresent(String.self, forKey: .material)
        pattern = try values.decodeIfPresent(String.self, forKey: .pattern)
        format = try values.decodeIfPresent(String.self, forKey: .format)
        multipack = try values.decodeIfPresent(String.self, forKey: .multipack)
        size = try values.decodeIfPresent(String.self, forKey: .size)
        length = try values.decodeIfPresent(String.self, forKey: .length)
        width = try values.decodeIfPresent(String.self, forKey: .width)
        height = try values.decodeIfPresent(String.self, forKey: .height)
        weight = try values.decodeIfPresent(String.self, forKey: .weight)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        features = try values.decodeIfPresent([String].self, forKey: .features)
        images = try values.decodeIfPresent([String].self, forKey: .images)
        last_update = try values.decodeIfPresent(String.self, forKey: .last_update)
        stores = try values.decodeIfPresent([Stores].self, forKey: .stores)
        reviews = try values.decodeIfPresent([String].self, forKey: .reviews)
    }

}

struct Stores : Codable {
    let name : String?
    let country : String?
    let currency : String?
    let currency_symbol : String?
    let price : String?
    let sale_price : String?
    let tax : [String]?
    let link : String?
    let item_group_id : String?
    let availability : String?
    let condition : String?
    let shipping : [String]?
    let last_update : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case country = "country"
        case currency = "currency"
        case currency_symbol = "currency_symbol"
        case price = "price"
        case sale_price = "sale_price"
        case tax = "tax"
        case link = "link"
        case item_group_id = "item_group_id"
        case availability = "availability"
        case condition = "condition"
        case shipping = "shipping"
        case last_update = "last_update"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        currency = try values.decodeIfPresent(String.self, forKey: .currency)
        currency_symbol = try values.decodeIfPresent(String.self, forKey: .currency_symbol)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        sale_price = try values.decodeIfPresent(String.self, forKey: .sale_price)
        tax = try values.decodeIfPresent([String].self, forKey: .tax)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        item_group_id = try values.decodeIfPresent(String.self, forKey: .item_group_id)
        availability = try values.decodeIfPresent(String.self, forKey: .availability)
        condition = try values.decodeIfPresent(String.self, forKey: .condition)
        shipping = try values.decodeIfPresent([String].self, forKey: .shipping)
        last_update = try values.decodeIfPresent(String.self, forKey: .last_update)
    }

}
