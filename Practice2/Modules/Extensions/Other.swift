//
//  Extensions.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

extension Optional where Wrapped == String {
    func or(_ value: String) -> String {
        switch self {
        case .none: return value
        case .some: return self!
        }
    }

}


extension String {

    static func random(length: Int = 10) -> String {
        let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString: String = ""

        for _ in 0..<length {
            let randomValue = arc4random_uniform(UInt32(base.count))
            randomString += "\(base[base.index(base.startIndex, offsetBy: Int(randomValue))])"
        }
        return randomString
    }

}

extension Date {

    func toString(withFormat format: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "ru_RU")

        return dateFormatter.string(from: self)

    }

}
