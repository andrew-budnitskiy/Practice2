//
//  NewsApiSourceCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

// Ячейка списка источников новостей.
// Параметризована типом данных NewSourceType
// и view списка новостей ResultsListType, который будет открыт при нажатии на нее
struct NewsSourceCell<NewsSourceType: NewsSource, ResultsListType: View>: View {

    let data: NewsSourceType
    let resultsList: LazyView<ResultsListType>
    @EnvironmentObject private var router: NavigationContainerViewModel

    var body: some View {
        HStack {

            Button("\(self.data.title)") {
                router.push(screenView: resultsList.toAnyView())
            }
            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
    }
}