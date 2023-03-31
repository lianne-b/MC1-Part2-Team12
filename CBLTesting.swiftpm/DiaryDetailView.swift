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
            Spacer()
                .frame(height: 120)
            
            // MARK: - 화면 상단 바
            HStack {
                /* 홈 버튼 */
                NavigationLink(destination: ContentView()
                    .navigationBarBackButtonHidden(true)) {
                    Image("homeIcon")
                        .frame(width: 30)
                }
                
                Spacer()
                
                /* 일기 제목 */
                Text(diaryData.diaryName)
                    .font(Font.custom(diaryData.diaryFont, size: 40))
                    .bold()
                
                Spacer()
                
                Image("homeIcon")
                    .frame(width: 30)
                    .opacity(0.0)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            

            
            // MARK: - 화면 내용
            /* 일기 그림 담는 뷰 */
            VStack {
                Image(diaryData.diaryImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 305, height: 305)
                    .overlay(
                        Rectangle()
                            .stroke(Color.black, lineWidth: 1)
                    )
                
                HStack {
                    ForEach(0..<3, id: \.self) { _ in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemGray2))
                            .frame(width: 15, height: 35)
                            .offset(x: -100, y: -330)
                    }
                }
            }
            .padding(.bottom, -10)
            
            /* 일기 내용 담는 뷰 */
            TextView(diaryData: diaryData)
            
        }
        .background(Image("background").ignoresSafeArea())
        .onAppear {
            guard let soundPath = Bundle.main.path(forResource: diaryData.bgm, ofType: "mp3") else { return }
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




