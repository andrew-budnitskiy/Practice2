//
//  NewsApi.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 07.06.2022.
//

import Foundation


typealias NewsApiSourcesResult = (Result<NewsApiSources?, Error>) -> Void
typealias TheNewsApiSourcesResult = (Result<TheNewsApiSources?, Error>) -> Void

protocol NewsApi {

    static func fetchTheNewsApiSources(response: @escaping TheNewsApiSourcesResult)
    static func fetchNewsApiSources(response: @escaping NewsApiSourcesResult)


}
