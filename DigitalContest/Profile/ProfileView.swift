import SwiftUI

struct ProfileView: View {
    @Binding var showMario: Bool
    
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
            
//            Toggle(isOn: self.$showMario) {
//                Text(#"Режим "Марио""#)
//            }
//            .padding()
            
            Spacer()
            
            Text("Выход")
                .foregroundColor(.red)
                .font(.title)
        }
    }
}
