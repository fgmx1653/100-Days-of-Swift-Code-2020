import SwiftUI

struct CardView: View {
    var body: some View {
        NavigationLink(destination: Text("Coming soon")) {
            HStack(alignment: .top) {
                Image(systemName: "house")
                    .font(Font.title.weight(.bold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                
                Text("Home")
                    .bold()
                
                Spacer()
                Text("0")
                    .font(.largeTitle)
                    .bold()
            }
        }
        .frame(width: UIScreen.main.bounds.width - 120)
        .padding()
        .background(Color(.secondarySystemFill))
        .cornerRadius(8)
        .padding([.bottom, .horizontal])
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
