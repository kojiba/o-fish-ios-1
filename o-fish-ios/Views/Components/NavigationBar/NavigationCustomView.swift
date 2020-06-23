//
// Created by kojiba on 22.06.2020.
// Copyright (c) 2020 WildAid. All rights reserved.
//

import SwiftUI

struct NavigationCustomView<Content>: View where Content: View {

    var title = ""

    var backgroundColor = Color.white
    var separatorColor = Color.inactiveBar

    var separatorHeight: CGFloat = 0.5
    var barHeight: CGFloat = 64

    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in

            VStack(spacing: .zero) {
                NavigationBarView(title: self.title,
                    backgroundColor: self.backgroundColor,
                    separatorColor: self.separatorColor,
                    separatorHeight: self.separatorHeight,
                    topSpacer: geometry.safeAreaInsets.top)
                self.content()
            }
                .edgesIgnoringSafeArea(.all)
        }
    }
}
