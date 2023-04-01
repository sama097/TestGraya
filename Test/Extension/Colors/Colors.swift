//
//  Colors.swift
//  Test
//
//  Created by TeamX Tec on 31/03/2023.
//

import Foundation
import SwiftUI

extension Color{
    
    static let appbackgroundColor = Color(0xECF6F6)
    static let placeholder = Color(0x757575)
    static let searchbarBorder = Color(0x757575)
    static let CatgeoriesSelected =  Color(0x004EDA)
    static let  CategoriesUnselected =  Color(0x988888)
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
