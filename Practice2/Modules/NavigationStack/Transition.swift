//
//  Transition.swift
//  OtusNavigationStack
//
//  Created by Anna Zharkova on 09.12.2021.
//

import Foundation
import SwiftUI

enum Transition {
    case none
    case custom(AnyTransition)
}

enum NavigationType {
    case pop
    case push
    case popToRoot
}
