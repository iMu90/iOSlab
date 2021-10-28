//
//  ContentView.swift
//  athath
//
//  Created by Muteb Alolayan on 25/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm: MainVM = MainVM()
//    @EnvironmentObject var vm: MainVM = MainVM()
    
    var body: some View {
        VStack {
            CategoriesView(categories: $vm.categoires, vm: vm)
            Spacer()
            ProductListView(product: $vm.product)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
