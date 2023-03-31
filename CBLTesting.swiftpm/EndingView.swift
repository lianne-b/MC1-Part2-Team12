//
//  EndingView.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct EndingView: View {
    @State var audioPlayer: AVAudioPlayer?
    @State var ImageOpacity: Double = 0.0
    
    var body: some View {
        VStack {
            
            NavigationLink {
                WrapUpView()
            } label: {
                Image("EndingViewImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden()
            }

        }.onAppear {
            guard let soundPath = Bundle.main.path(forResource: "finalMusic", ofType: "mp3") else {
                return }
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
        .onDisappear {
            audioPlayer?.stop()
        }
        
        
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
