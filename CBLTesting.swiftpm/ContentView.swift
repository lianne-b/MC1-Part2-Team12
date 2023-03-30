import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            NavigationView{
                ScrollView(.horizontal,showsIndicators: false) {
                    HStack(alignment: .center, spacing: 70) {
                        ForEach(0..<6) {index in
                            VStack {
                                NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[index])
                                    .navigationBarBackButtonHidden(true)) {
                                        Image(DiaryViewModel.shared.memberData[index].mimoji)
                                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
                                            .shadow(radius: 16)
                                    }
                                Text(DiaryViewModel.shared.memberData[index].mimojiText)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .black, design: .rounded))
                                    .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
                                Text(DiaryViewModel.shared.memberData[index].memberName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 10, weight: .black, design: .rounded))
                            }.frame(width:150,alignment: .center)
                            
                        }
                    }.padding(.vertical,200)
                }
                
                .onDisappear {
                    audioPlayer?.stop()
                    print("음악이 끊겨야됨")
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
                }.background(
                    Image("background"))
                .edgesIgnoringSafeArea(.all)
            }
    }
}

