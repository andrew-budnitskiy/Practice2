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
struct NewsResultsList<ViewModelType: NewsListViewModelProtocol>: View {

    @ObservedObject var viewModel: ViewModelType

    var body: some View {

        VStack {
            NavigationBarWithBackButton(title: viewModel.sourceName)
                List() {

                    ForEach(viewModel.list, id: \.id) { item in

                        let isLastCharacter = viewModel.list.isLastItem(item)
                        NewsResultCell(data: item)
                                        .onAppear {

                                            if isLastCharacter && viewModel.canLoad {
                                                viewModel.fetchData()
                                            }
                                        }
                                        .listSectionSeparator(.hidden)
                        if isLastCharacter {
                            HStack {
                                Spacer()
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                                Spacer()
                            }
                            .listRowSeparator(.hidden)
                        }
                    }

                }
                .listStyle(.plain)
                .onAppear {
                    if viewModel.list.isEmpty {
                        viewModel.fetchData()
                    }
                }
                .showActivityIdicator(viewModel.canLoad == false && viewModel.list.isEmpty,
                                      onTop: true)
            Spacer()
        }

    }
}

extension NewsResultsList {

    var title: String {
        return "News from \(viewModel.sourceName)"
    }

}
