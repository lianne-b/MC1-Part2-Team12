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
        }
        .onAppear {
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isNextViewPresented = true
                }
            }
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
