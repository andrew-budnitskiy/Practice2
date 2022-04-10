//
//  NewsApiResultCell.swift
//  Practice2
//
//  Created by Andrey Budnitskiy on 03.04.2022.
//

import Foundation

import SwiftUI

struct NewsResultCell<NewsType: News>: View {

    let data: NewsType
    @EnvironmentObject private var router: NavigationContainerViewModel
    @State private var animationStarted = false

    var body: some View {

        Button  {

            let detailInfo = NewDetailInfo(title: data.header,
                                           source: data.origin,
                                           author: data.writer,
                                           date: data.publishingDate,
                                           info: data.description)
            self.router.push(screenView: LazyView(detailInfo).toAnyView())

        } label: {

            HStack {
                VStack(alignment: .leading) {
                    Text(data.header)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .padding(5)
                        .truncationMode(.tail)
                    Text(data.origin)
                        .font(.subheadline)
                        .lineLimit(nil)
                        .padding(5)
                    Text(data.publishingDate)
                        .font(.footnote)
                        .padding(5)
                }

                Spacer()

                HStack {
                    Spacer()
                    Button.init {
                        withAnimation(.easeInOut(duration: 5)) {
                            self.animationStarted = true
                        }
                    } label: {
                        Image(systemName: "heart")
                            .padding(.horizontal, 10)
                            .offset(x: animationStarted ? 30 : 0,
                                    y: animationStarted ? -200 : 0)
                    }

                    Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                }
            }
        }
    }

}
