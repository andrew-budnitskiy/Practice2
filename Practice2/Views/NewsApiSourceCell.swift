//
//  NewsApiSourceCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

import SwiftUI

struct NewsApiSourceCell: View {

    let name: String
    let sourceId: String
    @EnvironmentObject private var router: NavigationContainerViewModel

    var body: some View {
        HStack {

            Button("\(name)") {

                let newsList = NewsApiResultsList(viewModel: NewsApiResultsViewModel(withSource: self.sourceId,
                                                                                     withSourceName: name))
                router.push(screenView: newsList.toAnyView())

            }
            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
    }
}

struct NewsApiSourceCell_Preview: PreviewProvider {
    static var previews: some View {
        NewsApiSourceCell(name: "asdasda", sourceId: "Q")
    }
}
