//  BasicWeatherUIView.swift

import SwiftUI

struct BasicWeatherUIView: View {
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Text("London, UK")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                Text("22°")
                    .foregroundColor(.white)
                    .font(.system(size: 70, weight: .medium))
                Spacer()
            }
        }
    }
}

struct BasicWeatherUIView_Previews: PreviewProvider {
    static var previews: some View {
        BasicWeatherUIView()
            .previewInterfaceOrientation(.portrait)
    }
}
