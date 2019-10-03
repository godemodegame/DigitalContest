import SwiftUI

struct LastEmptyCellView: View {
    var body: some View {
        HStack {
            RoundedAtBottomRectangle(cornerRadius: 4, style: .continuous)
                .frame(width: 8, height: 25)
                .padding(.leading, 20)
                .foregroundColor(.green)
            Spacer()
        }
    }
}

struct RoundedAtBottomRectangle: Shape {
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}
