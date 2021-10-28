//
//  CategoryCellView.swift
//  athath
//
//  Created by Muteb Alolayan on 26/10/2021.
//

import SwiftUI
import Kingfisher

struct CategoryCellView: View {
    let category: Category!
    let selected: Bool!
    var body: some View {
        
        VStack(spacing: 0) {
            KFImage(URL(string: category.pictureURL))
                .resizable()
                .frame(width: 35, height: 35, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text(category.nameAr)
                .accentColor(.black)
                .font(.footnote)
                .fixedSize(horizontal: true, vertical: false)
                .padding(.horizontal, 12)
           
        }
        .frame(width: 35, height: 35)
        .padding()
        .background(selected ? Color(.blue).opacity(0.1) : Color(.gray).opacity(0.1))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(selected ? Color.blue : Color.gray, lineWidth: 1)
                
        )
        
        
        
        
    }
    
}

struct CategoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCellView(category: Category(id: 1000, createdDate: "something", nameEn: "Couch", nameAr: "كنب", pictureURL: "https://athath01.s3.amazonaws.com/208bae52-eae9-4f94-9984-8f3462e516e0.png"), selected: true)
    }
}
