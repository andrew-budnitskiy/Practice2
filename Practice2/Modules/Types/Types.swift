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
