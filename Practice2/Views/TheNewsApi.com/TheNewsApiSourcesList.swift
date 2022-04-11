//
//  NewsDocList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

//Список новостей TheNewsApi.com. С пейджингом
struct TheNewsApiSourcesList: View {

    @ObservedObject var viewModel: TheNewsApiSourcesViewModel
    
    var body: some View {

        NavigationContainerView {

            VStack {

                NavigationBarWithBackButton(title: "News sources",
                                            useBackButton: false)

                List {

                    ForEach(viewModel.list, id: \.id) { source in

                            let resultsList = NewsResultsList(viewModel:
                                                    TheNewsApiResultsViewModel(withSource: source.identifier,                                         withSourceName: source.title))
                            LazyView(NewsSourceCell(data: source,
                                                    resultsList: resultsList))
                        }

                }
                .showActivityIdicator(!viewModel.canLoad &&
                                      viewModel.list.isEmpty,
                                      onTop: true)
                
                Spacer()
            }
        }
        .listStyle(.plain)
        .onAppear {
            viewModel.fetchData()
        }
    }

}
