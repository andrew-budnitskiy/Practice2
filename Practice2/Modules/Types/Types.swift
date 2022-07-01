//
//  Types.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 11.04.2022.
//

import Foundation

enum NewsItem: Int, Hashable {
    case newsApi
    case newsData
}

extension NewsItem {

    var title: String {
        switch self {
        case .newsApi:
            return "NewsApi"
        case .newsData:
            return "TheNewsApi"
        }
    }

}

// DIContainer. Реализация соответствующего протокола.
// В нем регистрируются все зависимости в проекте
// Реализуется как синглтон, чтобы источник заисимостей был в единственном экземпляре.
final class DIContainer: DIContainerProtocol {

    static let shared = DIContainer()
    private init() {}

    var components: [String: Any] = [:]

    // Метод регистрации зависимости
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }

    // Метод получения зависимости по типу
    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}
