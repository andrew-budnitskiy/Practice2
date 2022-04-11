//
//  NewsApiListViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

//ViewModel для запроса списка источников новостей на NewsApi.org
//Без пейджинга
class NewsApiSourcesViewModel : ObservableObject {
    var list: [NewsApiSource] = []
    @Published var canLoad: Bool = true

    func fetchData() {
        guard canLoad == true else {
            return
        }

        canLoad = false
        DefaultAPI.newsApiSources { [weak self]  data, error in

            if error == nil {
                self?.list.append(contentsOf: (data?.sources ?? []))
            } else {
                print("Error \(String(describing: error))")

            }
            self?.canLoad = true

        }

    }
}
