//
//  DottedLineView.swift
//  VPN-Design
//
//  Created by PC on 20/04/2024.
//

import SwiftUI

struct DottedLineView: Shape {
        
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        return path
    }
}
#Preview {
    DottedLineView()
}
