//
//  ContentView.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 27/10/24.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @State var show = false
    @State var showAllTime = false
    
    var body: some View {
        ZStack {
            if !show {
                body1
            } else {
                body2
            }
        }
        .animation(.bouncy, value: show)
    }
    
    @ViewBuilder
    var body1: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Product")
                        Text("Statistics")
                    }
                    .font(.title)
                    .bold()
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.headline)
                        .bold()
                        .matchedGeometryEffect(id: "chevron", in: namespace)
                }
                .padding(.top,5)
                .padding(.horizontal)
                
                Spacer()
                
                CircularProgressView(percentage: 55, label: "Mobile")
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        CalendarComponent(namespace: namespace)
                            .foregroundColor(.black)
                            .frame(width: geometry.size.width * 0.6, height: 350)
                            .background(Color(hex: "#b1c3b6"))
                            .cornerRadius(16)
                            .padding()
                            .onTapGesture {
                                withAnimation(.bouncy) {
                                    show.toggle()
                                }
                            }
                            .matchedGeometryEffect(id: "calendar", in: namespace)
                        
                        VStack(spacing: 16) {
                            Spacer()
                            PercentageBoxView(percentage: 45)
                                .frame(maxWidth: .infinity)
                                .frame(height: geometry.size.height * 0.55)
                            
                            AddButtonView()
                                .frame(maxWidth: .infinity)
                                .frame(height: geometry.size.height * 0.35)
                        }
                        .frame(width: geometry.size.width * 0.3)
                        .padding(.trailing)
                    }
                    .padding(.bottom, 10)
                }
                .frame(height: 350)
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
                        CostCardView(icon: "tiktok", platform: "TikTok", amount: 12, delay: 0.1, geometryWidth: geometry.size.width)
                        CostCardView(icon: "github", platform: "Github", amount: 24, delay: 0.2, geometryWidth: geometry.size.width)
                        CostCardView(icon: "dropbox", platform: "Dropbox", amount: 15, delay: 0.3, geometryWidth: geometry.size.width)
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
                .padding(.vertical, 20)
                .offset(y: showAllTime ? 0 : 20)
                .opacity(showAllTime ? 1 : 0)
                .animation(.easeOut(duration: 0.4).delay(0.3), value: showAllTime)
            }
            .padding([.leading, .trailing], 10)
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            .background(Color(hex: "#b1c3b6"))
            .onAppear {
                showAllTime = true
            }
            .onTapGesture {
                show.toggle()
                showAllTime = false 
            }
        }
    }
}

#Preview {
    ContentView()
}
