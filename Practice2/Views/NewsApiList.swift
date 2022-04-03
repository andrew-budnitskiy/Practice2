//
//  NewsApiList.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

struct NewsApiList: View {
    @StateObject private var viewModel = NewsApiSourcesViewModel()

    var body: some View {
        List {
            ForEach(viewModel.list) { source in
                let isLastCharacter = viewModel.list.isLastItem(source)
                NewsApiSourceCell(name: source.name ?? "")
                    .onAppear {
                        if isLastCharacter && viewModel.canLoad {
                            viewModel.fetchData()
                        }
                    }
                    .showActivityIdicator(
                        viewModel.canLoad == false && isLastCharacter
                    )
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
        .navigationBarTitle(Text("News sources"))
    }
}

struct NewsApiList_Previews: PreviewProvider {
    static var previews: some View {
        NewsApiList()
    }
}

