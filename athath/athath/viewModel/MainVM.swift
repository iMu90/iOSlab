//
//  MainVM.swift
//  athath
//
//  Created by Muteb Alolayan on 25/10/2021.
//

import Foundation
    
class MainVM: ObservableObject {
    
    @Published var categoires: [Category] = []
    @Published var product: [ProductResult] = []
    @Published private var error: String = ""
    @Published var selectedCategory: Int = 0
    
    let categoryService = CategoryService()
    let productService = ProductService()
    
    init() {
        loadCategories()
    }
    
    
    func loadCategories() {
        categoryService.loadCategory() { success, data, error in
            if (success) {
                guard let data = data else {
                    return
                }
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                    self.categoires = data
                    self.selectedCategory = data[0].id
                    self.loadProducts()
                }
                
            }
            
        }
        
    }
    
    func updateSelectedCategory(id: Int) {
        self.selectedCategory = id
        loadProducts()
    }
    
    func loadProducts() {
        productService.loadProduct(categoryId: self.selectedCategory, page: 0) { success, data, error in
            if (success) {
                guard let data = data else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                    self.product = data.results
                }
            }
        }
    }
}
