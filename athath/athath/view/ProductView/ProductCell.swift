//
//  ProductCell.swift
//  athath
//
//  Created by Muteb Alolayan on 28/10/2021.
//

import SwiftUI
import Kingfisher

struct ProductCell: View {
    
    let product: ProductResult!
    
    var body: some View {
        VStack(alignment: .trailing) {
            KFImage(URL(string: product.productImages[0].imageUrl))
                .resizable()
                
                //                .frame(width: 200, height: 200, alignment: .center)
                .aspectRatio(contentMode: .fit)
            
            HStack {
                Text(product.manufacture ?? "")
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
                Text(product.nameAr ?? "")
                    .font(.body)
                
            }.padding(.horizontal, 3)
            Spacer()
            HStack {
                Text((product.discountPrice != nil) ? String(format: "%.2f", product.priceWithVat ): "")
                    .font(.footnote)
                    .strikethrough()
                Text(String(format: "%.2f ريال", product.discountPrice ?? product.priceWithVat))
                    .bold()
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(10)
                
            }
        }
        //        .frame(width: 200, height: 250, alignment: .center)
        
        .background(Color(.gray).opacity(0.2))
        .cornerRadius(10)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: ProductResult(id: 1000, nameAr: "كنب 2", nameEn: "sofa 2", pictureURL: nil, manufacture: "مفروشات العبداللطيف", discountPrice: 9419.00, priceWithVat: 10831.85, productImages: [ProductImages(imageUrl: "https://athath01.s3.amazonaws.com/e9f1da68-06c1-4263-ab39-58533b0e50e6.JPG")]))
    }
}
