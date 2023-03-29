import SwiftUI
import AVFoundation

struct NewView: View {
    @State var audioPlayer: AVAudioPlayer?
    
    

    var body: some View {
        GeometryReader { geo in
            VStack {

                Button {
                    guard let soundPath = Bundle.main.path(forResource: "Younha (윤하) - Home", ofType: "mp3") else { return }
                    let url = URL(fileURLWithPath: soundPath)

                    do {
                        // Initialize audio player
                        audioPlayer = try AVAudioPlayer(contentsOf: url)

                        // Play audio
                        audioPlayer?.play()
                        print("노래가 재생됨")
                    } catch {
                        print("노래 재생 안 됨")
                        print("Error playing sound: \(error.localizedDescription)")
                    }
                } label: {
                    Text("노래 재생")
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .background(
            Image("시작화면")
                .resizable()
                .scaledToFill()
        )
        .edgesIgnoringSafeArea(.all)
    }

    struct NewView_Previews: PreviewProvider {
        static var previews: some View {
            NewView()
        }
    }
}

