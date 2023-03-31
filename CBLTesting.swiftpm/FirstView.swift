//import SwiftUI
//
//struct TypingText: View {
//    let text: String
//    @State private var visibleText: String = ""
//
//    var body: some View {
//        Text(visibleText)
//            .font(.title)
//            .onAppear {
//                DispatchQueue.global(qos: .userInitiated).async {
//                    for character in text {
//                        Thread.sleep(forTimeInterval: 0.2) // adjust speed of typing here
//                        DispatchQueue.main.async {
//                            visibleText.append(character)
//                        }
//                    }
//                }
//            }
//    }
//}
//
//struct FirstView: View {
//    var body: some View {
//        VStack {
//            TypingText(text: "Hello, World!")
//        }
//    }
//}
//
//
//  FirstView.swift
//  CBLTesting
//
//  Created by 정현 on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct FirstView: View {
    @State private var isNextViewPresented = false
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        ZStack {
            NavigationView{
                VStack(alignment: .center, spacing: 36 ) {
                    Image("TitleA")
                    Image("TitleB")
                    Button(action: {
                        print("Button is Clicked")
                        isNextViewPresented = true
                    },
                           label : {
                        Text("시작하기")
                            .padding(20)
                            .foregroundColor(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black , lineWidth: 5))
                    }).padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                }
                .background(
                    Image("background")
                        .edgesIgnoringSafeArea(.all)
                )
            }
            if isNextViewPresented {
                ContentView()
                    .transition(.opacity)
                    .onAppear {
                        self.audioPlayer?.stop()
                    }
            }
        }.onAppear {
            guard let soundPath = Bundle.main.path(forResource: "firstMusic", ofType: "mp3") else { return }
            let url = URL(fileURLWithPath: soundPath)
            
            do {
                // Initialize audio player
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                
                // Play audio
                audioPlayer?.play()
                print("Music started playing.")
            } catch {
                print("Error playing music: : \(error.localizedDescription)")
            }
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
