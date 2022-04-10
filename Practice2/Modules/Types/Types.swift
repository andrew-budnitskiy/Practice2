//
//  Types.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 11.04.2022.
//

import Foundation

enum NewsItem: Int, Hashable {
    case newsApi
    case newsData
}

extension NewsItem {

    var title: String {
        switch self {
        case .newsApi:
            return "NewsApi"
        case .newsData:
            return "NewsData"
        }
    }

}
