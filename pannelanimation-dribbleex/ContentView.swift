//
//  ContentView.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 27/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Title section at top
                VStack(alignment: .leading) {
                    Text("Product")
                    Text("Statistics")
                }
                .font(.title)
                .bold()
                .padding(.top)
                .padding(.horizontal)
                
                Spacer() // Pushes content to top and bottom
                
                // Calendar component with navigation link
                HStack {
                    NavigationLink(destination: CostsDashboardView()
                        .navigationBarBackButtonHidden(true) // Hide back button
                        .navigationBarHidden(true)           // Optional: Hide the navigation bar
                    ) {
                        CalendarComponent()
                            .foregroundColor(.black) // Ensure text is black
                            .frame(width: 300) // Adjust width as needed
                    }
                    Spacer() // Pushes calendar to the left
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.gray.opacity(0.1))
        }
    }
}

#Preview {
    ContentView()
}
