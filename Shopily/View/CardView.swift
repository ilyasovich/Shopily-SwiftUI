//
//  CardView.swift
//  Shopily
//
//  Created by Aman Ilyasovich on 4/29/21.
//

import SwiftUI

struct CardView: View {
    var item: Item
    var body: some View {
        HStack {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width / 3.2)
            
            VStack(alignment: .leading, spacing: 14) {
                Text(item.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(item.subtitle)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text(item.price)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            Spacer(minLength: 0)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.06), radius: 16, x: 6, y: 6)
        .shadow(color: Color.black.opacity(0.06), radius: 16, x: -6, y: -6)
    }
}


