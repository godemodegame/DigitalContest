import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("profileBackground")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width + 10, height: 300)
                    .offset(y: -10)
                    .edgesIgnoringSafeArea(.top)
                    .aspectRatio(contentMode: ContentMode.fit)
                    .blur(radius: 3)
                
                Image("first")
                    .resizable()
                    .background(Color.white)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .offset(y: 75)
            }
            
            HStack {
                Text("Иван Петров")
                    .font(.title)
                    .padding()
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
