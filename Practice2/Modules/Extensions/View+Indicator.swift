import Foundation
import SwiftUI

extension View {
    func showActivityIdicator(_ value: Bool,
                              onTop: Bool) -> some View {
        ModifiedContent(content: self,
                        modifier: LoadingIndicatorModifier(isLoading: value,
                                                           onTop: onTop))
    }
}
