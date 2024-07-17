//
//  Font+Extention.swift
//  RickAndMorty
//
//  Created by Andrei Kovryzhenko on 18.07.2024.
//

import Foundation
import SwiftUI

enum IBMPlexSansFonts: String {
    case bold = "IBMPlexSans-Bold"
    case boldItalic = "IBMPlexSans-BoldItalic"
    case extraLight = "IBMPlexSans-ExtraLight"
    case extraLightItalic = "IBMPlexSans-ExtraLightItalic"
    case italic = "IBMPlexSans-Italic"
    case light = "IBMPlexSans-Light"
    case lightItalic = "IBMPlexSans-LightItalic"
    case medium = "IBMPlexSans-Medium"
    case mediumItalic = "IBMPlexSans-MediumItalic"
    case regular = "IBMPlexSans-Regular"
    case semiBold = "IBMPlexSans-SemiBold"
    case semiBoldItalic = "IBMPlexSans-SemiBoldItalic"
    case thin = "IBMPlexSans-Thin"
    case thinItalic = "IBMPlexSans-ThinItalic"
}

extension Font {
    static func custom(_ customFonts: IBMPlexSansFonts, size: CGFloat) -> Font {
        Font.custom(customFonts.rawValue, size: size)
    }
}

extension Text {
    func font(_ customFonts: IBMPlexSansFonts, size: CGFloat) -> Text {
        self.font(Font.custom(customFonts, size: size))
    }
}
