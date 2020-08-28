//
//  BarButtonImage.swift
//
//  Created by LW on 28/8/20.
//

import Foundation
import SwiftUI

public extension Image {
    enum AppImageStyle {
        case barButton
    }

    func style(appStyle: AppImageStyle) -> some View {
        switch appStyle {
        case .barButton: return barButton()
        }
    }
}

extension Image {
    private func barButton() -> some View {
        imageScale(.medium)
            .font(.system(size: 16, weight: .bold, design: .rounded))
    }
}

extension Image {
    static func randomSystemImage() -> Image {
        let images = ["pencil.circle", "trash.circle", "folder.circle", "doc.circle", "book.circle", "link.circle", "moon.circle", "circle.grid.hex", "heart.circle", "flag.circle", "bell.circle", "bolt.circle", "clock", "gift", "a.circle", "livephoto.play"]
        let random = Int.random(in: 0 ..< images.count)
        return Image(systemName: images[random])
    }
}
