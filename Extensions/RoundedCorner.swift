//
//  View.swift
//
//  Created by LW on 28/8/20.
//

import Foundation
import SwiftUI

// https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui/56763282#56763282

// MARK: - via clipShape

extension View {
    func clipCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// MARK: - via overlay

extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S: ShapeStyle {
        return overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(content, lineWidth: width))
    }
}

// MARK: - demo

struct RoundedCornerDemo: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("all round").foregroundColor(Color.black)
                .frame(width: 100, height: 100)
                .addBorder(Color.red, width: 4, cornerRadius: 30)

            Button(action: {}) {
                Text("2")
                    .foregroundColor(Color.black)
                    .frame(width: 100, height: 100)
                    .background(Color.orange)
                    .clipCornerRadius(10, corners: .topLeft)
            }

            Button(action: {}) {
                Text("top both")
                    .foregroundColor(Color.black)
                    .frame(width: 100, height: 100)
                    .background(Color.green)
                    .clipCornerRadius(10, corners: [.topLeft, .topRight])
            }
        }
    }
}

struct RoundedCornerDemo_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCornerDemo().previewLayout(.fixed(width: 400, height: 600))
    }
}
