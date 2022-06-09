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
        let container = DIContainer.shared
        container.register(type: PageCoordinatorProtocol.self, component: PageCoordinator())
        container.register(type: NewsApi.Type.self, component: DefaultAPI.self)
    }

    var body: some Scene {

        WindowGroup {
            ContentView()
        }
    }
}
