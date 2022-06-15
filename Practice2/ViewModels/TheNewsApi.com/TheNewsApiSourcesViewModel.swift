//
//  NewsDocListViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

//ViewModel для запроса списка источников новостей на TheNewsApi.com
//Без пейджинга
class TheNewsApiSourcesViewModel : ObservableObject, SourcesListViewModelProtocol {

    private let newsApi: NewsApiNetworkingProtocol.Type
    init(with newsApi: NewsApiNetworkingProtocol.Type = DIContainer.shared.resolve(type: NewsApiNetworkingProtocol.Type.self)!) {
        self.newsApi = newsApi
    }


    var list: [TheNewsApiSource] = []
    @Published var canLoad: Bool = true

    func fetchData() {
        guard canLoad == true else {
            return
        }

        canLoad = false

        self.newsApi.fetchTheNewsApiSources { [weak self] response in
            switch response {
            case .success(let data):
                self?.list.append(contentsOf: (data?.data ?? []))
            case .failure(let error):
                print("Error \(String(describing: error))")
            }
            self?.canLoad = true
        }


//        DefaultAPI.theNewsApiSources { [weak self]  data, error in
//
//            if error == nil {
//                self?.list.append(contentsOf: (data?.data ?? []))
//            } else {
//                print("Error \(String(describing: error))")
//            }
//            self?.canLoad = true
//
//        }

    }
}
