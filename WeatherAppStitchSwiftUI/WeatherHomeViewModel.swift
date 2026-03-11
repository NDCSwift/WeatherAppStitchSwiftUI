import SwiftUI

struct HourlyForecast: Identifiable {
    let id = UUID()
    let time: String
    let icon: String
    let iconColor: Color
    let temp: Int
}

struct DailyForecast: Identifiable {
    let id = UUID()
    let day: String
    let icon: String
    let iconColor: Color
    let barColor: Color
    let lowTemp: Int
    let highTemp: Int
    let barOffset: CGFloat
    let barWidth: CGFloat
}

@Observable
class WeatherHomeViewModel {
    var city = "Cupertino"
    var condition = "Mostly Clear"
    var currentTemp = 72
    var highTemp = 78
    var lowTemp = 54

    var hourlyForecasts: [HourlyForecast] = [
        HourlyForecast(time: "Now",  icon: "sun.max.fill",    iconColor: .yellow, temp: 72),
        HourlyForecast(time: "1PM",  icon: "sun.max.fill",    iconColor: .yellow, temp: 74),
        HourlyForecast(time: "2PM",  icon: "cloud.sun.fill",  iconColor: .gray,   temp: 76),
        HourlyForecast(time: "3PM",  icon: "cloud.sun.fill",  iconColor: .gray,   temp: 77),
        HourlyForecast(time: "4PM",  icon: "sun.max.fill",    iconColor: .yellow, temp: 78),
        HourlyForecast(time: "5PM",  icon: "sunset.fill",     iconColor: .orange, temp: 75),
    ]

    var dailyForecasts: [DailyForecast] = [
        DailyForecast(day: "Today", icon: "sun.max.fill",   iconColor: .yellow, barColor: .yellow, lowTemp: 54, highTemp: 78, barOffset: 0.50, barWidth: 0.50),
        DailyForecast(day: "Tue",   icon: "cloud.sun.fill", iconColor: .gray,   barColor: .yellow, lowTemp: 56, highTemp: 80, barOffset: 0.17, barWidth: 0.75),
        DailyForecast(day: "Wed",   icon: "cloud.rain.fill",iconColor: .blue,   barColor: .blue,   lowTemp: 52, highTemp: 68, barOffset: 0.08, barWidth: 0.50),
        DailyForecast(day: "Thu",   icon: "cloud.fill",     iconColor: .gray,   barColor: Color(.systemGray3), lowTemp: 50, highTemp: 62, barOffset: 0.00, barWidth: 1.00),
        DailyForecast(day: "Fri",   icon: "sun.max.fill",   iconColor: .yellow, barColor: .yellow, lowTemp: 58, highTemp: 82, barOffset: 0.33, barWidth: 0.67),
    ]
}
