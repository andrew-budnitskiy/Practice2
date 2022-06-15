//
//  NewsApi.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 07.06.2022.
//

import Foundation


typealias NewsApiSourcesResult = (Result<NewsApiSources?, Error>) -> Void
typealias NewsApiResultsResult = (Result<NewsApiResults?, Error>) -> Void
typealias TheNewsApiSourcesResult = (Result<TheNewsApiSources?, Error>) -> Void
typealias TheNewsApiResultsResult = (Result<TheNewsApiResults?, Error>) -> Void

protocol NewsApiNetworkingProtocol {

    static func fetchTheNewsApiSources(response: @escaping TheNewsApiSourcesResult)
    static func fetchTheNewsApiResults(page: Int,
                                       domains: String,
                                       limit: Int,
                                       response: @escaping TheNewsApiResultsResult)
    static func fetchNewsApiSources(response: @escaping NewsApiSourcesResult)
    static func fetchNewsApiResults(sources: String,
                                    page: Int,
                                    pageSize: Int,
                                    response: @escaping NewsApiResultsResult)

}
