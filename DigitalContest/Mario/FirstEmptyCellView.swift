import SwiftUI

struct FirstEmptyCellView: View {
    var body: some View {
        VStack {
            Spacer(minLength: 50)
            HStack {
                RoundedAtTopRectangle(cornerRadius: 4, style: .continuous)
                    .frame(width: 8, height: 50)
                    .padding(.leading, 20)
                    .foregroundColor(.green)
                Spacer()
            }
        }
    }
}

struct RoundedAtTopRectangle: Shape {
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}
