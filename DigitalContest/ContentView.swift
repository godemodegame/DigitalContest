import SwiftUI

struct ContentView: View {
    @State var isMario: Bool = false
    
    var body: some View {
        TabView {
            NavigationView {
                MainView(mainViewType: self.isMario ? .mario : .list)
                    .navigationBarTitle(Text("История"))
                
            }
            .tabItem {
                Image(systemName: "bubble.middle.top")
                Text("MainView")
            }
            .tag(0)
            
            ProfileView(showMario: self.$isMario)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Профиль")
            }
            .tag(1)
            
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.green)
    }
}
