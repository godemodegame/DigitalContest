import SwiftUI

struct MarioView: View {
    
    let pipe: PipeViewModel.Pipe
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
                EmptyCellView()
                CellView()
                EmptyCellView()
                CellView()
                EmptyCellView()
                CellView()
                EmptyCellView()
                CellView()
                EmptyCellView()
            }
            .navigationBarTitle(Text("MainView"))
        } 
    }
}
