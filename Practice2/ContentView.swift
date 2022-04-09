//
//  ContentView.swift
//  Practice2
//
//  Created by Andrew on 30.03.2022.
//

import SwiftUI


enum NewsItem: Int, Hashable {
    case newsApi
    case newsData
}

extension NewsItem {

    var title: String {
        switch self {
        case .newsApi:
            return "NewsApi"
        case .newsData:
            return "NewsData"
        }
    }

}

final class ContentView: View {

    @State var selectedNewsSource = NewsItem.newsApi

    var body: some View {
            self.segmentedControl()
            .padding()
    }

    private lazy var newsApiSourcesList: NewsApiSourcesList = {
        return NewsApiSourcesList()
    }()

    private lazy var theNewsApiSourcesList: TheNewsApiSourcesList = {
        return TheNewsApiSourcesList()
    }()

}

extension ContentView {

    private func segmentedControl() -> some View {

        let items: [NewsItem] = [.newsApi, .newsData]

        return VStack {

            Picker("Select a news source?", selection: $selectedNewsSource) {

                ForEach(items, id: \.self ) {
                    Text($0.title)
                        .tag($0.rawValue)
                }
            }
            .pickerStyle(.segmented)

            switch self.selectedNewsSource {
            case .newsApi:
                self.newsApiSourcesList
            case .newsData:
                self.theNewsApiSourcesList
            }
            Spacer()
        }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
