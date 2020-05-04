import SwiftUI

struct ContentView: View {
    @ObservedObject var networkingController = NetworkingController()
    
    var body: some View {
        NavigationView {
            List(networkingController.films, id: \.self) { film in
                NavigationLink(destination: DetailView(film: film)) {
                    Text("Star Wars: \(film.title)")
                }
            }
            .navigationBarTitle("The Star Wars API")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
