//
//  NewsListViewModel.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 10.04.2022.
//

import Foundation

protocol NewsListViewModelProtocol: ObservableObject {

    associatedtype ItemType: NewsItemProtocol & Hashable & Identifiable
    var sourceName: String { get set }
    var canLoad: Bool { get set }
    var list: [ItemType] { get }
    func fetchData()

}
