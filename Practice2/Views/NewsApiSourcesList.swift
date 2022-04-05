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
        List {
            ForEach(viewModel.list) { source in
                NewsApiSourceCell(name: source.name ?? "")
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

struct NewsApiList_Previews: PreviewProvider {
    static var previews: some View {
        NewsApiSourcesList()
    }
}

