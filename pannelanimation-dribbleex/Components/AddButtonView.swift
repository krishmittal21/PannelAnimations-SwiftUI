//
//  AddButtonView.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray.opacity(0.1))
            
            Image(systemName: "plus")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .cornerRadius(16)
    }
}
