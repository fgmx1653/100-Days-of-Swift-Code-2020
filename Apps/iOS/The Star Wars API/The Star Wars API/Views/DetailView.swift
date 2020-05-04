import SwiftUI

struct DetailView: View {
    let film: Film
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                HStack {
                    Text("Star Wars: \(film.title)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text(film.director)
                        .padding()
                    Text(film.releaseDate.dropLast(6))
                    Spacer()
                }
            }
            .padding()
            
            Text(film.openingCrawl)
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(film: Film(title: "Star Wars: The Empire Strikes Back", episodeId: 0, openingCrawl: "It is a dark time...", director: "", producer: "Irvin Kershner", releaseDate: "1980", characters: [""], planets: [""], starships: [""], vehicles: [""], species: [""], created: "", edited: "", url: ""))
    }
}
