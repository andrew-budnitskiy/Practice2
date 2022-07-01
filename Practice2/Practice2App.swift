//
//  Practice2App.swift
//  Practice2
//
//  Created by Andrew on 30.03.2022.
//

import SwiftUI

@main
struct Practice2App: App {

    init() {
        //Создание DIContainer
        let container = DIContainer.shared
        // и регистрация в нем экземпляров классов
        container.register(type: PageCoordinatorProtocol.self, component: PageCoordinator())
        container.register(type: NewsApiNetworkingProtocol.Type.self, component: DefaultAPI.self)
    }

    var body: some Scene {

        WindowGroup {
            ContentView()
        }
    }
}
