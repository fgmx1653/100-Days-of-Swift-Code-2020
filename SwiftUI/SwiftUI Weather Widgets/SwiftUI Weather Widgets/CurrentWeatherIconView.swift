import SwiftUI

struct CurrentWeatherIconView: View {
    var body: some View {
        ZStack (alignment: .top) {
            Image(systemName: "cloud.rain.fill")
                .font(.system(size: 72))
                .foregroundColor(.blue)
            
            Image(systemName: "cloud.fill")
                .font(.system(size: 72))
                .foregroundColor(.white)
                .offset(y: -18)
        }
        .frame(height: 72)
    }
}

struct CurrentWeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherIconView()
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)))
    }
}
