//
//  SideMenu.swift
//  TestApp
//
//  Created by TeamX Tec on 01/04/2023.
//

import Foundation
import SwiftUI
struct SideMenuView: View {
    @Binding var isOpen: Bool
    @Binding var text: String
    let width: CGFloat = 270

    var body: some View {
        ZStack {
            withAnimation(Animation.easeIn(duration: 0.3)){
                GeometryReader { geometry in
                    EmptyView()
                }
            }
            .background(Color.clear)
            .opacity(self.isOpen ? 1.0 : 0.0)
            .opacity(1.0)
            
            .onTapGesture {
              
                    self.isOpen = false
                
            }

            HStack {
                withAnimation(Animation.easeIn(duration: 0.25)){
                    VStack() {
                        SideMenuContentView(topPadding: 100, systemName: "person", text: "Profile", bindText: $text, isOpen: $isOpen)
                        SideMenuContentView(systemName: "bookmark", text: "Bookmark", bindText: $text, isOpen: $isOpen)
                        SideMenuContentView(systemName: "gear", text: "Setting", bindText: $text, isOpen: $isOpen)
                        Spacer()
                    }
                    .frame(width: width)
                    .background(Color.blue)
                    .offset(x: self.isOpen ? 0 : -self.width)
                }
                Spacer()
            }
        }
    }
}

struct SideMenuContentView: View {
    let topPadding: CGFloat
    let systemName: String
    let text: String
    @Binding var bindText: String
    @Binding var isOpen: Bool

    init(topPadding: CGFloat = 30, systemName: String, text: String, bindText: Binding<String>, isOpen: Binding<Bool>) {
        self.topPadding = topPadding
        self.systemName = systemName
        self._bindText = bindText
        self._isOpen = isOpen
        self.text = text
    }

    var body: some View {
        HStack {
            Image(systemName: systemName)
                .foregroundColor(.red)
                .imageScale(.large)
                .frame(width: 32.0)
            Text(text)
                .foregroundColor(.black)
                .font(.headline)
            Spacer()
        }
        .padding(.top, topPadding)
        .padding(.leading, 32)
        .onTapGesture {
            self.bindText = self.text
            self.isOpen = false
        }
    }
}
