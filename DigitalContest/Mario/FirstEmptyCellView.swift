import SwiftUI

struct FirstEmptyCellView: View {
    var body: some View {
        HStack {
            Rectangle()
            .cornerRadius(4, antialiased: true)
                .frame(width: 8, height: 100)
                .padding(.leading, 20)
                .foregroundColor(.green)
            Spacer()
        }
    }
}
