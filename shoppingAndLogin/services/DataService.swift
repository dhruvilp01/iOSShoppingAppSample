//
//  DataService.swift
//  shoppingAndLogin
//
//  Created by Dhruvil Patel on 6/18/18.
//  Copyright © 2018 Dhruvil. All rights reserved.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let categories = [
        Category(title: "SHIRTS", imageName: "shirts.png"),
        Category(title: "HOODIES", imageName: "hoodies.png"),
        Category(title: "HATS", imageName: "hats.png"),
        Category(title: "DIGITAL", imageName: "digital.png")
    ]
    
    private let hats = [
        Product(title: "Dhruvil Logo Graphic Beanie", price: "$18", imageName: "hat01.png"),
        Product(title: "Dhruvil Logo Hat Black", price: "$25", imageName: "hat02.png"),
        Product(title: "Dhruvil Logo Hat White ", price: "$35", imageName: "hat03.png"),
        Product(title: "Dhruvil Logo Hat snapbacks", price: "$30", imageName: "hat04.png"),
        
    ]
    
    private let hoodies = [
        Product(title: "Dhruvil Logo Hoodie Gray", price: "$32", imageName: "hoodie01.png"),
        Product(title: "Dhruvil Logo Hoodie Red", price: "$35", imageName: "hoodie02.png"),
        Product(title: "Dhruvil Logo Hoodie Grey", price: "$37", imageName: "hoodie03.png"),
        Product(title: "Dhruvil Logo Hoodie Black", price: "$39", imageName: "hoodie04.png"),
    ]
    
    private let shirts = [
        Product(title: "Dhruvil Logo Shirts Black", price: "$29", imageName: "shirt01.png"),
        Product(title: "Dhruvil Bage Shirts Light Gray", price: "$40", imageName: "shirt02.png"),
        Product(title: "Dhruvil Logo Shirts Red", price: "$25", imageName: "shirt03.png"),
        Product(title: "Dhruvil Logo Shirts Gray", price: "$28", imageName: "shirt04.png"),
        Product(title: "KickFlip Studios Balck", price: "$37", imageName: "shirt05.png"),
    ]
    
    private let digitalGoods = [Product] ()
    
    func getCotegories() -> [Category] {
        return categories
    }
    
    func getProducts(forCategoryTitle title: String) -> [Product] {
        switch title {
        case "SHIRTS":
           return getShirts()
        case "HATS" :
           return getHats()
        case "HOODIES" :
           return getHoodies()
        case "DIGITAL":
           return getDigitalsGoods()
        default:
           return getShirts()
        }
    }
    
    func getHats() -> [Product] {
        return hats
    }
    
    func getHoodies() -> [Product] {
        return hoodies
    }
    
    func getShirts() -> [Product] {
        return shirts
    }
    
    func getDigitalsGoods() -> [Product] {
        return digitalGoods
    }
    
    
    
    
    
}
