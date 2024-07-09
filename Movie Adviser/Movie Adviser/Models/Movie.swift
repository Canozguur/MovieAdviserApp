import Foundation
import Swift

struct Movie: Codable, Identifiable, Hashable {
    var id: Int // JSON'daki id alanı
    var title: String
    var genre: String
    var releaseYear: String // JSON'daki releaseYear alanı
    var director: String
    var description: String
    var photoURL: String

    var categories: [String] {
        genre.components(separatedBy: ", ").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
    }
    static let allMovie: [Movie] = Bundle.main.decode(file: "movies.json")
    static let sampleMovie: Movie = allMovie[0]
}

extension Bundle {
    func decode <T: Decodable> (file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project")
        }
    
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project")
        }
        return loadedData
    }
}



