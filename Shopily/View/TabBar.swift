//
//  TabBar.swift
//  Shopily
//
//  Created by Aman Ilyasovich on 5/11/21.
//

import SwiftUI

struct TabBar: View {
    @State var current = "Home"
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $current) {
                Home()
                    .tag("Home")
                
                Text("Support")
                    .tag("Support")
                
                Text("Account")
                    .tag("Account")
            }
            
            HStack(spacing: 0) {
                
                TabButton(title: "Home", image: "home", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Support", image: "support", selected: $current)
                Spacer(minLength: 0)
                TabButton(title: "Account", image: "user", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color("Color-2"))
            .clipShape(Capsule())
            .padding(.horizontal, 25)
        }
    }
}
