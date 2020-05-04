import Foundation

class NetworkingController: ObservableObject {
    @Published var films = [Film(title: "", episodeId: 0, openingCrawl: "", director: "", producer: "", releaseDate: "", characters: [""], planets: [""], starships: [""], vehicles: [""], species: [""], created: "", edited: "", url: "")]
    
    let urlString = "https://swapi.dev/api/films/"
    
    init() {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(Result.self, from: data)
                
                DispatchQueue.main.async {
                    self.films = result.results
                }
            } catch {
                print("No films... \n\(error)\n")
            }
        }.resume()
    }
}
