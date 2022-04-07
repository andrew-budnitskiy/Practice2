//
//  BackButton.swift
//  Practice2
//
//  Created by Andrew on 07.04.2022.
//

import Foundation
import SwiftUI

struct BackButton: View {

    @EnvironmentObject private var router: NavigationContainerViewModel

    var body: some View {

        Button {
            self.router.pop()
        } label: {
            Image(systemName: "arrow.backward")
                .foregroundColor(.gray)
        }


    }

}
