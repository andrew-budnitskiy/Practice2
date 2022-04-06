//
//  NavigationContainerView.swift
//  OtusNavigationStack
//
//  Created by Anna Zharkova on 09.12.2021.
//

import SwiftUI



struct NavigationContainerView<Content:View>: View {
    
    @ObservedObject var viewModel = NavigationContainerViewModel()
    private let content: Content
    private let animation: Animation = .easeOut(duration: 0.3)
    
    init(@ViewBuilder content: @escaping ()-> Content) {
        self.content = content()
    }
    
    var body: some View {
        let transition = viewModel.transition ?? .slide
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                self.content.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(transition)
            } else {
                viewModel.currentScreen?.view.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(transition)
            }
        }
    }
}

