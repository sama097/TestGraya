//
//  Images.swift
//  Test
//
//  Created by TeamX Tec on 31/03/2023.
//

import Foundation
import SwiftUI

extension Image {
    
    init(icon: Icon) {
        self.init(icon.rawValue)
    }
    
//    init(systemIcon: SystemIcon) {
//        self.init(systemName: systemIcon.rawValue)
//    }
}

enum Icon: String {
case searchIcon = "searchIcon"
case menuIcon = "menu"
case backIcon = "2ndback"
case heartIcon = "2x"
case shopicon = "Rectangle 62"
    
}
