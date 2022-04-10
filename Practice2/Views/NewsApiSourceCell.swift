//
//  NewsApiSourceCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

import SwiftUI

struct NewsApiSourceCell<NewsSourceType: NewsSource>: View {

    let data: NewsSourceType
    @EnvironmentObject private var router: NavigationContainerViewModel

    var body: some View {
        HStack {

            Button("\(self.data.title)") {

                let newsList = NewsResultsList(viewModel: NewsApiResultsViewModel(withSource: self.data.identifier,
                                                                                     withSourceName: self.data.title))
                router.push(screenView: newsList.toAnyView())

            }
            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
    }
}
