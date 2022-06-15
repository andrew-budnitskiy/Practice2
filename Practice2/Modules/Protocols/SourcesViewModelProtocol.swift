//
//  SourcesViewModelProtocol.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 04.06.2022.
//

import Foundation

protocol SourcesListViewModelProtocol {

    associatedtype NewsSourceType: NewsSourceProtocol
    var canLoad: Bool { get set }
    var list: [NewsSourceType] { get set }
    func fetchData()

}
