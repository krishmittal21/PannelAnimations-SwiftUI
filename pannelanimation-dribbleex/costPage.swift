//
//  costPage.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//

import SwiftUI

struct CostsDashboardView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Header
                CalendarComponent()
                    .padding(.top, 30)
                    .frame(height: 530)
                    
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

#Preview {
    CostsDashboardView()
}
