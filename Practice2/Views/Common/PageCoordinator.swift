//
//  File.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 04.06.2022.
//

import Foundation
import SwiftUI

class PageCoordinator {

    private lazy var newsApiSourceList: NewsApiSourcesList = {
        NewsApiSourcesList(viewModel: NewsApiSourcesViewModel())
    }()

    private lazy var theNewsApiSourcesList: TheNewsApiSourcesList = {
        TheNewsApiSourcesList(viewModel: TheNewsApiSourcesViewModel())
    }()

}

extension PageCoordinator: PageCoordinatorProtocol {

    var defaultPage: NewsItem {
        return .newsApi
    }

    var pages: [NewsItem] {
        return [.newsApi, .newsData]
    }

    func view(by page: NewsItem?) -> AnyView {

        switch page {
        case .newsApi:
            return AnyView(self.newsApiSourceList)
        case .newsData:
            return AnyView(self.theNewsApiSourcesList)
        default:
            return AnyView(EmptyView())
        }

    }


}
