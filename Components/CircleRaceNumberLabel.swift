//
//  CircleLabel.swift
//
//  Created by LW on 28/8/20.
//

import SwiftUI

struct CircleRaceNumberLabel: View {
    var diameter: CGFloat = 25
    var title: String = "R1"
    var body: some View {
        Text("R\(title)")
            .frame(width: diameter, height: diameter, alignment: .center)
            .foregroundColor(Color.mainTextColor)
            .font(.system(size: diameter / 2.5))
            .overlay(Circle().stroke(Color.mainTextColor, lineWidth: 1))
    }
}

struct CircleRaceNumberLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleRaceNumberLabel().previewLayout(.fixed(width: 400, height: 100))
            CircleRaceNumberLabel(diameter: 80, title: "80").previewLayout(.fixed(width: 400, height: 100))
        }
    }
}
