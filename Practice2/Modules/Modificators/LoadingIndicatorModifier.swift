import SwiftUI

struct LoadingIndicatorModifier: ViewModifier {

    private(set) var isLoading: Bool

    func body(content: Content) -> some View {
        if isLoading {
            withLoading(content: content)
        } else {
            withoutLoading(content: content)
        }
    }

    func withoutLoading(content: Content) -> some View {
        content
    }

    func withLoading(content: Content) -> some View {        
        return VStack {
            content
            Divider()
            HStack {
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                Spacer()
            }
        }
    }
}
