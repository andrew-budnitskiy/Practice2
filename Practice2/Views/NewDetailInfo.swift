//
//  NewDetailInfo.swift
//  Practice2
//
//  Created by Andrew on 07.04.2022.
//

import Foundation
import SwiftUI

struct NewDetailInfo: View {

    let title: String
    let source: String
    let author: String
    let date: String
    let info: String

    var body: some View {

        VStack() {
            NavigationBarWithBackButton(title: title, useBackButton: true)
            Text(self.info)
                .font(.callout)
            Divider()
                .foregroundColor(/*@START_MENU_TOKEN@*/.gray/*@END_MENU_TOKEN@*/)
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text(self.source)
                    Text(self.author)
                    Text(self.date)
                }
            }
            .padding(.trailing, 12.0)
            .font(/*@START_MENU_TOKEN@*/.caption/*@END_MENU_TOKEN@*/)
            Spacer()

        }
        .padding(12.0)

    }

}

struct NewsDetailInfo_Preview: PreviewProvider {
    static var previews: some View {
        NewDetailInfo(title: "qsdew sdeswed", source: "al-jazeera",
                      author: "Almen al-Kharaab",
                      date: "01.04.2022",
                      info: "sdlcjvknsldjk sljkfvnsojkws sofkveorw eogreorgve oeirbveor eorgieorgeof eortbijroti")
    }
}
