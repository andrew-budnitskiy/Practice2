//
//  NewsApiList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

struct NewsApiSourcesList: View {
    @StateObject private var viewModel = NewsApiSourcesViewModel()

    var body: some View {

            NavigationContainerView {
                VStack {

                    NavigationBarWithBackButton(title: "News sources",
                                                useBackButton: false)

                    List {

                            ForEach(viewModel.list) { source in
                                LazyView(NewsApiSourceCell(name: source.name ?? "",
                                                  sourceId: source._id ?? ""))
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

struct NewsApiList_Previews: PreviewProvider {
    static var previews: some View {
        NewsApiSourcesList()
    }
}

