import requests

API_URL = "https://samples.openweathermap.org/data/2.5/forecast/hourly?q=London,us&appid=b6907d289e10d714a6e88b30761fae22"

def fetch_weather_data():
    response = requests.get(API_URL)
    return response.json()

def get_temperature(date_time):
    weather_data = fetch_weather_data()
    for forecast in weather_data['list']:
        if forecast['dt_txt'] == date_time:
            return forecast['main']['temp']

def get_wind_speed(date_time):
    weather_data = fetch_weather_data()
    for forecast in weather_data['list']:
        if forecast['dt_txt'] == date_time:
            return forecast['wind']['speed']

def get_pressure(date_time):
    weather_data = fetch_weather_data()
    for forecast in weather_data['list']:
        if forecast['dt_txt'] == date_time:
            return forecast['main']['pressure']

def main():
    while True:
        print("\n1. Get Temperature\n2. Get Wind Speed\n3. Get Pressure\n0. Exit")
        choice = input("Enter your choice: ")

        if choice == '1':
            date_time = input("Enter date and time (YYYY-MM-DD HH:MM:SS): ")
            temperature = get_temperature(date_time)
            print(f"Temperature at {date_time}: {temperature}°C")

        elif choice == '2':
            date_time = input("Enter date and time (YYYY-MM-DD HH:MM:SS): ")
            wind_speed = get_wind_speed(date_time)
            print(f"Wind Speed at {date_time}: {wind_speed} m/s")

        elif choice == '3':
            date_time = input("Enter date and time (YYYY-MM-DD HH:MM:SS): ")
            pressure = get_pressure(date_time)
            print(f"Pressure at {date_time}: {pressure} hPa")

        elif choice == '0':
            break

        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
