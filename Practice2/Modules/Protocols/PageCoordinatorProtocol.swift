//
//  PageCoordinatorProtocol.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 04.06.2022.
//

import Foundation
import SwiftUI

protocol PageCoordinatorProtocol {

    var defaultPage: NewsItem { get }
    var pages: [NewsItem] { get }
    func view(by page: NewsItem?) -> AnyView

}
