//
//  NewsApiResultCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

import SwiftUI

struct NewsApiResultCell: View {
    static func == (lhs: NewsApiResultCell, rhs: NewsApiResultCell) -> Bool {
        return lhs.data.id == rhs.data.id
    }


    let data: NewsApiResult
    @EnvironmentObject private var router: NavigationContainerViewModel

    var body: some View {

        Button  {

            let detailInfo = NewDetailInfo(title: data.title.or("-"),
                                           source: (data.source?.name).or(""),
                                           author: data.author.or(""),
                                           date: (data.publishedAt?.toString()).or(""),
                                           info: data._description.or(""))
            self.router.push(screenView: LazyView(detailInfo).toAnyView())

        } label: {

            HStack {
                VStack(alignment: .leading) {
                    Text(data.title.or(""))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .padding(5)
                        .truncationMode(.tail)
                    Text((data.source?.name).or(""))
                        .font(.subheadline)
                        .lineLimit(nil)
                        .padding(5)
                    Text((data.publishedAt?.toString(withFormat: "dd.MM.yyyy HH:mm")).or(""))
                        .font(.footnote)
                        .padding(5)
                }

                Spacer()

                Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
        }

}
