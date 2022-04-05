//
//  NewsApiResultCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

import SwiftUI

struct NewsApiResultCell: View {
    let title: String
    let source: String
    let publishingDate: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(3)
                    .padding(5)
                    .truncationMode(.tail)
                Text(source)
                    .font(.subheadline)
                    .lineLimit(nil)
                    .padding(5)
                Text(publishingDate)
                    .font(.footnote)
                    .padding(5)
            }

            Spacer()
            Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
    }
}

struct NewsApiResultCell_Preview: PreviewProvider {
    static var previews: some View {
        NewsApiResultCell(title: "edfwefwe w RBVWERV2WD W",
                          source: "ABC News",
                          publishingDate: "27.02.2022 13:54")
    }
}
