import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var audioPlayer: AVAudioPlayer?
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false) {
                   
                    HStack {
                        /* 비니의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[0])
                            .navigationBarBackButtonHidden(true)) {
                                Text("biny")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 터피의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[1])
                            .navigationBarBackButtonHidden(true)) {
                                Text("toughie")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
           
                        
                        /* 리앤의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[2])
                            .navigationBarBackButtonHidden(true)) {
                                Text("lianne")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 미야의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[3])
                            .navigationBarBackButtonHidden(true)) {
                                Text("miya")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 안나의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[4])
                            .navigationBarBackButtonHidden(true)) {
                                Text("anna")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 브루니의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[5])
                            .navigationBarBackButtonHidden(true)) {
                                Text("bruny")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                    }
                    
                }
                
            }
        }
         .onAppear {
            guard let soundPath = Bundle.main.path(forResource: "실수", ofType: "mp3") else { return }
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
            print("음악이 끊겨야됨")
        }
    
    }
}
