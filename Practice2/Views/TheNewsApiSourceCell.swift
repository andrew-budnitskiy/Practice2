//
//  NewsDocSourceCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

import SwiftUI

struct TheNewsApiSourceCell: View {

    let name: String
    let sourceId: String
    @EnvironmentObject private var router: NavigationContainerViewModel

    var body: some View {
        HStack {

            Button("\(name)") {

                let newsList = TheNewsApiResultsList(viewModel: TheNewsApiResultsViewModel(withSource: self.sourceId,
                                                                                           withSourceName: name))
                router.push(screenView: newsList.toAnyView())

            }
            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
    }

}

