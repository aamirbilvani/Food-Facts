//
//  OpenFoodFactsProductModel.swift
//  BarcodeScanner
//
//  Created by NovatexMac2 on 03/08/2022.
//

import Foundation

struct OpenFoodFactsProductModel : Codable {
    let count : Int?
    let page : Int?
    let page_count : Int?
    let page_size : Int?
    let products : [OpenFoodFactsProducts]?
    let skip : Int?

    enum CodingKeys: String, CodingKey {

        case count = "count"
        case page = "page"
        case page_count = "page_count"
        case page_size = "page_size"
        case products = "products"
        case skip = "skip"
    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        count = try values.decodeIfPresent(Int.self, forKey: .count)
//        page = try values.decodeIfPresent(Int.self, forKey: .page)
//        page_count = try values.decodeIfPresent(Int.self, forKey: .page_count)
//        page_size = try values.decodeIfPresent(Int.self, forKey: .page_size)
//        products = try values.decodeIfPresent([Products].self, forKey: .products)
//        skip = try values.decodeIfPresent(Int.self, forKey: .skip)
//    }

}

struct OpenFoodFactsProducts : Codable {
    let brands : String?
    let code : String?
    let image_url: String?
    let nutriments : Nutriments?
    let product_name : String?

    enum CodingKeys: String, CodingKey {

        case brands = "brands"
        case code = "code"
        case image_url = "image_url"
        case nutriments = "nutriments"
        case product_name = "product_name"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        brands = try values.decodeIfPresent(String.self, forKey: .brands)
//        code = try values.decodeIfPresent(String.self, forKey: .code)
//        nutriments = try values.decodeIfPresent(Nutriments.self, forKey: .nutriments)
//        product_name = try values.decodeIfPresent(String.self, forKey: .product_name)
//    }

}

struct Nutriments : Codable {
    let carbohydrates : Double?
    let carbohydrates_100g : Double?
    let carbohydrates_serving : Double?
    let carbohydrates_unit : String?
    let carbohydrates_value : Double?
    
    let cocoa : Double?
    let cocoa_100g : Double?
    let cocoa_label : String?
    let cocoa_serving : Double?
    let cocoa_unit : String?
    let cocoa_value : Double?
    
    let energy : Int?
    let energy_kcal : Int?
    let energy_kcal_100g : Int?
    let energy_kcal_serving : Double?
    let energy_kcal_unit : String?
    let energy_kcal_value : Int?
    let energy_kj : Int?
    let energy_kj_100g : Int?
    let energy_kj_serving : Int?
    let energy_kj_unit : String?
    let energy_kj_value : Int?
    let energy_100g : Int?
    let energy_serving : Int?
    let energy_unit : String?
    let energy_value : Int?
    
    let fat : Double?
    let fat_100g : Double?
    let fat_serving : Double?
    let fat_unit : String?
    let fat_value : Double?
    
    let fiber : Int?
    let fiber_100g : Int?
    let fiber_serving : Int?
    let fiber_unit : String?
    let fiber_value : Int?
    
    let fruits_vegetables_nuts_estimate_from_ingredients_100g : Int?
    let fruits_vegetables_nuts_estimate_from_ingredients_serving : Int?
    
    let nova_group : Int?
    let nova_group_100g : Int?
    let nova_group_serving : Int?
    
    let nutrition_score_fr : Int?
    let nutrition_score_fr_100g : Int?
    
    let proteins : Double?
    let proteins_100g : Double?
    let proteins_serving : Double?
    let proteins_unit : String?
    let proteins_value : Double?
    
    let salt : Double?
    let salt_100g : Double?
    let salt_serving : Double?
    let salt_unit : String?
    let salt_value : Double?
    
    let saturated_fat : Double?
    let saturated_fat_100g : Double?
    let saturated_fat_serving : Double?
    let saturated_fat_unit : String?
    let saturated_fat_value : Double?
    
    let sodium : Double?
    let sodium_100g : Double?
    let sodium_serving : Double?
    let sodium_unit : String?
    let sodium_value : Double?
    
    let sugars : Double?
    let sugars_100g : Double?
    let sugars_serving : Double?
    let sugars_unit : String?
    let sugars_value : Double?

    enum CodingKeys: String, CodingKey {

        case carbohydrates = "carbohydrates"
        case carbohydrates_100g = "carbohydrates_100g"
        case carbohydrates_serving = "carbohydrates_serving"
        case carbohydrates_unit = "carbohydrates_unit"
        case carbohydrates_value = "carbohydrates_value"
        
