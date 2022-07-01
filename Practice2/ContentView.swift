//
//  ContentView.swift
//  Practice2
//
//  Created by Andrew on 30.03.2022.
//

import SwiftUI

//Главный view интерфейса
//Реализует подгрузку данных из двух источников новостей - newsapi.org и thenewsapi.com
//Первый уровень - список источников новостей. Без пейджинга.
//Из источника новостей мы проваливаемся в список новостей. С пейджингом.
//Из списка новостей проваливаемся в детализацию новости.
//Итого - три уровня вложенности на custom navigation stack.
//Модели данных, слой запросов - сгенерированы при помощи Swagger

struct ContentView: View {

    // использование pageCoordinator сведено к протокольному типу.
    private let pageCoordinator: PageCoordinatorProtocol!
    @State var selectedNewsSource: NewsItem?

    var body: some View {
            self.segmentedControl()
            .padding()
    }

    // а сам протокольный тип внедряется через constructor injection.
    // значение по умолчанию берется из DIContainer.
    init(withPageCoordinator pageCoordinator: PageCoordinatorProtocol = DIContainer.shared.resolve(type: PageCoordinatorProtocol.self)!) {
        self.pageCoordinator = pageCoordinator
        self.selectedNewsSource = pageCoordinator.defaultPage
    }

}

extension ContentView {

    private func segmentedControl() -> some View {

        let items: [NewsItem] = self.pageCoordinator.pages

        return VStack {

            Picker("Select a news source?", selection: $selectedNewsSource) {

                ForEach(items, id: \.self ) {
                    Text($0.title)
                        .tag($0.rawValue)
                }
            }
            .pickerStyle(.segmented)

            self
                .pageCoordinator
                .view(by: self.selectedNewsSource ?? self.pageCoordinator.defaultPage)
            Spacer()
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
