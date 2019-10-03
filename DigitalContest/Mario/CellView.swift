import SwiftUI

struct CellView: View {
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private let cellWidth: CGFloat = 300
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 8, height: 100)
            Rectangle()
                .frame(width: self.screenWidth - self.cellWidth - 40, height: 8)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: self.cellWidth, height: 100)
        }
        .padding([.leading, .trailing], 20)
        .foregroundColor(.green)
    }
}
