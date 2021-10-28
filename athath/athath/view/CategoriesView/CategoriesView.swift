//
//  CategoriesView.swift
//  athath
//
//  Created by Muteb Alolayan on 25/10/2021.
//

import SwiftUI

struct CategoriesView: View {
    
    @Binding var categories: [Category]
//    @Binding var selectedCategory: Int
    var vm: MainVM
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            Text("التصنيفات")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding(.horizontal)
            
                HStack {
                    ForEach(vm.categoires) { category in
                        
                        Button(action: {
                            vm.selectedCategory = category.id
                            vm.updateSelectedCategory(id: category.id)
                            
                        }, label: {
                            CategoryCellView(category: category, selected: category.id == vm.selectedCategory)
                        })
                    }
                    .frame(maxWidth: .infinity)
                }.padding(.horizontal)
            
        }.padding(.top)
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(categories: .constant([]), vm: MainVM())
    }
}
