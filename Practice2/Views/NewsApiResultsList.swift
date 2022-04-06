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
        List {
            ForEach(viewModel.list) { item in
                let isLastCharacter = viewModel.list.isLastItem(item)
                NewsApiResultCell(title: item.title.or("-"),
                                  source: (item.source?.name).or("-"),
                                  publishingDate: (item.publishedAt?.toString(withFormat: "dd.MM.yyyy HH:mm")).or("-"))
                                .onAppear {
                                    let isLastCharacter = viewModel.list.isLastItem(item)
                                    if isLastCharacter && viewModel.canLoad {
                                        viewModel.fetchData()
                                    }
                                }
                                .showActivityIdicator(//viewModel.canLoad == false &&
                                                      (isLastCharacter || viewModel.list.isEmpty),
                                                      onTop: false)

            }

        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchData()
        }
//        .showActivityIdicator(viewModel.list.count == 0,
//                              onTop: true)
        .navigationBarTitle(Text("News sources"))

    }
}
