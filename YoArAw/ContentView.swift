//
//  ContentView.swift
//  YoArAw
//
//  Created by Sanchez, Rafael on 1/13/26.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var imageCounter = 0
    

    var body: some View {
        
        VStack {
          
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)  // shorten font to fit (ex: up to 50%)
                .frame(height: 100) // restrict text to this specified frame
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)  // play (default) animation when (imageName) changes
            
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "When the Genius Bar needs help, they call you!",
                                "You Are Great!",
                                "Nice Job!",
                                "Fabulous!"
                                ]
                

                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if imageNumber > 9 {
                    imageNumber = 0
                }
                
                if imageCounter == messages.count {
                    imageCounter = 0
                }

                message = messages[imageCounter]
                imageCounter += 1
                
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
