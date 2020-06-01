import SwiftUI

struct WhatsNewView: View {
    @Binding var isWhatsNewsShowing: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Text("What's New\nin Messages")
                .font(.largeTitle)
                .bold()
            
            ForEach(0 ..< 3) { _ in
                WhatsNewTextView()
            }
            
            Spacer()
            
            Button(action: {
                self.isWhatsNewsShowing.toggle()
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 64)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
            Spacer()
        }
    }
}

struct WhatsNewView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsNewView(isWhatsNewsShowing: Binding.constant(true))
    }
}

struct WhatsNewTextView: View {
    var body: some View {
        HStack {
            Image(systemName: "bubble.left.and.bubble.right")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text("Share your nam and photo")
                    .bold()
                
                Text("Get creatvie and send messages with your name and photo, or a Memoji.")
                    .foregroundColor(.secondary)
            }
            .frame(width: 240)
            .padding()
        }
    }
}
