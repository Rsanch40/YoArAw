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
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    

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
            
                
//                var lastMessageNumber : Int
//                var lastImageNumber : Int
//                repeat {
//                    lastImageNumber = Int.random(in: 0...9)
//                    imageName = "image\(lastImageNumber)"
//                    
//                    lastMessageNumber = Int.random(in: 0...messages.count-1)
//                    message = messages[lastMessageNumber]
//                } while image
                
                var messageNumber : Int
                var imageNumber : Int

                
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
            
                
                
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
