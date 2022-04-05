//
//  NewsApiResultsList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

struct NewsApiResultsList: View {
    @StateObject private var viewModel = NewsApiResultsViewModel(withSource: "")

    var body: some View {
        List {
            ForEach(viewModel.list) { item in

                let isLastCharacter = viewModel.list.isLastItem(item)
                NewsApiResultCell(title: item.title.or("-"),
                                  source: (item.source?.name).or("-"),
                                  publishingDate: (item.publishedAt?.toString(withFormat: "dd.MM.yyyy HH:mm")).or("-"))
                                .onAppear {
                                    if isLastCharacter && viewModel.canLoad {
                                        viewModel.fetchData()
                                    }
                                }
            }
        }
        .showActivityIdicator(viewModel.list.count == 0,
                              onTop: true)
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchData()
        }
        .navigationBarTitle(Text("News sources"))

    }
}

struct NewsApiResultsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsApiResultsList()
    }
}

