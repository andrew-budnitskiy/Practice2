//
//  NewsSource.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 10.04.2022.
//

import Foundation

protocol NewsSourceProtocol: Identifiable where ID == UUID {

    var title: String { get }
    var identifier: String { get }

}
