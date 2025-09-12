//
//  SingleCornerRadius.swift
//  aStorage
//
//  Created by AKIJ KHAN on 2025-07-23.
//

import SwiftUI

struct SingleCornerRadius: Shape {
    var radius: CGFloat = 0.0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
