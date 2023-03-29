//
//  NewView2.swift
//  CBLTesting
//
//  Created by KimChoonSik on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct NewView2: View {
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        
        Image("시작화면")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                guard let soundPath = Bundle.main.path(forResource: "mainBGM", ofType: "mp3") else { return }
                let url = URL(fileURLWithPath: soundPath)
                
                do {
                    // Initialize audio player
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    
                    // Play audio
                    audioPlayer?.play()
                    print("Music started playing.")
                } catch {
                    print("Error playing music: \(error.localizedDescription)")
                }
            }
    }

}


