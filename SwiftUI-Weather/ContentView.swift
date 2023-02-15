//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Niko Berdzenishvili on 15.02.23.
//

import SwiftUI

struct ContentView: View {

  @State private var isNight = false

  var body: some View {
    ZStack {

      BackgroundView(topColor: isNight ? .black : .blue,
                     bottomColor: isNight ? .gray : Color("lightBlue"))

      VStack{
        CityTextView(cityName: "Tbilisi, Georgia")
        MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 9)

        HStack(spacing: 25){
          WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temperature: 7)
          WeatherDayView(dayOfWeek: "Wed", imageName: "sun.max.fill", temperature: 11)
          WeatherDayView(dayOfWeek: "Thu", imageName: "wind.snow", temperature: 3)
          WeatherDayView(dayOfWeek: "Fri", imageName: "snow", temperature: 5)
          WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.fill", temperature: 8)
        }
        Spacer()
        Button{
          isNight.toggle()
        } label: {
          WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)

        }; Spacer()
      }
    }
  }
}

//MARK: - Structs

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct WeatherDayView: View {

  var dayOfWeek: String
  var imageName: String
  var temperature: Int

  var body: some View {
    VStack {
      Text(dayOfWeek)
        .font(.system(size: 20, weight: .medium))
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 55, height: 55)
      Text("\(temperature)°")
        .font(.system(size: 20, weight: .medium))
    }
  }
}

struct BackgroundView: View {

  var topColor: Color
  var bottomColor: Color

  var body: some View {
    LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                   startPoint: .topLeading,
                   endPoint: .bottomLeading)
    .edgesIgnoringSafeArea(.all)
  }
}

struct CityTextView: View {
  var cityName: String

  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {

  var imageName: String
  var temperature: Int
  var body: some View {
    VStack(spacing: 10) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 190, height: 190)

      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
    }.padding(.bottom, 100)
  }
}
