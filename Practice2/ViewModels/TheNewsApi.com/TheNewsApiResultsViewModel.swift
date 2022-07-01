//
//  TheNewsApiResultsViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

//ViewModel для запроса списка новостей на TheNewsApi.com
//С пейджингом
class TheNewsApiResultsViewModel : NewsListViewModelProtocol {

    var list: [TheNewsApiResult] = []
    @Published var canLoad: Bool = true

    var sourceId: String
    var sourceName: String
    private var page: Int = 1
    private var totalCount: Int = .max

    // Функционал сетевых запросов сведен к протокольному типу NewsApiNetworkingProtocol
    private let newsApi: NewsApiNetworkingProtocol.Type

    // конкретная реализация сетевого функционала newsApi передается через dependency injection по типу constructor injection
    // по умолчанию значение берется из общего контейнера зависимостей
    init(withSource source: String,
         withSourceName sourceName: String,
         withApi newsApi: NewsApiNetworkingProtocol.Type = DIContainer.shared.resolve(type: NewsApiNetworkingProtocol.Type.self)!) {
        self.sourceId = source
        self.sourceName = sourceName
        self.newsApi = newsApi
    }

    func fetchData() {
        guard canLoad else {
            return
        }
        guard totalCount > self.list.count else {
            return
        }

        canLoad = false

        self.newsApi.fetchTheNewsApiResults(page: self.page, domains: self.sourceId, limit: 25) { [weak self] receivedData in

            switch receivedData {

            case .success(let data):
                self?.totalCount = data?.meta?.found ?? .max
                self?.list.append(contentsOf: (data?.data ?? []))
                self?.page += 1
            case .failure(let error):
                print("Error \(String(describing: error))")
            }
            self?.canLoad = true

        }

//            DefaultAPI.theNewsApiResults(page: self.page, domains: self.sourceId) { [weak self] data, error in
//
//                if error == nil {
//                    self?.totalCount = data?.meta?.found ?? .max
//                    self?.list.append(contentsOf: (data?.data ?? []))
//                    self?.page += 1
//                } else {
//                    print("Error \(String(describing: error))")
//                }
//                self?.canLoad = true
//            }

    }
}
