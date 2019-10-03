import SwiftUI

struct CellView: View {
    
    public let damage: MarioModelView.PipeDamage
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private let cellWidth: CGFloat = 300
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .frame(width: 8, height: 100)
                .foregroundColor(.green)
            
            Rectangle()
                .fill(LinearGradient(
                    gradient: .init(colors: [Color.green, .red]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .frame(width: self.screenWidth - self.cellWidth - 40, height: 8)
            //.foregroundColor(Gradient(colors: [.green, .red]))
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.red)
                
                HStack {
                    Text(self.damage.name)
                        .font(.system(size: 27))
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(self.damage.location + "М")
                        .font(.largeTitle)
                }
                .padding()
                
            }.frame(width: self.cellWidth, height: 100)
        }
        .padding([.leading, .trailing], 20)
    }
}
