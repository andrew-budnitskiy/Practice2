//
//  NewsListViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 10.04.2022.
//

import Foundation

protocol NewsListViewModel: ObservableObject {

    associatedtype ItemType: News & Hashable & Identifiable
    var sourceName: String { get set }
    var canLoad: Bool { get set }
    var list: [ItemType] { get }
    func fetchData()

}
