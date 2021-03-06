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
class TheNewsApiSourcesViewModel : ObservableObject {
    var list: [TheNewsApiSource] = []
    @Published var canLoad: Bool = true

    func fetchData() {
        guard canLoad == true else {
            return
        }

        canLoad = false
        DefaultAPI.theNewsApiSources { [weak self]  data, error in

            if error == nil {
                self?.list.append(contentsOf: (data?.data ?? []))
            } else {
                print("Error \(String(describing: error))")
            }
            self?.canLoad = true
            
        }

    }
}
