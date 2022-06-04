//
//  DIContainerProtocol.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 04.06.2022.
//

import Foundation

protocol DIContainerProtocol {
  func register<Component>(type: Component.Type, component: Any)
  func resolve<Component>(type: Component.Type) -> Component?
}

final class DIContainer: DIContainerProtocol {

    static let shared = DIContainer()
    private init() {}

    var components: [String: Any] = [:]

    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }

    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}
