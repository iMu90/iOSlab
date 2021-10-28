//
//  Categories.swift
//  athath
//
//  Created by Muteb Alolayan on 25/10/2021.
//

import Foundation

struct Category: Codable, Identifiable {
    let id: Int
    let createdDate: String
    let nameEn: String
    let nameAr: String
    let pictureURL: String
}
