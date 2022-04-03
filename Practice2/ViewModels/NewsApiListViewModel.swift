//
//  NewsApiListViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

class NewsApiSourcesViewModel : ObservableObject {
    @Published var list: [SourceNewsApiSources] = []
    var canLoad: Bool = true

    func fetchData() {
        guard canLoad == true else {
            return
        }

        canLoad = false
        SourcesAPI.newsApiSources { [weak self]  data, error in

            if error == nil {
                self?.list.append(contentsOf: (data?.sources ?? []))
            } else {
                print("Error \(String(describing: error))")
            }
            self?.canLoad = true
        }

    }
}
