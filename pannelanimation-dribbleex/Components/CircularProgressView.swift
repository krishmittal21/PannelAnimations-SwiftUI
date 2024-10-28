//
//  CircularProgressView.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//

import SwiftUI

struct CircularProgressView: View {
    let percentage: Double
    let label: String
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white, lineWidth: 50)

            ForEach(0..<8) { i in
                           Rectangle()
                               .fill(Color.gray)
                               .frame(width: 2, height: 10)
                               .offset(y: -100)
                               .rotationEffect(.degrees(Double(i) * 45))
                       }
            
            Circle()
                .fill(Color.orange)
                .frame(width: 15, height: 15)
                .offset(y: -100)
                .rotationEffect(.degrees(percentage / 100 * 360))
            
            VStack(spacing: 4) {
                Text("\(Int(percentage))%")
                    .font(.system(size: 32, weight: .medium))
                Text(label)
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 200, height: 200)
    }
}
