import SwiftUI

struct MarioView: View {
    
    let pipe: MarioModelView
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 0) {
                    FirstEmptyCellView()
                    ForEach(self.pipe.damages) { damage in
                        CellView(damage: damage)
                        EmptyCellView()
                    }
                    LastEmptyCellView()
                }
                .navigationBarTitle(Text("Длина: " + self.pipe.length))
                .navigationBarItems(leading: Text(self.pipe.name))
            }
        }
    }
}
