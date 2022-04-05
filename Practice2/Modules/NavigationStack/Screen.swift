//
//  Screen.swift
//  OtusNavigationStack
//
//  Created by Anna Zharkova on 09.12.2021.
//

import Foundation
import SwiftUI


struct Screen: Identifiable, Equatable {
    let id = UUID().uuidString
    let view: AnyView
    
    public static func == (lhs: Screen, rhs: Screen)-> Bool {
        return lhs.id == rhs.id 
    }
}
