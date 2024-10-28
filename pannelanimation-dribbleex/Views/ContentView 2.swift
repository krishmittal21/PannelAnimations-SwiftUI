//
//  ContentView 2.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//


//
//  ContentView.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 27/10/24.
//

import SwiftUI

struct ContentView2: View {
    @Namespace var namespace
    @State var show = false
    @State var backgroundColor: Color = Color.gray.opacity(0.1)
    
    var body: some View {
            ZStack {
                backgroundColor
                   .ignoresSafeArea()
                   .animation(.linear, value: show)
                
                if !show {
                    body1
                       .transition(.scale.combined(with:.opacity))
                } else {
                    body2
                       .transition(.scale.combined(with:.opacity))
                }
            }
           .onChange(of: show) { newValue in
                withAnimation(.linear) {
                    backgroundColor = newValue ? Color(hex: "#b1c3b6") : Color.gray.opacity(0.1)
                }
                withAnimation(.bouncy) {
                    // No need to toggle here, handled by onChange
                }
            }
        }
    
    @ViewBuilder
    var body1: some View {
        NavigationView {
            VStack(alignment: .leading) {
                // Title section at top
                VStack(alignment: .leading) {
                    Text("")
                    Text("")
                }
                .font(.title)
                .bold()
                .padding(.top)
                .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    CalendarComponent(namespace: namespace)
                        .foregroundColor(.black)
                        .frame(width: 300, height: 350)
                        .background(Color(hex: "#b1c3b6"))
                        .cornerRadius(16)
                        .padding()
                        .onTapGesture {
                            withAnimation(.linear) {
                                show.toggle()
                            }
                        }
                        .matchedGeometryEffect(id: "calendar", in: namespace)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.gray.opacity(0.1))
        }
    }
    
    @ViewBuilder
    var body2: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                CalendarComponent(isFullPage: true, namespace: namespace)
                    .frame(height: 470)
                    .matchedGeometryEffect(id: "calendar", in: namespace)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        CostCard(icon: "tiktok", platform: "TikTok", amount: 12)
                        CostCard(icon: "github", platform: "Github", amount: 24)
                        CostCard(icon: "dropbox", platform: "Dropbox", amount: 15)
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
            .background(Color(hex: "#b1c3b6"))
            .onTapGesture {
                show.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
