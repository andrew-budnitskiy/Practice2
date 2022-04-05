//
//  NewsDocList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

struct NewsDataSourcesList: View {
    @StateObject private var viewModel = NewsDocSourcesViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.list) { source in
                NewsDocSourceCell(name: source.name ?? "")
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

struct NewsDataList_Previews: PreviewProvider {
    static var previews: some View {
        NewsDataSourcesList()
    }
}

