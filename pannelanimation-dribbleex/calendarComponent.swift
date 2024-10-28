//
//  calendarComponent.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 27/10/24.
//

import SwiftUI

struct CalendarComponent: View {
    let costs: [Double] = [0.3, 0.8, 0.2, 0.4, 0.6]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Title Section
            VStack(alignment: .leading, spacing: 4) {
                Text("Popular")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Costs")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            // Bar Chart
            HStack(alignment: .bottom, spacing: 12) {
                ForEach(0..<5) { index in
                    VStack {
                        // Bar
                        RoundedRectangle(cornerRadius: 12)
                            .fill(index == 1 ? Color.black : Color.clear)
                            .frame(height: CGFloat(costs[index]) * 150)
                            .overlay(
                                Group {
                                    if index != 1 {
                                        DiagonalStripes()
                                            .stroke(Color.black.opacity(0.2), lineWidth: 1.5)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                    }
                                }
                            )
                        
                        // Day Label
                        Text(days[index])
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .frame(height: 180)
        }
        .padding(24)
        .background(Color(hex: "#b1c3b6"))
        .cornerRadius(16)
        .padding()
    }
}

struct DiagonalStripes: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let stripeWidth: CGFloat = 6
        let diagonal = sqrt(pow(rect.width, 2) + pow(rect.height, 2))
        let numberOfLines = Int(diagonal / stripeWidth)
        let offset = rect.width + rect.height
        
        for i in 0...numberOfLines {
            let start = CGPoint(x: -offset/2 + CGFloat(i) * stripeWidth,
                              y: 0)
            let end = CGPoint(x: start.x + offset,
                            y: offset)
            path.move(to: start)
            path.addLine(to: end)
        }
        return path
    }
}

#Preview {
    CalendarComponent()
}
