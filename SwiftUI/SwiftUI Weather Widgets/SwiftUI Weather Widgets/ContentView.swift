import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                AppIconView()
                    .scaleEffect(0.2)
                    .frame(width: 42, height: 32)
                Text("WEATHER")
                    .font(.system(size: 24))
                    .foregroundColor(.white)
                    .padding(.trailing, 50)
                    .padding(.bottom)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 18))
                    .foregroundColor(.white)
            }
            
            HStack(alignment: .top) {
                CurrentWeatherIconView()
                    .padding()
                
                
                VStack(alignment: .leading) {
                    Text("Boise")
                    Text("Showers")
                    Text("Chance of Rain: 50%")
                }
                .foregroundColor(.white)
                
                Spacer()
                
                VStack {
                    Text("61º")
                        .font(.system(size: 48))
                        .foregroundColor(.white)
                    
                    Text("81º / 54º")
                        .foregroundColor(.white)
                }
            }
        }
        .padding()
        .background(Color.black.opacity(0.5))
        .cornerRadius(12)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
