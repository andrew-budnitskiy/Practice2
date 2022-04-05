//
//  NewsApiResultsViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

class NewsApiResultsViewModel : ObservableObject {

    @Published var list: [NewsApiResult] = []

    var canLoad: Bool = true
    var source: String
    private var page: Int = 1
    private var totalCount: Int = .max

    init(withSource source: String) {
        self.source = source
    }

    func fetchData() {
        guard canLoad else {
            return
        }
        guard totalCount > self.list.count else {
            return
        }

        canLoad = false
        DefaultAPI.newsApiResults(sources: source,
                                  page: page) { [weak self] data, error in

            if error == nil {
                self?.totalCount = data?.totalResults ?? .max
                self?.list.append(contentsOf: (data?.articles ?? []))
                self?.page += 1
            } else {
                print("Error \(String(describing: error))")
            }
            self?.canLoad = true
        }

    }
}
