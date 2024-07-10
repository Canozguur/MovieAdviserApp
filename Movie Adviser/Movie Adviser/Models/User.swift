import Foundation
import Swift

struct User: Identifiable, Hashable {
    var id: Int
    var isDarkMode : Bool
    var isUseWifi : Bool
    var isNotification : Bool
    
    var movieLikeList : [Movie]
    var movieDislikeList : [Movie]
    var movieDowlondadList : [Movie]
    var movieSavedList : [Movie]
    
    
    static let sampleUser = User(id: 10, isDarkMode: true, isUseWifi: false, isNotification: true, movieLikeList: [Movie.sampleMovie], movieDislikeList: [Movie.sampleMovie], movieDowlondadList: [Movie.sampleMovie], movieSavedList: [Movie.sampleMovie])
}
