//
//  ContentView.swift
//  YoArAw
//
//  Created by Sanchez, Rafael on 1/13/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer : AVAudioPlayer!
    let numberOfImages = 10  // image0 - image9
    let numberOfSounds = 6  // sound0 - sound5


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
            
            Spacer()
            
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
            
                

                /*
                repeat {
                    imageNumber = Int.random(in: 0...numberOfImages-1)
                } while imageNumber == lastImageNumber
                 */
                lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages-1)
                imageName = "image\(lastImageNumber)"
                
                /*
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                 */
                lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                message = messages[lastImageNumber]
            
                /*
                repeat {
                    soundNumber = Int.random(in: 0...numberOfSounds-1)
                } while soundNumber == lastSoundNumber
                 */
                lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfSounds-1)
                playSound(soundName: "sound\(lastSoundNumber)")
                
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
            
        }
        .padding()
        
    }
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName)")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int {
        var currNumber : Int
        repeat {
            currNumber = Int.random(in: 0...upperBounds)
        } while currNumber == lastNumber
        
        return currNumber
    }
    
}

#Preview {
    ContentView()
}
