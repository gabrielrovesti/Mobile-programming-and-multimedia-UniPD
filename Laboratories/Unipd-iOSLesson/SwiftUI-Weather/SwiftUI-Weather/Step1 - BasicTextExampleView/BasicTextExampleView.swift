//  BasicTextExampleView.swift

import SwiftUI

struct BasicTextExampleView: View {

    var body: some View {
        Text("London, UK")
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(Color.red)
            .frame(width: 200, height: 200)
    }
}

struct BasicTextExampleView_Previews: PreviewProvider {
    static var previews: some View {
        BasicTextExampleView()
.previewInterfaceOrientation(.portrait)
    }
}
