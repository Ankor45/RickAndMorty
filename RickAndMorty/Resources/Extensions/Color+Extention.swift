//
//  Color+Extention.swift
//  RickAndMorty
//
//  Created by Andrei Kovryzhenko on 18.07.2024.
//

import Foundation
import SwiftUI

extension View {
    func setStatusColor(_ status: String) -> some View {
        modifier(SetStatusColor(status: status))
    }
    func setBackgroundStatusColor(_ status: String) -> some View {
        modifier(SetBackgroundStatusColor(status: status))
    }
}

struct SetStatusColor: ViewModifier {
    let status: String
    func body(content: Content) -> some View {
        content
            .foregroundStyle(status.statusColor())
    }
}
struct SetBackgroundStatusColor: ViewModifier {
    let status: String
    func body(content: Content) -> some View {
        content
            .background(status.statusColor())
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

extension String {
    func statusColor() -> Color {
        var color = Color.clear
        switch self {
        case "Alive":
            color = Color(0x198737)
        case "Dead":
            color = Color(0xD62300)
        case "unknown":
            color = Color(0x686874)
        default:
            color = Color.clear
        }
        return color
    }
}
