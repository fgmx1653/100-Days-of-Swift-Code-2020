import SwiftUI

struct AppIconView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), Color.blue]), startPoint: .top, endPoint: .bottom)
            
            Circle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
                .offset(x: -30, y: -30)
            
            Image(systemName: "cloud.fill")
                .font(.system(size: 140))
                .foregroundColor(.white)
                .opacity(0.8)
                .offset(x: 12)
        }
        .frame(width: 200, height: 200)
        .cornerRadius(30)
    }
}

struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
