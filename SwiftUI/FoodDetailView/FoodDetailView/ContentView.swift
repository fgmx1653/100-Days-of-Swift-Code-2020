import SwiftUI

struct ContentView: View {
    var body: some View {
        DetailView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailView: View {
    var body: some View {
        ZStack {
            Color(.orange)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                ProductView()
                
                Spacer()
                CardView()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

//MARK: - New .swift file.
struct ProductView: View {
    var body: some View {
        TabView {
            ForEach(0 ..< 5) { _ in
                Image(uiImage: #imageLiteral(resourceName: "orange"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width)
        .tabViewStyle(PageTabViewStyle())
    }
}

//MARK: - New .swift file.
struct CardView: View {
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Orange")
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("\(quantity) each")
                    .foregroundColor(.secondary)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Stepper("\(quantity)") {
                    quantity += 1
                } onDecrement: {
                    quantity -= 1
                }
                .frame(width: 120)
                
                Spacer()
                Text("$\(quantity).00")
                    .font(.largeTitle)
                    .bold()
            }
            .padding(.vertical)
            
            Text("Product Description")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget gravida cum sociis natoque penatibus. Tincidunt arcu non sodales neque sodales ut.")
                .fixedSize(horizontal: false, vertical: true)
                .padding(.vertical)
            
            HStack {
                Image(systemName: "heart")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.trailing)
                
                Button(action: {}, label: {
                    Spacer()
                    
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .bold()
                    
                    Spacer()
                })
                .padding()
                .background(Color(.orange))
                .cornerRadius(30)
            }
            .padding(.bottom)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(30)
    }
}
