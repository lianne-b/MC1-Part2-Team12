import SwiftUI
import AVFoundation


struct NewView3: View {
    @State var audioPlayer: AVAudioPlayer?

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)

            VStack {
                Text("니가 그린 그림일기")
                    .padding(.vertical)
                Text("우당탕탕 12조")
                    .padding(.vertical)
                
                Button("Next View") {

                }
                .padding(.vertical, 30)
                
                
            }
                

                
//
        }
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
        .onDisappear {
            audioPlayer?.stop()
        }
    }
}
