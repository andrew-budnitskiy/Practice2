//
//  NewsApiResultsList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

// Ячейка списка новостей.
// Параметризована вьюмоделью, отвечающей за загрузку данных в список
struct NewsResultsList<ViewModelType: NewsListViewModel>: View {

    @ObservedObject var viewModel: ViewModelType

    var body: some View {

        VStack {
            NavigationBarWithBackButton(title: viewModel.sourceName)
                List {

                    ForEach(viewModel.list, id: \.self) { item in

                        LazyView(NewsResultCell(data: item)
                                        .onAppear {
                                            let isLastCharacter = viewModel.list.isLastItem(item)
                                            if isLastCharacter && viewModel.canLoad {
                                                viewModel.fetchData()
                                            }
                                        }
                                        .listSectionSeparator(.hidden)

                                 )
                    }

                }
                .showActivityIdicator(viewModel.canLoad == false,
                                      onTop: viewModel.list.isEmpty)

                .listStyle(.plain)
                .onAppear {
                    if viewModel.list.isEmpty {
                        viewModel.fetchData()
                    }
                }
            Spacer()
        }

    }
}

extension NewsResultsList {

    var title: String {
        return "News from \(viewModel.sourceName)"
    }

}
