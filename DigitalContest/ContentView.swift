import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                MainView(mainViewType: .mario)
                    .navigationBarTitle(Text("Main"))
                
            }
            .tabItem {
                Image(systemName: "bubble.middle.top")
                Text("MainView")
            }
            .tag(0)
            
            ProfileView()
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
