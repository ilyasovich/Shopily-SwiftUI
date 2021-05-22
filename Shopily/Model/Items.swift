//
//  Items.swift
//  Shopily
//
//  Created by Aman Ilyasovich on 4/29/21.
//

import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var price: String
    var image: String
    var offset: CGFloat = 0
}

var items = [
    Item(title: "Cool Backpack", subtitle: "Offering compact carrying for your essentials", price: "$40", image: "backpack"),
    Item(title: "Cool Backpack", subtitle: "Offering compact carrying for your essentials", price: "$40", image: "backpack-1"),
    Item(title: "Cool Backpack", subtitle: "Offering compact carrying for your essentials", price: "$40", image: "backpack-2")
]


 
