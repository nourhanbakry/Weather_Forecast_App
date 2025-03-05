# 🌦️ Weather Forecast App
This is a **Flutter** application that provides a **3-day weather forecast**. The app uses **geolocation** to access the user's location, stores the latitude and longitude in **SharedPreferences**, and sends them to a **weather API** to fetch the forecast. The app integrates with **Firebase** for authentication and uses a **local AI model** to predict whether it's a good day to go out based on weather parameters.

## 🚀 Features
- **📍 Geolocation**: Automatically detects the user's location using the `Geolocator` package.
- **🌤️ Weather API**: Fetches a 3-day weather forecast using the stored latitude and longitude.
- **🔥 Firebase Authentication**: Users can sign up and log in using email and password.
- **🤖 AI Prediction**: Integrates a local AI model that predicts whether it's a good day to go out based on weather parameters (**hot, rainy, mild, sunny, normal**).
- **📱 Responsive UI**: Built with a **clean architecture** and responsive design to work on all devices.
- **🔄 State Management**: Uses **Cubit** for state management.
- **💻 Local Hosting**: The AI model is hosted locally, and instructions are provided for setting it up.

## 🛠️ Installation

### Flutter App
1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/weather-forecast-app.git
2. Navigate to the project directory:
   ```bash
   cd weather-forecast-app
3. Install dependencies:
   ```bash
   flutter pub get
4. flutter run
   ```bash
   flutter run

### Local AI Model Hosting
1. Navigate to the AI model directory:
   ```bash
   cd ai-model
2. Create a virtual environment:
   ```bash
   python3 -m venv venv
3. Activate the virtual environment:
   - Mac/Linux:
     ```bash
     source venv/bin/activate
   - Windows:
    ```bash
    source venv/Scripts/activate
4. Install required packages:
   ```bash
   pip install Flask numpy scikit-learn==1.3.2
5. Run python app:
   ```bash
   python app.py

## 🏗️ Project Structure
The project follows a clean architecture with the following layers:

- 📂 **Data**: Handles data sources (API, Firebase, SharedPreferences).
- 📂 **Domain**: Contains business logic and use cases.
- 📂 **UI**: Manages the user interface and state management using Cubit.

## 📦 Dependencies
- **Flutter**: UI framework.
- **Geolocator**: For accessing the device's location.
- **Firebase**: For authentication and Firestore.
- **Cubit**: For state management.
- **Dio**: For making HTTP requests.
- **Flask**: For hosting the local AI model.
- **Scikit-learn**: For the AI model.

---

## 🎥 Demo
Check out the demo of the app [here](https://github.com/user-attachments/assets/9aa4fd74-61c0-42dc-a3b5-1b6bd391e93e).
