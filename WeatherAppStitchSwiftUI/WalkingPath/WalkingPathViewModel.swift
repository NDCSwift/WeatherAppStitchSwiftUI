import Observation

@Observable
final class WalkingPathViewModel {
    var trail = TrailPath(
        name: "Oak Ridge Trail",
        location: "Golden Gate Park, San Francisco",
        surface: "Paved",
        leashPolicy: "On-Leash Only",
        rating: 4.8,
        reviewCount: 124,
        distanceMiles: 2.4,
        elevationFeet: 120,
        ratingBreakdown: [
            RatingBar(stars: 5, fraction: 0.80),
            RatingBar(stars: 4, fraction: 0.12),
            RatingBar(stars: 3, fraction: 0.05)
        ],
        notes: [
            CommunityNote(
                authorName: "Sarah & Bella",
                timeAgo: "2 hours ago",
                condition: .clear,
                noteText: "Path is mostly dry. Saw two off-leash dogs near the creek, but owners were quick to leash them when we approached.",
                avatarURL: "https://www.figma.com/api/mcp/asset/45f144b3-3efb-4cb3-9c9e-3d4a0683363c"
            ),
            CommunityNote(
                authorName: "Mark & Cooper",
                timeAgo: "Yesterday",
                condition: .muddy,
                noteText: "The wooded section is quite muddy after last night's rain. Bring towels for the paws!",
                avatarURL: "https://www.figma.com/api/mcp/asset/809dee42-6aaa-46a2-b66a-ed7cd9177eeb"
            )
        ],
        heroImageURL: "https://www.figma.com/api/mcp/asset/5dde2b35-8217-4b1a-b2df-a0f95e330db7"
    )
}
