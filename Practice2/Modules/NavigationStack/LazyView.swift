//
//  LazyView.swift
//  OtusNavigationStack
//
//  Created by Anna Zharkova on 09.12.2021.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: ()->Content
    init(_ build: @autoclosure @escaping ()->Content) {
        self.build = build 
    }
    
    var body: some View {
        build()
    }
}

