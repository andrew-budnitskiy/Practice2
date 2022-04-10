//
//  NewsApiList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

//Список новостей NewsApi.org. С пейджингом.
struct NewsApiSourcesList: View {

    @ObservedObject var viewModel: NewsApiSourcesViewModel

    var body: some View {

            NavigationContainerView {
                VStack {

                    NavigationBarWithBackButton(title: "News sources",
                                                useBackButton: false)

                    List {

                        ForEach(viewModel.list) { source in

                            let resultsList = NewsResultsList(viewModel:
                                                    NewsApiResultsViewModel(withSource: source.identifier,                                         withSourceName: source.title))

                            LazyView(NewsSourceCell(data: source,
                                                       resultsList: resultsList))
                            }

                    }
                    Spacer()
                }
            }
            .showActivityIdicator(viewModel.list.count == 0,
                                  onTop: true)
            .listStyle(.plain)
            .onAppear {
                viewModel.fetchData()
            }

    }

}

