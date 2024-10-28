//
//  calendarComponent.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 27/10/24.
//

import SwiftUI

struct CalendarComponent: View {
    let costs: [Double] = [0.3, 0.6, 0.2, 0.4, 0.8]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    var isFullPage: Bool = false
    var namespace: Namespace.ID

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Costs")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                if isFullPage {
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.headline)
                        .bold()
                        .matchedGeometryEffect(id: "chevron", in: namespace)
                }
                
            }
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 12) {
                ForEach(0..<5) { index in
                    VStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(index == 1 ? Color.black : Color.clear)
                            .frame(height: CGFloat(costs[index]) * (isFullPage == false ? 150 : 250))
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
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(height: (isFullPage == false ? 180 : 230))
        }
        .background(Color(hex: "#b1c3b6"))
        .cornerRadius(16)
        .padding()
    }
}


