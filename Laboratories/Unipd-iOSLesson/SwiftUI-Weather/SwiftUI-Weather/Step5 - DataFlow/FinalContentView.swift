//  FinalContentView.swift

import SwiftUI

struct WeatherDay: Identifiable, Hashable {
    var name: String
    var imageName: String
    var temperature: Int
    
    var id: Int {
        name.hashValue
    }
}

struct FinalContentView: View {
    
    @State private var isNight = false
    
    let days = [
        WeatherDay(name: "MON", imageName: "cloud.sun.fill", temperature: 22),
        WeatherDay(name: "TUE", imageName: "sun.max.fill", temperature: 24),
        WeatherDay(name: "WED", imageName: "cloud.rain.fill", temperature: 19),
        WeatherDay(name: "THU", imageName: "cloud.sun.fill", temperature: 18),
        WeatherDay(name: "FRI", imageName: "tornado", temperature: 6)
    ]
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "London, UK")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 22)
                
                HStack(spacing: 20) {
                    ForEach(days, id: \.self.id) { day in
                        WeatherDayView(dayOfWeek: day.name,
                                       imageName: day.imageName,
                                       temperature: day.temperature)
                    }
                }
                
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    FinalCustomButton(title: "Change day time",
                                      textColor: isNight ? .white : .blue,
                                      backgroundColor: isNight ? .gray : .white)
                }
                
                Spacer()
            }
        }
    }
}

fileprivate struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

fileprivate struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

fileprivate struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

fileprivate struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.headline)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct FinalContentView_Previews: PreviewProvider {
    static var previews: some View {
        FinalContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
