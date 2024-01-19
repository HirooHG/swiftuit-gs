//
//  RarityView.swift
//  AppSwiftuiGs
//
//  Created by Hugo GOLLIET on 1/19/24.
//

import SwiftUI

struct RarityView: View {
    let item: Item
    @State var degrees = 0.0
    @State var scale = 0.0
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                VStack() {
                    Text(item.itemType.rawValue)
                        .font(.system(size: 60))
                        .padding(15)
                }
                .background(item.rarity.getColor())
                .containerShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: item.rarity.getColor(), radius: 10)
                .rotation3DEffect(
                    .degrees(degrees),
                    axis: (x: 1.0, y: 1.0, z: 1.0)
                )
                .onAppear {
                    withAnimation(.smooth.delay(0.4)) {
                        degrees -= 720
                    }
                }
                Text(item.name)
                    .font(.system(size: 35, weight: Font.Weight.black))
                    .foregroundStyle(item.rarity.getColor())
            }.frame(height: 340)
            Spacer()
            if item.rarity == Rarity.unique {
                HStack {
                    Text("Item Unique 🏆")
                        .frame(maxWidth: .infinity)
                        .padding(15)
                }
                    .background(item.rarity.getColor())
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: Font.Weight.black))
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .containerShape(RoundedRectangle(cornerRadius: 25))
                    .shadow(color: item.rarity.getColor(), radius: 3)
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.smooth.delay(0.4)) {
                            scale += 1
                        }
                    }
            }
        }
        .frame(height: 400)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    RarityView(item: Inventory().loot[0])
}