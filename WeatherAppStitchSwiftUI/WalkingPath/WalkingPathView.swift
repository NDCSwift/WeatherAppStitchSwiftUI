import SwiftUI

// MARK: - Color Palette

extension Color {
    fileprivate static let trailBlue    = Color(red: 0.098, green: 0.498, blue: 0.902)   // #197fe6
    fileprivate static let trailInk     = Color(red: 0.059, green: 0.090, blue: 0.165)   // #0f172a
    fileprivate static let trailSlate   = Color(red: 0.278, green: 0.333, blue: 0.412)   // #475569
    fileprivate static let trailMuted   = Color(red: 0.392, green: 0.455, blue: 0.545)   // #64748b
    fileprivate static let trailGray    = Color(red: 0.580, green: 0.639, blue: 0.722)   // #94a3b8
    fileprivate static let trailBorder  = Color(red: 0.945, green: 0.961, blue: 0.976)   // #f1f5f9
    fileprivate static let trailSurface = Color(red: 0.973, green: 0.980, blue: 0.988)   // #f8fafc
    fileprivate static let trailBar     = Color(red: 0.886, green: 0.910, blue: 0.941)   // #e2e8f0
}

// MARK: - Main View

struct WalkingPathView: View {
    @State private var viewModel = WalkingPathViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    heroSection
                    keyInfoSection
                    ratingBreakdownSection
                    communityNotesSection
                    rateButton
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                        .padding(.bottom, 40)
                }
            }
            .background(Color(UIColor.systemBackground))
            .navigationTitle("Path Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // share action
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .foregroundStyle(Color.trailInk)
                    }
                }
            }
        }
    }

    // MARK: - Hero

    private var heroSection: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: viewModel.trail.heroImageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.15, green: 0.35, blue: 0.15),
                                Color(red: 0.08, green: 0.20, blue: 0.08)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            .frame(height: 280)
            .clipped()

            LinearGradient(
                colors: [.clear, .black.opacity(0.6)],
                startPoint: .top,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    TrailBadge(text: viewModel.trail.surface, style: .glass)
                    TrailBadge(text: viewModel.trail.leashPolicy, style: .blue)
                }
                Text(viewModel.trail.name)
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundStyle(.white)
                Text(viewModel.trail.location)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white.opacity(0.9))
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .frame(height: 280)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }

    // MARK: - Key Info

    private var keyInfoSection: some View {
        HStack(alignment: .center) {
            HStack(spacing: 8) {
                Text(String(format: "%.1f", viewModel.trail.rating))
                    .font(.system(size: 36, weight: .black))
                    .foregroundStyle(Color.trailInk)

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 2) {
                        ForEach(0 ..< 5, id: \.self) { i in
                            Image(systemName: i < Int(viewModel.trail.rating) ? "star.fill" : "star")
                                .font(.system(size: 10))
                                .foregroundStyle(Color.trailBlue)
                        }
                    }
                    Text("\(viewModel.trail.reviewCount) reviews")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(Color.trailMuted)
                }
            }

            Spacer()

            HStack(spacing: 16) {
                TrailStatView(systemImage: "ruler", value: String(format: "%.1f mi", viewModel.trail.distanceMiles))
                TrailStatView(systemImage: "mountain.2", value: "\(viewModel.trail.elevationFeet) ft")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 24)
        .overlay(alignment: .bottom) {
            Divider().padding(.horizontal, 16)
        }
    }

    // MARK: - Rating Breakdown

    private var ratingBreakdownSection: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.trail.ratingBreakdown) { bar in
                HStack(spacing: 12) {
                    Text("\(bar.stars)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(Color.trailGray)
                        .frame(width: 16, alignment: .leading)

                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Capsule().fill(Color.trailBar)
                            Capsule()
                                .fill(Color.trailBlue)
                                .frame(width: geo.size.width * bar.fraction)
                        }
                    }
                    .frame(height: 6)
                }
            }
        }
        .padding(16)
        .background(Color.trailSurface)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
    }

    // MARK: - Community Notes

    private var communityNotesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: "person.2.fill")
                        .foregroundStyle(Color.trailBlue)
                    Text("Community Notes")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color.trailInk)
                }
                Spacer()
                Button("View All") {}
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.trailBlue)
            }

            ForEach(viewModel.trail.notes) { note in
                CommunityNoteCard(note: note)
            }
        }
        .padding(.horizontal, 16)
    }

    // MARK: - Rate Button

    private var rateButton: some View {
        Button {
            // rate action
        } label: {
            HStack(spacing: 8) {
                Image(systemName: "map.fill")
                    .font(.system(size: 16))
                Text("Rate This Path")
                    .font(.system(size: 16, weight: .bold))
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.trailBlue)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

// MARK: - Trail Badge

private enum TrailBadgeStyle { case glass, blue }

private struct TrailBadge: View {
    let text: String
    let style: TrailBadgeStyle

    var body: some View {
        Text(text.uppercased())
            .font(.system(size: 12, weight: .semibold))
            .tracking(0.6)
            .foregroundStyle(.white)
            .padding(.horizontal, 13)
            .padding(.vertical, 5)
            .background {
                if style == .glass {
                    Capsule()
                        .fill(.ultraThinMaterial)
                        .overlay(Capsule().stroke(Color.white.opacity(0.3), lineWidth: 1))
                } else {
                    Capsule()
                        .fill(Color.trailBlue)
                }
            }
    }
}

// MARK: - Trail Stat

private struct TrailStatView: View {
    let systemImage: String
    let value: String

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(Color.trailBlue.opacity(0.1))
                    .frame(width: 40, height: 40)
                Image(systemName: systemImage)
                    .font(.system(size: 14))
                    .foregroundStyle(Color.trailBlue)
            }
            Text(value.uppercased())
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(Color.trailMuted)
        }
    }
}

// MARK: - Community Note Card

private struct CommunityNoteCard: View {
    let note: CommunityNote

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 12) {
                AsyncImage(url: URL(string: note.avatarURL)) { image in
                    image.resizable().scaledToFill()
                } placeholder: {
                    Circle()
                        .fill(Color.trailBar)
                        .overlay(
                            Text(String(note.authorName.prefix(1)))
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(Color.trailMuted)
                        )
                }
                .frame(width: 32, height: 32)
                .clipShape(Circle())

                VStack(alignment: .leading, spacing: 2) {
                    Text(note.authorName)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(Color.trailInk)
                    Text(note.timeAgo.uppercased())
                        .font(.system(size: 10))
                        .foregroundStyle(Color.trailMuted)
                }

                Spacer()

                ConditionBadge(condition: note.condition)
            }

            Text(note.noteText)
                .font(.system(size: 14))
                .foregroundStyle(Color.trailSlate)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(17)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.trailBorder, lineWidth: 1)
        )
        .shadow(color: .black.opacity(0.05), radius: 1, y: 1)
    }
}

// MARK: - Condition Badge

private struct ConditionBadge: View {
    let condition: TrailCondition

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: condition.systemImage)
                .font(.system(size: 10))
                .foregroundStyle(condition.foregroundColor)
            Text(condition.label.uppercased())
                .font(.system(size: 10, weight: .bold))
                .foregroundStyle(condition.foregroundColor)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 3)
        .background(condition.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

// MARK: - Preview

#Preview {
    WalkingPathView()
}
