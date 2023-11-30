import SwiftUI

struct ContentView: View {
    @State var weatherData = WeatherDataModel()
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var isLandscape: Bool { verticalSizeClass == .compact}
    
    
    var body: some View {
        ZStack {
            Image("sun-rays-cloudy-sky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            if isLandscape {
                // Landscape
                HStack {
                    topView().environmentObject(weatherData)
                    centerView().environmentObject(weatherData)
                    sevenDayView().environmentObject(weatherData)
                }
            } else {
                // Portrait
                VStack {
                    topView().environmentObject(weatherData)
                    
                    Spacer()
                    
                    centerView().environmentObject(weatherData)
                    
                    Spacer()
                    
                    sevenDayView().environmentObject(weatherData)
                }
            }
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
