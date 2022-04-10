//
//  News.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 10.04.2022.
//

import Foundation

protocol News {

    var header: String { get }
    var writer: String { get }
    var description: String { get }
    var origin: String { get }
    var publishingDate: String { get }

}
