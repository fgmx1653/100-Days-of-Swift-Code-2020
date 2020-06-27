import SwiftUI

struct WhatsNewView: View {
    @Binding var isWhatsNewsShowing: Bool
    
    let info = [
        WhatsNew(image: "swift", header: "Share your Swift code", text: "Get creatvie and send messages with your name and photo, or a Memoji."),
        WhatsNew(image: "lasso.sparkles", header: "Share stuff", text: "Get creatvie and send messages with your name and photo, or a Memoji."),
        WhatsNew(image: "bubble.left.and.bubble.right", header: "Share your name and photo", text: "Get creatvie and send messages with your name and photo, or a Memoji.")
    ]
    
    var body: some View {
        VStack {
            Spacer()
            Text("What's New\nin Messages")
                .font(.largeTitle)
                .bold()
            
            ForEach(info, id: \.self) { info in
                WhatsNewTextView(image: info.image, header: info.header, text: info.text)
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

//MARK: - New .swift file.
struct WhatsNewTextView: View {
    let image: String
    let header: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(header)
                    .bold()
                
                Text(text)
                    .foregroundColor(.secondary)
            }
            .frame(width: 240)
            .padding()
        }
    }
}

struct WhatsNew: Hashable {
    let image: String
    let header: String
    let text: String
}
