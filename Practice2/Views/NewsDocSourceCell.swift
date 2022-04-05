//
//  NewsDocSourceCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

import SwiftUI

struct NewsDocSourceCell: View {
    let name: String

    var body: some View {
        HStack {
            Text(name)
                .padding(5)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }

    }
}

