//
//  costPage.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//

import SwiftUI

struct CostsDashboardView: View {
    let costs: [Double] = [0.3, 0.6, 0.2, 0.4, 0.8]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Header
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Popular")
                                .font(.system(size: 32, weight: .bold))
                            Text("Costs")
                                .font(.system(size: 32, weight: .bold))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "arrow.down")
                            .font(.system(size: 16, weight: .bold))
                    }
                    .padding(.top, 40)
                    
                    Spacer()
                    
                    HStack(alignment: .bottom, spacing: 12) {
                        ForEach(0..<5) { index in
                            VStack(spacing: 8) {
                                Spacer()
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(index == 1 ? Color.black : Color.clear)
                                    .frame(height: CGFloat(costs[index]) * 250)
                                    .overlay(
                                        Group {
                                            if index != 1 {
                                                DiagonalStripes()
                                                    .stroke(Color.black.opacity(0.2), lineWidth: 1.5)
                                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                            }
                                        }
                                    )
                                
                                Text(days[index])
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .frame(height: 370)
                    .padding(.bottom, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            CostCard(
                                icon: "tiktok",
                                platform: "TikTok",
                                amount: 12
                            )
                            
                            CostCard(
                                icon: "github",
                                platform: "Github",
                                amount: 24
                            )
                            
                            CostCard(
                                icon: "dropbox",
                                platform: "Dropbox",
                                amount: 15
                            )
                        }
                    }
                    
                    HStack {
                        Text("All Time:")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("-$1,192.50")
                            .font(.system(size: 30))
                            .fontWeight(.semibold)
                    }
                    .padding(.top, 20)
                }
                .padding([.top, .leading, .trailing], 10)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            }
            .ignoresSafeArea()
            .background(Color(hex: "#b1c3b6"))
        }
    }
}

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

#Preview {
    CostsDashboardView()
}
