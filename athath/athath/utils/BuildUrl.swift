//
//  BuildUrl.swift
//  athath
//
//  Created by Muteb Alolayan on 25/10/2021.
//

import Foundation


protocol BuildApi {
    
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
//    var categoryId: Int { set get }
//    var page: Int { set get }
}

enum CategoryApi {
    case getCategories
}

enum ProductApi {
    case getProducts
}

enum url: String {
    case baseUrl = "https://athath.elm.sa/api/v1"
    case categoryEndPoint = "categories"
    case productEndPonint = "products"
}

extension CategoryApi: BuildApi {

    
    var baseUrl: URL {
        return URL(string: url.baseUrl.rawValue)!
    }
    
    var path: String {
        return url.categoryEndPoint.rawValue
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    
}

extension ProductApi: BuildApi {
    
    var baseUrl: URL {
        return URL(string: url.baseUrl.rawValue)!
    }
    
    var path: String {
        return url.productEndPonint.rawValue
    }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
