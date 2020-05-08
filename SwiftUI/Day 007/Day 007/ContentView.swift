import SwiftUI

struct ContentView: View {
    @State private var isOpen = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(0 ..< 55) { item in
                    Text("Hello, World!")
                }
                .navigationBarTitle("Some App")
                .navigationBarItems(leading: NavButtonView(isOpen: $isOpen))
                
            }
            .offset(x: isOpen ? 300 : 0)
            
            if isOpen {
                Rectangle()
                    .edgesIgnoringSafeArea(.vertical)
                    .opacity(0.6)
                    .onTapGesture {
                        self.isOpen.toggle()
                }
                
                HStack {
                    List(0 ..< 4) { item in
                        Text("Hello, World!")
                    }
                    .frame(width: 300)
                    .padding(.top, 44)
                    Spacer()
                }
                .edgesIgnoringSafeArea(.top)
            } else {
                EmptyView()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - New .swift file.
struct NavButtonView: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        Button(action: {
            self.isOpen.toggle()
        }, label: {
            Image(systemName: "list.dash")
                .foregroundColor(Color(.label))
        })
    }
}
