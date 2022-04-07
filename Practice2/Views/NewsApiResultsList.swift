//
//  NewsApiResultsList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

struct NewsApiResultsList: View {

    @ObservedObject var viewModel: NewsApiResultsViewModel

    var body: some View {

        VStack {
            NavigationBarWithBackButton(title: viewModel.sourceName)
                List {

                    ForEach(viewModel.list, id: \.self) { item in

                        LazyView(NewsApiResultCell(data: item)
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
                    viewModel.fetchData()
                }
            Spacer()
        }

    }
}

extension NewsApiResultsList {

    var title: String {
        return "News from \(viewModel.sourceName)"
    }

}
