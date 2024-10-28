//
//  PercentageBoxView.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//

import SwiftUI

struct PercentageBoxView: View {
    let percentage: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(.white)
            VStack(alignment: .center) {
                Text("\(percentage)%")
                    .font(.system(size: 36, weight: .medium))
                    .padding(.horizontal)
                    .padding(.top,5)
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(Color.init(hex: "#afc1d3"))
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
                    .padding(.horizontal, 5)
                    .padding(.bottom,5)
            }
        }
    }
}
