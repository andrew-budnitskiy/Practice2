//
//  SourcesViewModelProtocol.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 04.06.2022.
//

import Foundation

protocol SourcesListViewModel {

    associatedtype NewsSourceType: NewsSource
    var canLoad: Bool { get set }
    var list: [NewsSourceType] { get set }
    func fetchData()

}
