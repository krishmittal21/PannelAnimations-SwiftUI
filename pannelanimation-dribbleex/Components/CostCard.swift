//
//  CostCard.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//

import SwiftUI

struct CostCard: View {
    let icon: String
    let platform: String
    let amount: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(icon)
                .resizable()
                .frame(width: 24, height: 24)
                .padding(8)
                .background(Color.gray.opacity(0.5))
                .clipShape(Circle())
                .padding(.bottom, 80)
            
            Text(platform)
                .font(.system(size: 18))
                .foregroundColor(.gray)
            
            Text(String(format: "-$%.0f", amount))
                .font(.system(size: 42, weight: .semibold))
        }
        .padding(16)
        .frame(width: 160, alignment: .leading) // Align the card content to the left
        .background(Color.gray.opacity(0.2))
        .cornerRadius(16)
    }
}

struct CostCardView: View {
    let icon: String
    let platform: String
    let amount: Double
    let delay: Double
    let geometryWidth: CGFloat

    @State private var isVisible = false

    var body: some View {
        CostCard(icon: icon, platform: platform, amount: amount)
            .offset(x: isVisible ? 0 : geometryWidth) // Start off-screen to the right
            .onAppear {
                withAnimation(.easeOut(duration: 0.6).delay(delay)) {
                    isVisible = true // Animate to original position
                }
            }
    }
}
