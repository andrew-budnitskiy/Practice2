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
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    func push(screenView: AnyView) {
        self.navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    func pop() {
        self.navigationType = .pop
        screenStack.pop()
    }
    
    func popToRoot() {
        self.navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
