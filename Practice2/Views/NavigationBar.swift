//
//  NavigationBar.swift
//  Practice2
//
//  Created by Andrew on 07.04.2022.
//

import Foundation
import SwiftUI

struct NavigationBarWithBackButton: View {

    var title: String
    var useBackButton: Bool = true
    var body: some View {

        HStack {
            if useBackButton {
                BackButton()
            }
            Spacer()
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .lineLimit(1)


            Spacer()
        }
        .padding(.vertical, 12.0)

    }


}
