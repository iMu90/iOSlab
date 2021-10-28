//
//  ProductService.swift
//  athath
//
//  Created by Muteb Alolayan on 26/10/2021.
//

import Foundation

struct ProductService {
    
    let decoder = JSONDecoder()
    
    func loadProduct(categoryId: Int, page: Int, completion: @escaping (Bool, Product?, Error?) ->()) {
        var request = ProductApi.getProducts.urlRequest
        let url = URL(string: "\(String(describing: request.url!))" + "?page=\(page)&size=10&categoryId.in=\(categoryId)")
        request = URLRequest(url: url!)
        print("url request: \(request)")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            if (error != nil) {
                print("error: \(String(describing: error))")
                completion(false, nil, error)
                return
            }
            
            guard let data = data else {
                completion(false, nil, error)
                return
            }
            
            do {
                let responseObject = try self.decoder.decode(Product.self, from: data)
                completion(true, responseObject, nil)
            } catch {
                print("ERROR!: \(error)")
                completion(false, nil, error)
            }
        
        }
        task.resume()
        
        
    }
}
