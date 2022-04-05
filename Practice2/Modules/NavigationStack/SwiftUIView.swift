//
//  SwiftUIView.swift
//  OtusNavigationStack
//
//  Created by Anna Zharkova on 09.12.2021.
//

import SwiftUI

extension View {
    func toAnyView()->AnyView {
        AnyView(self)
    }
}
