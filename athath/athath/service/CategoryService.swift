//
//  CategoryService.swift
//  athath
//
//  Created by Muteb Alolayan on 25/10/2021.
//

import Foundation


class CategoryService {
    
    let decoder = JSONDecoder()
    
    func loadCategory(completion: @escaping (Bool, [Category]?, Error?) ->()) {
        let request = CategoryApi.getCategories.urlRequest        
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(false, nil, error)
                return
            }
            if ((error) != nil) {
                completion(false, nil, error)
                return
            }
            do {
                let responseObject = try self.decoder.decode([Category].self, from: data)
                completion(true, responseObject, nil)
            } catch {
                completion(false, nil, error)
            }
        }
        
        task.resume()
    }
}
