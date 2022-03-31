//
//  ContentView.swift
//  Practice2
//
//  Created by Andrew on 30.03.2022.
//

import SwiftUI

struct ContentView: View {

    @State var favoriteColor = "General"

    var body: some View {
        self.segmentedControl()
            .padding()
    }




}

extension ContentView {

    private func segmentedControl() -> some View {

        struct SegmentedItem: Hashable {
            let title: String
            let category: String
        }

        let items: [SegmentedItem] = [SegmentedItem(title: "General", category: "general"),
                                      SegmentedItem(title: "Business", category: "business"),
                                      SegmentedItem(title: "Sports", category: "sports")]

        return VStack {
                    Picker("What is your favorite color?", selection: $favoriteColor) {

                        ForEach(items, id: \.self ) {
                            Text($0.title)
                                .tag($0.title)
                        }
                    }
                    .pickerStyle(.segmented)

                    Text("Value: \(favoriteColor)")
            Spacer()
                }

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
