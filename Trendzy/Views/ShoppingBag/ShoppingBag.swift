//
//  ShoppingBag.swift
//  Trendzy
//
//  Created by gvantsa gvagvalia on 11/6/24.
//

import SwiftUI
import SwiftData

struct ShoppingBag: View {
    @EnvironmentObject private var shoppingBagViewModel: ShoppingBagViewModel
    @Environment(\.modelContext) private var context
    @Query private var productsInShoppingBag: [ShoppingBagModel]
    //    @EnvironmentObject private var viewModel: MainPageViewModel
    
    private var Subtotal: String {
        let subtotalPrice =  productsInShoppingBag.reduce(0) { $0 + ($1.price ?? 0) }
        return String(format: "%.2f", subtotalPrice)
    }
    
    var body: some View {
        VStack {
            Text("Bag" + "(\(productsInShoppingBag.count))")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
                .bold()
                .padding()
            ScrollView(.vertical) {
                ForEach(productsInShoppingBag, id: \.id) { product in
                    HStack(alignment: .top) {
                        let image = URL(string: product.image)
                        
                        AsyncImage(url: image) { image in
                            image
                                .resizable()
                                .cornerRadius(20)
                                .frame(width: 75, height: 90)
                                .scaledToFill()
                                .shadow(radius: 5)
                            
                        }
                    placeholder: {
                        ProgressView()
                    }
                        
                        VStack(alignment: .leading) {
                            JustifiedText(text: product.title)
                            JustifiedText(text: product.formattedPrice)
                        }
                        
                        Spacer()

                        AddToShoppingBagButton(product: CodableProductModel(id: product.productID, title: product.title, image: product.image))
                            .environmentObject(shoppingBagViewModel)
                        
                    }
                    .padding()
                }
            }
            
            VStack {
                HStack {
                    Text("Subtotal")
                        .font(.custom("Papyrus", size: 12))
                    Spacer()
                    Text(Subtotal + "" + "$")
                }
                HStack {
                    Text("Delivery")
                        .font(.custom("Papyrus", size: 12))
                    
                    Spacer()
                    Text("Free")
                }
                HStack {
                    Text("Total")
                        .bold()
                    Spacer()
                    Text(Subtotal + "" + "$")
                        .foregroundStyle(.red)
                }
                Button(action: {
                    print("buy")
                }, label: {
                    Spacer()
                    Text("Place Order")
                        .padding(.vertical, 6)
                    Spacer()
                    
                })
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .tint(.black)
                
            }
            .padding(.horizontal)
        }
        .onAppear {
            shoppingBagViewModel.updateShoppingPage(from: productsInShoppingBag)
        }
    }
}
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

//
//#Preview {
//    ShoppingBagView()
//        .environmentObject(ShoppingBagViewModel())
//}

