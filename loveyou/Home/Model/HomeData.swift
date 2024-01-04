import Foundation

// MARK: - HomeData
public struct HomeData: Codable {
    let location: String
    let cards: [String]
    let banners: [Banner]
    let events: [Event]
}

// MARK: - Banner
public struct Banner: Codable {
    let title, imageURL: String

    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "imageUrl"
    }
}

// MARK: - Event
public struct Event: Codable {
    let title, imageURL, location, calendar: String
    let price: Float
    let tags: [String]

    enum CodingKeys: String, CodingKey {
        case title
        case imageURL = "imageUrl"
        case location
        case calendar = "Calendar"
        case price, tags
    }
}
