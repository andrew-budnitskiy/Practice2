//
//  NewsDocListViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation
import SwiftUI

class NewsDocSourcesViewModel : ObservableObject {
    @Published var list: [NewsDataSource] = []
    var canLoad: Bool = true

    func fetchData() {
        guard canLoad == true else {
            return
        }

        canLoad = false
        DefaultAPI.newsDataSources { [weak self]  data, error in

            if error == nil {
                self?.list.append(contentsOf: (data?.results ?? []))
            } else {
                print("Error \(String(describing: error))")
            }
            self?.canLoad = true
        }

    }
}
