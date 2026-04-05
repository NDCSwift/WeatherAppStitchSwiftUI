# 🌤️ Weather App — Built with Stitch + SwiftUI

A SwiftUI weather app UI featuring hourly and 5-day forecasts, glassmorphic material cards, and a gradient hero temperature display — designed with the Stitch AI tool and translated into clean MVVM SwiftUI code.

---

## 🤔 What this is

This project shows the workflow of going from an AI-generated design in Stitch directly to production-quality SwiftUI. The weather UI includes a scrollable home screen with a hero temperature section, horizontal hourly forecast scroll, and a 5-day forecast card with temperature range bars — all backed by a mock `WeatherHomeViewModel`.

## ✅ Why you'd use it

- **Stitch-to-SwiftUI workflow demo** — see how an AI-generated design translates into real, structured SwiftUI code
- **Material backgrounds & glassmorphism** — uses `.regularMaterial` and `RoundedRectangle` for the modern iOS weather look
- **Clean MVVM pattern** — clear separation between `WeatherHomeView` and `WeatherHomeViewModel`
- **Reusable forecast components** — `HourlyForecastItemView` and `DailyForecastRowView` are self-contained and easy to adapt
- **No API keys needed** — runs entirely on mock data, great for UI prototyping

## 📺 Watch on YouTube

[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/1b9jUKmhp2Q)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding97). Subscribe for weekly SwiftUI tutorials.

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/WeatherAppStitchSwiftUI.git
cd WeatherAppStitchSwiftUI
```
Or select "Clone Git Repository…" when Xcode launches.

### 2. Open in Xcode
- Double-click `WeatherAppStitchSwiftUI.xcodeproj`.

### 3. Set Your Development Team

In Xcode, navigate to: **TARGET → Signing & Capabilities → Team**
- Select your personal or organizational team.

### 4. Update the Bundle Identifier
- Change `com.example.MyApp` to a unique identifier.

### 5. Run
Select a simulator or connected device and hit **Run**.

---

## 🛠️ Notes

- All weather data is mocked — no WeatherKit or API key required
- Swap out `WeatherHomeViewModel` to connect a real weather API
- If you see a code signing error, check that Team and Bundle ID are set

## 📦 Requirements

- Xcode 15+
- iOS 17+

📺 [Watch the guide on YouTube](https://youtu.be/1b9jUKmhp2Q)
