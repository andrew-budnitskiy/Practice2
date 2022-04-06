//
//  NavigationContainerViewModel.swift
//  OtusNavigationStack
//
//  Created by Anna Zharkova on 09.12.2021.
//

import Foundation
import SwiftUI

class NavigationContainerViewModel : ObservableObject {
    @Published var currentScreen: Screen?
    var transition: AnyTransition? = nil
    
    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    func push(screenView: AnyView) {
        self.transition = .backslide
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    func pop() {
        self.transition = .slide
        screenStack.pop()
    }
    
    func popToRoot() {
        self.transition = .slide
        screenStack.popToRoot()
    }
}
