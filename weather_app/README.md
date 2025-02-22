# Weather App

A simple weather forecasting app built using **Flutter** and the **OpenWeatherMap API**. This app provides real-time weather updates, hourly forecasts, and additional weather details such as humidity, wind speed, and pressure.

## Features

- Fetches real-time weather data for a specified location (currently set to *Gwalior, India*).
- Displays **current temperature, sky conditions, and weather icons**.
- Provides an **hourly forecast** for the next few hours.
- Shows **additional weather information** including humidity, wind speed, and atmospheric pressure.
- Implements a **refresh button** to manually fetch the latest weather data.

## Installation

1. Clone this repository:
   ```sh
   git clone https://github.com/your-username/weather-app.git
   cd weather-app
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Run the app:
   ```sh
   flutter run
   ```

## Dependencies

This app uses the following dependencies:
- `http` for making API requests.
- `flutter/material.dart` for UI components.
- `dart:convert` for JSON parsing.

Ensure you have Flutter installed before running the project. You can install Flutter by following the official guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)

## API Usage

The app fetches weather data from **OpenWeatherMap API**. To change the location, modify the URL in the `fetchWeatherData` function in `WeatherAppState`:

```dart
var url = Uri.parse(
    'https://api.openweathermap.org/data/2.5/forecast?q=YOUR_CITY,COUNTRY_CODE&APPID=YOUR_API_KEY');
```

Replace `YOUR_CITY`, `COUNTRY_CODE`, and `YOUR_API_KEY` with valid values.

## Folder Structure

```
/weather-app
│── lib
│   ├── main.dart
│   ├── weather_app.dart (Main App UI)
│   ├── additional_item_info.dart (Widget for additional weather details)
│   ├── hourly_forecast_item.dart (Widget for hourly forecast items)
│── pubspec.yaml
│── README.md
```

## Contributing

If you would like to contribute, feel free to fork the repository and submit a pull request with improvements.

## License

This project is licensed under the MIT License.

---

**Author:** Abhishek Jha 
**GitHub:** [abhishekjh462000](https://github.com/abhishekjh462000)  
**Email:** abhishekjha462000@gmail.com

Happy coding! 🚀

