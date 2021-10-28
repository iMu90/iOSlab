//
//  ProductListView.swift
//  athath
//
//  Created by Muteb Alolayan on 28/10/2021.
//

import SwiftUI

struct ProductListView: View {
    
    @Binding var product: [ProductResult]
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(product ) { product in
                    ProductCell(product: product)
                }
            }.padding(.horizontal)
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let products = [ProductResult(id: 10, nameAr: "some", nameEn: "things", pictureURL: "https://athath01.s3.amazonaws.com/e9f1da68-06c1-4263-ab39-58533b0e50e6.JPG", manufacture: "مفروشات العبداللطيف", discountPrice: 10831.85, priceWithVat: 10831.85, productImages: [ProductImages(imageUrl: "https://athath01.s3.amazonaws.com/e9f1da68-06c1-4263-ab39-58533b0e50e6.JPG")]),
                        ProductResult(id: 11, nameAr: "some", nameEn: "things", pictureURL: "https://athath01.s3.amazonaws.com/e9f1da68-06c1-4263-ab39-58533b0e50e6.JPG", manufacture: "مفروشات العبداللطيف", discountPrice: 10831.85, priceWithVat: 10831.85, productImages: [ProductImages(imageUrl: "https://athath01.s3.amazonaws.com/e9f1da68-06c1-4263-ab39-58533b0e50e6.JPG")]),
                        ProductResult(id: 12, nameAr: "some", nameEn: "things", pictureURL: "https://athath01.s3.amazonaws.com/e9f1da68-06c1-4263-ab39-58533b0e50e6.JPG", manufacture: "مفروشات العبداللطيف", discountPrice: 10831.85, priceWithVat: 10831.85, productImages: [ProductImages(imageUrl: "https://athath01.s3.amazonaws.com/e9f1da68-06c1-4263-ab39-58533b0e50e6.JPG")])]
        
        ProductListView(product: .constant(products))
    }
}


