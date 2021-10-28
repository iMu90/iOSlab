//
//  Product.swift
//  athath
//
//  Created by Muteb Alolayan on 26/10/2021.
//

import Foundation

struct Product: Codable {
    let results: [ProductResult]
}


struct ProductResult: Codable, Identifiable {
    let id: Int
    let nameAr: String?
    let nameEn: String?
    let pictureURL: String?
    let manufacture: String?
    let discountPrice: Double?
    let priceWithVat: Double
    let productImages: [ProductImages]
}


struct ProductImages: Codable{
    let imageUrl: String
}
