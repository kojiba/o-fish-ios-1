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
    var barHeight: CGFloat = 64

    var body: some View {

        VStack(spacing: .zero) {
            Spacer(minLength: .zero)

            HStack {

                Text(title)
            }

            Spacer(minLength: .zero)

            separatorColor
                .frame(height: separatorHeight)
        }
            .background(backgroundColor)
            .frame(height: barHeight)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Nav bar title", backgroundColor: .red)
    }
}
