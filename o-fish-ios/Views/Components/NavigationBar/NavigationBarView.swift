//
//  NavigationBarView.swift
//
//  Created on 22/06/2020.
//  Copyright © 2020 WildAid. All rights reserved.
//

import SwiftUI

struct NavigationBarView: View {

    var title = ""

    var backgroundColor = Color.white
    var separatorColor = Color.inactiveBar

    var separatorHeight: CGFloat = 0.5
    var barHeight: CGFloat = 44
    var topSpacer: CGFloat = 0

    var body: some View {
        VStack(spacing: .zero) {
            Spacer(minLength: topSpacer)

            VStack {
                Spacer(minLength: .zero)
                HStack {
                    Text(title)
                        .font(Font.body.weight(.semibold))
                }
                Spacer(minLength: .zero)
            }

            separatorColor
                .frame(height: separatorHeight)
        }
            .background(backgroundColor)
            .frame(height: barHeight + topSpacer)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Nav bar title", backgroundColor: .red)
    }
}
