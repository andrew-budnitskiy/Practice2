//
//  DIContainerProtocol.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 04.06.2022.
//

import Foundation

// Протоколо для реализации DIContainer
protocol DIContainerProtocol {
  func register<Component>(type: Component.Type, component: Any)
  func resolve<Component>(type: Component.Type) -> Component?
}
