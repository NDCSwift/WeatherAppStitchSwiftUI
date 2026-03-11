import SwiftUI

struct WeatherHomeView: View {
    @State private var viewModel = WeatherHomeViewModel()

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 224/255, green: 231/255, blue: 255/255),
                    Color.white
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {
                    headerSection
                    heroTemperatureSection
                    hourlyForecastCard
                        .padding(.bottom, 12)
                    dailyForecastCard
                        .padding(.bottom, 12)
                    footerSection
                }
                .padding(.horizontal, 20)
            }
        }
    }

    // MARK: - Header

    private var headerSection: some View {
        VStack(spacing: 4) {
            Text(viewModel.city)
                .font(.title.weight(.semibold))
                .tracking(-0.5)
            Text(viewModel.condition)
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 60)
        .padding(.bottom, 32)
    }

    // MARK: - Hero Temperature

    private var heroTemperatureSection: some View {
        VStack(spacing: 8) {
            Text("\(viewModel.currentTemp)°")
                .font(.system(size: 96, weight: .ultraLight))
                .kerning(-4)

            HStack(spacing: 16) {
                Text("H: \(viewModel.highTemp)°")
                    .font(.body.weight(.medium))
                Text("L: \(viewModel.lowTemp)°")
                    .font(.body.weight(.medium))
            }
        }
        .padding(.bottom, 48)
    }

    // MARK: - Hourly Forecast Card

    private var hourlyForecastCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("HOURLY FORECAST")
                .font(.caption.weight(.bold))
                .foregroundStyle(.secondary)
                .padding(.horizontal, 4)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    ForEach(viewModel.hourlyForecasts) { item in
                        HourlyForecastItemView(forecast: item)
                    }
                }
                .padding(.bottom, 4)
            }
        }
        .padding(20)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
    }

    // MARK: - Daily Forecast Card

    private var dailyForecastCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("5-DAY FORECAST")
                .font(.caption.weight(.bold))
                .foregroundStyle(.secondary)
                .padding(.horizontal, 4)
                .padding(.bottom, 8)

            VStack(spacing: 0) {
                ForEach(Array(viewModel.dailyForecasts.enumerated()), id: \.element.id) { index, forecast in
                    DailyForecastRowView(forecast: forecast)

                    if index < viewModel.dailyForecasts.count - 1 {
                        Divider()
                    }
                }
            }
        }
        .padding(20)
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
    }

    // MARK: - Footer

    private var footerSection: some View {
        Text("WEATHER FOR \(viewModel.city.uppercased())")
            .font(.system(size: 10, weight: .bold))
            .tracking(2)
            .foregroundStyle(.secondary.opacity(0.5))
            .padding(.vertical, 24)
    }
}

// MARK: - Hourly Item

struct HourlyForecastItemView: View {
    let forecast: HourlyForecast

    var body: some View {
        VStack(spacing: 12) {
            Text(forecast.time)
                .font(.footnote.weight(forecast.time == "Now" ? .semibold : .medium))
                .foregroundStyle(forecast.time == "Now" ? .primary : .secondary)

            Image(systemName: forecast.icon)
                .font(.title2)
                .foregroundStyle(forecast.iconColor)

            Text("\(forecast.temp)°")
                .font(.body.weight(.medium))
        }
        .frame(minWidth: 48)
    }
}

// MARK: - Daily Row

struct DailyForecastRowView: View {
    let forecast: DailyForecast

    var body: some View {
        HStack {
            Text(forecast.day)
                .font(.body.weight(.semibold))
                .frame(width: 80, alignment: .leading)
                .foregroundStyle(forecast.day == "Today" ? .primary : .secondary)

            Image(systemName: forecast.icon)
                .font(.title2)
                .foregroundStyle(forecast.iconColor)

            Spacer()

            HStack(spacing: 8) {
                Text("\(forecast.lowTemp)°")
                    .font(.body.weight(.medium))
                    .foregroundStyle(.secondary)
                    .frame(width: 32, alignment: .trailing)

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color(.systemGray5))

                        Capsule()
                            .fill(forecast.barColor)
                            .frame(width: geo.size.width * forecast.barWidth)
                            .offset(x: geo.size.width * forecast.barOffset)
                    }
                }
                .frame(width: 48, height: 4)

                Text("\(forecast.highTemp)°")
                    .font(.body.weight(.semibold))
                    .frame(width: 32, alignment: .leading)
            }
        }
        .padding(.vertical, 16)
    }
}

#Preview {
    WeatherHomeView()
}
