import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State var audioPlayer: AVAudioPlayer?
    @Environment(\.presentationMode) var presentationMode

    // MARK: - 팀원들의 다이어리 데이터
    let memberData: [DiaryData] = [
        DiaryData(
            id: 0,
            memberName: "biny",
            diaryImage: "sampleImage",
            diaryText: [
                "대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!  기획을 엎는다는 건 참 지치고 힘든 일인 것 같아.",
                "Biny2",
                "Biny3"
            ]
        ),
        
        DiaryData(
            id: 1,
            memberName: "toughie",
            diaryImage: "sampleImage",
            diaryText: [
                "터피1비니 다음은 나야",
                "터피2",
                "터피3"
            ]
        ),
        
        DiaryData(
            id: 2,
            memberName: "lianne",
            diaryImage: "sampleImage",
            diaryText: [
                "예우닝터피 다음은 나야",
                "키키",
                "케케"
            ]
        ),
        
        DiaryData(
            id: 3,
            memberName: "miya",
            diaryImage: "sampleImage",
            diaryText: [
                "리앤 다음은 나야",
                "크크",
                "코코"
            ]
        ),
        
        DiaryData(
            id: 4,
            memberName: "anna",
            diaryImage: "sampleImage",
            diaryText: [
                "미야 다음은 나야",
                "카카",
                "캬캬"
            ]
        ),
        
        DiaryData(
            id: 5,
            memberName: "bruny",
            diaryImage: "sampleImage",
            diaryText: [
                "마지막은 나야",
                "ㅇㅇ",
                "ㅇㅇ"
            ]
        )
        
    ]
    
    
    var body: some View {
        VStack {
            NavigationView {
                ScrollView(.horizontal, showsIndicators: false) {
                   
                    HStack {
                        /* 비니의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: memberData[0])
                            .navigationBarBackButtonHidden(true)) {
                                Text("biny")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 터피의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: memberData[1])
                            .navigationBarBackButtonHidden(true)) {
                                Text("toughie")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
           
                        
                        /* 리앤의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: memberData[2])
                            .navigationBarBackButtonHidden(true)) {
                                Text("lianne")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 미야의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: memberData[3])
                            .navigationBarBackButtonHidden(true)) {
                                Text("miya")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 안나의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: memberData[4])
                            .navigationBarBackButtonHidden(true)) {
                                Text("anna")
                                    .font(.title)
                            }
                            .padding(.horizontal, 20)
                        
                        
                        /* 브루니의 일기 */
                        NavigationLink(destination:  DiaryDetailView(diaryData: memberData[5])
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