        case cocoa = "cocoa"
        case cocoa_100g = "cocoa_100g"
        case cocoa_label = "cocoa_label"
        case cocoa_serving = "cocoa_serving"
        case cocoa_unit = "cocoa_unit"
        case cocoa_value = "cocoa_value"
        
        
        case energy = "energy"
        case energy_kcal = "energy-kcal"
        case energy_kcal_100g = "energy-kcal_100g"
        case energy_kcal_serving = "energy-kcal_serving"
        case energy_kcal_unit = "energy-kcal_unit"
        case energy_kcal_value = "energy-kcal_value"
        case energy_kj = "energy-kj"
        case energy_kj_100g = "energy-kj_100g"
        case energy_kj_serving = "energy-kj_serving"
        case energy_kj_unit = "energy-kj_unit"
        case energy_kj_value = "energy-kj_value"
        case energy_100g = "energy_100g"
        case energy_serving = "energy_serving"
        case energy_unit = "energy_unit"
        case energy_value = "energy_value"
        case fat = "fat"
        case fat_100g = "fat_100g"
        case fat_serving = "fat_serving"
        case fat_unit = "fat_unit"
        case fat_value = "fat_value"
        case fiber = "fiber"
        case fiber_100g = "fiber_100g"
        case fiber_serving = "fiber_serving"
        case fiber_unit = "fiber_unit"
        case fiber_value = "fiber_value"
        case fruits_vegetables_nuts_estimate_from_ingredients_100g = "fruits-vegetables-nuts-estimate-from-ingredients_100g"
        case fruits_vegetables_nuts_estimate_from_ingredients_serving = "fruits-vegetables-nuts-estimate-from-ingredients_serving"
        case nova_group = "nova-group"
        case nova_group_100g = "nova-group_100g"
        case nova_group_serving = "nova-group_serving"
        case nutrition_score_fr = "nutrition-score-fr"
        case nutrition_score_fr_100g = "nutrition-score-fr_100g"
        case proteins = "proteins"
        case proteins_100g = "proteins_100g"
        case proteins_serving = "proteins_serving"
        case proteins_unit = "proteins_unit"
        case proteins_value = "proteins_value"
        case salt = "salt"
        case salt_100g = "salt_100g"
        case salt_serving = "salt_serving"
        case salt_unit = "salt_unit"
        case salt_value = "salt_value"
        case saturated_fat = "saturated-fat"
        case saturated_fat_100g = "saturated-fat_100g"
        case saturated_fat_serving = "saturated-fat_serving"
        case saturated_fat_unit = "saturated-fat_unit"
        case saturated_fat_value = "saturated-fat_value"
        case sodium = "sodium"
        case sodium_100g = "sodium_100g"
        case sodium_serving = "sodium_serving"
        case sodium_unit = "sodium_unit"
        case sodium_value = "sodium_value"
        case sugars = "sugars"
        case sugars_100g = "sugars_100g"
        case sugars_serving = "sugars_serving"
        case sugars_unit = "sugars_unit"
        case sugars_value = "sugars_value"
    }

//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        carbohydrates = try values.decodeIfPresent(Double.self, forKey: .carbohydrates)
//        carbohydrates_100g = try values.decodeIfPresent(Double.self, forKey: .carbohydrates_100g)
//        carbohydrates_serving = try values.decodeIfPresent(Double.self, forKey: .carbohydrates_serving)
//        carbohydrates_unit = try values.decodeIfPresent(String.self, forKey: .carbohydrates_unit)
//        carbohydrates_value = try values.decodeIfPresent(Double.self, forKey: .carbohydrates_value)
//        energy = try values.decodeIfPresent(Int.self, forKey: .energy)
//        energy-kcal = try values.decodeIfPresent(Int.self, forKey: .energy-kcal)
//        energy-kcal_100g = try values.decodeIfPresent(Int.self, forKey: .energy-kcal_100g)
//        energy-kcal_serving = try values.decodeIfPresent(Double.self, forKey: .energy-kcal_serving)
//        energy-kcal_unit = try values.decodeIfPresent(String.self, forKey: .energy-kcal_unit)
//        energy-kcal_value = try values.decodeIfPresent(Int.self, forKey: .energy-kcal_value)
//        energy-kj = try values.decodeIfPresent(Int.self, forKey: .energy-kj)
//        energy-kj_100g = try values.decodeIfPresent(Int.self, forKey: .energy-kj_100g)
//        energy-kj_serving = try values.decodeIfPresent(Int.self, forKey: .energy-kj_serving)
//        energy-kj_unit = try values.decodeIfPresent(String.self, forKey: .energy-kj_unit)
//        energy-kj_value = try values.decodeIfPresent(Int.self, forKey: .energy-kj_value)
//        energy_100g = try values.decodeIfPresent(Int.self, forKey: .energy_100g)
//        energy_serving = try values.decodeIfPresent(Int.self, forKey: .energy_serving)
//        energy_unit = try values.decodeIfPresent(String.self, forKey: .energy_unit)
//        energy_value = try values.decodeIfPresent(Int.self, forKey: .energy_value)
//        fat = try values.decodeIfPresent(Double.self, forKey: .fat)
//        fat_100g = try values.decodeIfPresent(Double.self, forKey: .fat_100g)
//        fat_serving = try values.decodeIfPresent(Double.self, forKey: .fat_serving)
//        fat_unit = try values.decodeIfPresent(String.self, forKey: .fat_unit)
//        fat_value = try values.decodeIfPresent(Double.self, forKey: .fat_value)
//        fiber = try values.decodeIfPresent(Int.self, forKey: .fiber)
//        fiber_100g = try values.decodeIfPresent(Int.self, forKey: .fiber_100g)
//        fiber_serving = try values.decodeIfPresent(Int.self, forKey: .fiber_serving)
//        fiber_unit = try values.decodeIfPresent(String.self, forKey: .fiber_unit)
//        fiber_value = try values.decodeIfPresent(Int.self, forKey: .fiber_value)
//        fruits-vegetables-nuts-estimate-from-ingredients_100g = try values.decodeIfPresent(Int.self, forKey: .fruits-vegetables-nuts-estimate-from-ingredients_100g)
//        fruits-vegetables-nuts-estimate-from-ingredients_serving = try values.decodeIfPresent(Int.self, forKey: .fruits-vegetables-nuts-estimate-from-ingredients_serving)
//        nova-group = try values.decodeIfPresent(Int.self, forKey: .nova-group)
//        nova-group_100g = try values.decodeIfPresent(Int.self, forKey: .nova-group_100g)
//        nova-group_serving = try values.decodeIfPresent(Int.self, forKey: .nova-group_serving)
//        nutrition-score-fr = try values.decodeIfPresent(Int.self, forKey: .nutrition-score-fr)
//        nutrition-score-fr_100g = try values.decodeIfPresent(Int.self, forKey: .nutrition-score-fr_100g)
//        proteins = try values.decodeIfPresent(Double.self, forKey: .proteins)
//        proteins_100g = try values.decodeIfPresent(Double.self, forKey: .proteins_100g)
//        proteins_serving = try values.decodeIfPresent(Double.self, forKey: .proteins_serving)
//        proteins_unit = try values.decodeIfPresent(String.self, forKey: .proteins_unit)
//        proteins_value = try values.decodeIfPresent(Double.self, forKey: .proteins_value)
//        salt = try values.decodeIfPresent(Double.self, forKey: .salt)
//        salt_100g = try values.decodeIfPresent(Double.self, forKey: .salt_100g)
//        salt_serving = try values.decodeIfPresent(Double.self, forKey: .salt_serving)
//        salt_unit = try values.decodeIfPresent(String.self, forKey: .salt_unit)
//        salt_value = try values.decodeIfPresent(Double.self, forKey: .salt_value)
//        saturated-fat = try values.decodeIfPresent(Double.self, forKey: .saturated-fat)
//        saturated-fat_100g = try values.decodeIfPresent(Double.self, forKey: .saturated-fat_100g)
//        saturated-fat_serving = try values.decodeIfPresent(Double.self, forKey: .saturated-fat_serving)
//        saturated-fat_unit = try values.decodeIfPresent(String.self, forKey: .saturated-fat_unit)
//        saturated-fat_value = try values.decodeIfPresent(Double.self, forKey: .saturated-fat_value)
//        sodium = try values.decodeIfPresent(Double.self, forKey: .sodium)
//        sodium_100g = try values.decodeIfPresent(Double.self, forKey: .sodium_100g)
//        sodium_serving = try values.decodeIfPresent(Double.self, forKey: .sodium_serving)
//        sodium_unit = try values.decodeIfPresent(String.self, forKey: .sodium_unit)
//        sodium_value = try values.decodeIfPresent(Double.self, forKey: .sodium_value)
//        sugars = try values.decodeIfPresent(Double.self, forKey: .sugars)
//        sugars_100g = try values.decodeIfPresent(Double.self, forKey: .sugars_100g)
//        sugars_serving = try values.decodeIfPresent(Double.self, forKey: .sugars_serving)
//        sugars_unit = try values.decodeIfPresent(String.self, forKey: .sugars_unit)
//        sugars_value = try values.decodeIfPresent(Double.self, forKey: .sugars_value)
//    }

}
