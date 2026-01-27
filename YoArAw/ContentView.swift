//
//  ContentView.swift
//  YoArAw
//
//  Created by Sanchez, Rafael on 1/13/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageString = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Image(systemName: imageString)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
            
            Spacer()
            
            Button("Press me!") {
//                let message1 = "You Are Awesome!"
//                let message2 = "You Are Great!"
//                
//                if message == message1 {
//                    message = message2
//                    imageString = "hand.thumbsup"
//                } else {
//                    imageString = "sun.max.fill"
//                    message = message1
//                }
                
                let message1 = "You Are Awesome!"
                let message2 = "You Are Great!"
                let imageString1 = "sun.max.fill"
                let imageString2 = "hand.thumbsup"
                message = (message == message1 ? message2 : message1)
                imageString = (imageString == imageString1 ? imageString2 : imageString1)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
