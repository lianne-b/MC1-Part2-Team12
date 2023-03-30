//
//  DiaryDetailView.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/29.
//

import SwiftUI
import AVFAudio

struct DiaryDetailView: View {
    @State var audioPlayer: AVAudioPlayer?
    let diaryData: DiaryData
    
    var body: some View {
        
        VStack {
            // MARK: - 화면 상단 바
            HStack {
                /* 홈 버튼 */
                NavigationLink(destination: ContentView()
                    .navigationBarBackButtonHidden(true)) {
                    Image(systemName: "house.fill")
                        .font(.title)
                }
                
                Spacer()
                
                /* 일기 제목 */
                Text("춘식이는 최고야! ")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            

            
            // MARK: - 화면 내용
            /* 일기 그림 담는 뷰 */
            Image(diaryData.diaryImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
            
            /* 일기 내용 담는 뷰 */
            TextView(diaryData: diaryData)
            
        }
        .onAppear {
            guard let soundPath = Bundle.main.path(forResource: "파울", ofType: "mp3") else { return }
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

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(diaryData: DiaryData(id: 12, memberName: "miya", diaryImage: "miyaImage", diaryText: ["대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!  기획을 엎는다는 건 참 지치고 힘든 일인 것 같아.", "이럴 땐 꼭 당 보충을 해줘야 하는 거 알지. 오늘은 집 가는 길에 반드시 브라우니를 사먹을거야!! 🥹", "dddddddd", ""
            ],mimoji: "Bruni",mimojiText: "HJI"))
    }
}



