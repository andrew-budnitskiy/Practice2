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
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    init(transition: Transition, @ViewBuilder content: @escaping ()-> Content) {
        self.content = content()
        switch transition {
        case .none:
            self.transition = (.identity , .identity)
        case .custom(let transition):
            self.transition = (transition, transition)
        }
    }
    
    var body: some View {
        var isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                self.content.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen?.view.environmentObject(self.viewModel)
                    .animation(animation)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}

