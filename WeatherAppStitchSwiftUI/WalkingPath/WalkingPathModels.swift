import SwiftUI

struct TrailPath: Identifiable {
    let id = UUID()
    var name: String
    var location: String
    var surface: String
    var leashPolicy: String
    var rating: Double
    var reviewCount: Int
    var distanceMiles: Double
    var elevationFeet: Int
    var ratingBreakdown: [RatingBar]
    var notes: [CommunityNote]
    var heroImageURL: String
}

struct RatingBar: Identifiable {
    let id = UUID()
    var stars: Int
    var fraction: Double
}

struct CommunityNote: Identifiable {
    let id = UUID()
    var authorName: String
    var timeAgo: String
    var condition: TrailCondition
    var noteText: String
    var avatarURL: String
}

enum TrailCondition {
    case clear, muddy, wet, icy

    var label: String {
        switch self {
        case .clear: "Clear"
        case .muddy: "Muddy"
        case .wet: "Wet"
        case .icy: "Icy"
        }
    }

    var systemImage: String {
        switch self {
        case .clear: "checkmark.circle.fill"
        case .muddy: "exclamationmark.triangle.fill"
        case .wet: "drop.fill"
        case .icy: "snowflake"
        }
    }

    var foregroundColor: Color {
        switch self {
        case .clear: Color(red: 0.086, green: 0.639, blue: 0.290)
        case .muddy: Color(red: 0.851, green: 0.467, blue: 0.024)
        case .wet: .blue
        case .icy: .cyan
        }
    }

    var backgroundColor: Color {
        switch self {
        case .clear: Color(red: 0.941, green: 0.992, blue: 0.957)
        case .muddy: Color(red: 1.0, green: 0.984, blue: 0.922)
        case .wet: .blue.opacity(0.1)
        case .icy: .cyan.opacity(0.1)
        }
    }
}
