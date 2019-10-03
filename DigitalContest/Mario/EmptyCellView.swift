import SwiftUI

struct EmptyCellView: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 8, height: 100)
                .padding(.leading, 20)
                .foregroundColor(.green)
            Spacer()
        }
    }
}
