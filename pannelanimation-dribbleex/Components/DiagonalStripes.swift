//
//  DiagonalStripes.swift
//  pannelanimation-dribbleex
//
//  Created by Krish Mittal on 28/10/24.
//

import SwiftUI

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
