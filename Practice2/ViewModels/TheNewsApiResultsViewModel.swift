//
//  TheNewsApiResultsViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

class TheNewsApiResultsViewModel : NewsListViewModel {

    var list: [TheNewsApiResult] = []
    @Published var canLoad: Bool = true

    var sourceId: String
    var sourceName: String
    private var page: Int = 1
    private var totalCount: Int = .max

    init(withSource source: String,
         withSourceName sourceName: String) {
        self.sourceId = source
        self.sourceName = sourceName
    }

    func fetchData() {
        guard canLoad else {
            return
        }
        guard totalCount > self.list.count else {
            return
        }

        canLoad = false

            DefaultAPI.theNewsApiResults(page: self.page, domains: self.sourceId) { [weak self] data, error in

                if error == nil {
                    self?.totalCount = data?.meta?.found ?? .max
                    self?.list.append(contentsOf: (data?.data ?? []))
                    self?.page += 1
                } else {
                    print("Error \(String(describing: error))")
                }
                self?.canLoad = true
            }

    }
}
