//
//  NavigationBarModifier.swift
//
//  Created on 22/06/2020.
//  Copyright © 2020 WildAid. All rights reserved.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    var title = ""

    var backgroundColor = Color.white
    var separatorColor = Color.inactiveBar

    var separatorHeight: CGFloat = 0.5
    var barHeight: CGFloat = 64

    func body(content: Content) -> some View {
        VStack(spacing: .zero) {
            NavigationBarView(title: title,
                backgroundColor: backgroundColor,
                separatorColor: separatorColor,
                separatorHeight: separatorHeight,
                barHeight: barHeight)

            content
        }
    }
}

extension View {
    func navigationBarView(title: String,
                           backgroundColor: Color = .red,
                           separatorColor: Color = .inactiveBar,
                           separatorHeight: CGFloat = 0.5,
                           barHeight: CGFloat = 64) -> some View {

        self.modifier(NavigationBarModifier(title: title, backgroundColor: backgroundColor, separatorColor: separatorColor, separatorHeight: separatorHeight, barHeight: barHeight))
    }
}
