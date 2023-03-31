import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        
        NavigationView{
            ZStack{
                ScrollView(.horizontal,showsIndicators: false) {
                    
                    HStack(alignment: .center) {
                        ForEach(0..<6) {index in
                            VStack {
                                NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[index])
                                    .navigationBarBackButtonHidden(true)) {
                                        Image(DiaryViewModel.shared.memberData[index].mimoji)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 210, height: 250, alignment: .center).cornerRadius(16)
                                            .shadow(radius: 16)
                                    }
                                Text(DiaryViewModel.shared.memberData[index].memberName)
                                    .foregroundColor(.black)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
                                Text(DiaryViewModel.shared.memberData[index].mimojiText)
                                    .foregroundColor(Color(red: 0.439, green: 0.439, blue: 0.439))
                                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                                    .font(Font.custom("NanumDongHwaDdoBag", size: 30))
                                
                            }.frame(width:250, height: 350, alignment: .center)
                        }
                    }.padding(.vertical,170)
                }.frame(height: 400)
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
                
                
                VStack {
                    Text("우리의 CBL 이야기")
                        .font(Font.custom("NanumDongHwaDdoBag", size: 45))
                        .bold()
                        .padding(.vertical, 10)
                        
                    
                    Spacer()
                }
                
                    
            }
        }
        
        Spacer()
    }
    
    
}

