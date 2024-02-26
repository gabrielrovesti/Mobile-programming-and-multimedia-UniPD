//  FinalCustomButton.swift

import SwiftUI

struct FinalCustomButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}

struct FinalCustomButton_Previews: PreviewProvider {
    static var previews: some View {
        FinalCustomButton(title: "Test text", textColor: .orange, backgroundColor: .blue)
.previewInterfaceOrientation(.portrait)
    }
}
