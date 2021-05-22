//
//  Home.swift
//  Shopily
//
//  Created by Aman Ilyasovich on 4/29/21.
//

import SwiftUI

struct Home: View {
    
    @State var size = "Sort"
    @State var currentTab = "Backpacks"
    
    @GestureState var isDragging = false
    
    //MARK: Adding cart items
    @State var cart: [Item] = []
    
    var body: some View {
        VStack {
            HStack {
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                        .foregroundColor(.black)
                }
                Spacer()
                
                //MARK: Cart
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.black)
                }
                //MARK: Cart count
                .overlay(
                    Text("\(cart.count)")
                        .font(.caption)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .frame(width: 18, height: 18)
                        .background(Color("Color-2"))
                        .clipShape(Circle())
                        .offset(x: 14, y: -22)
                        .opacity(cart.isEmpty ? 0 : 1)
                )
            }
            .padding(.horizontal)
            .padding(.top)
            .padding(.bottom, 10)
            
            ScrollView {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Compatible \nwith your style")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("Your style")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                        }
                        Spacer(minLength: 16)
                        
                        // MARK: Sort button
                        Menu(content: {
                            Button(action: {size = "Small"}) {
                                Text("Small")
                            }
                            
                            Button(action: {size = "Medium"}) {
                                Text("Medium")
                            }
                            
                            Button(action: {size = "Large"}) {
                                Text("Large")
                            }
                        }){
                            Label(title: {
                                Text(size)
                                    .foregroundColor(.white)
                                
                            }) {
                                Image(systemName: "slider.vertical.3")
                                    .foregroundColor(.white)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color("Color-2"))
                            .clipShape(Capsule())
                        }
                    }
                    .padding()
                    
                    HStack(spacing: 0) {
                        ForEach(tabs, id: \.self) { tab in
                            Button(action: {currentTab = tab}) {
                                Text(tab)
                                    .fontWeight(.semibold)
                                    .foregroundColor(currentTab == tab ? .black : .gray)
                                
                                if tab != tabs.last {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                        .padding(14)
                    }
                    
                    ForEach(items.indices){ index in
                        
                        ZStack {
                            Color("Color-2")
                                .cornerRadius(16)
                            Color("Color")
                                .cornerRadius(16)
                                .padding(.trailing, 64)
                            
                            HStack {
                                Spacer()
                                
                                Button(action: {}) {
                                    Image(systemName: "suit.heart")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 64)
                                }
                                
                                Button(action: {addCart(index: index)}) {
                                    Image(systemName: checkCart(index: index) ? "cart.badge.minus" : "cart.badge.plus")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .frame(width: 64)
                                }
                            }
                            
                            CardView(item: items[index])
                                
                                .offset(x: items[index].offset)
                                .gesture(DragGesture()
                                            .updating($isDragging, body: { (value, state, _) in
                                                state = true
                                                onChanged(value: value, index: index)
                                            }).onEnded({ (value) in onEnd(value: value, index: index)
                                            }))
                        }
                        .padding(.horizontal)
                        .padding(.top)
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
    
    //MARK: Checking cart and adding item
    func checkCart(index: Int) -> Bool {
        return cart.contains{(item) -> Bool in
            
            return item.id == items[index].id
        }
    }
    
    func addCart(index: Int) {
        if checkCart(index: index) {
            cart.removeAll { (item) -> Bool in
                return item.id == items[index].id
            }
        }
        else {
            cart.append(items[index])
        }
        withAnimation {
            items[index].offset = 0
        }
    }
    
    func onChanged(value: DragGesture.Value,index: Int) {
        if value.translation.width < 0 && isDragging {
            items[index].offset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value,index: Int) {
        withAnimation {
            if -value.translation.width >= -100 {
                items[index].offset = -134
            }
            else {
                items[index].offset = 0
            }
        }
    }
}

var tabs = ["Backpack", "Suitcase", "Accessory", "All"]

