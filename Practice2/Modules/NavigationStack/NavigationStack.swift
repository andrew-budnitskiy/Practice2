//
//  NavigationStack.swift
//  OtusNavigationStack
//
//  Created by Anna Zharkova on 09.12.2021.
//

import Foundation

struct NavigationStack {
    private var screens = [Screen]()
    
    mutating func push(_ s: Screen) {
        self.screens.append(s)
    }
    
    mutating func pop() {
        _ = self.screens.popLast()
    }
    
    mutating func popToRoot() {
        self.screens.removeAll()
    }
    
    func top()->Screen? {
        return self.screens.last
    }
    
}
