//
//  DiaryDetailView.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/29.
//

import SwiftUI

struct DiaryDetailView: View {
    
    let diaryData: DiaryData
    
    var body: some View {
        
        VStack {
            
            // MARK: - 화면 상단 바
            HStack {
                
                /* 홈 버튼 */
                Button {
                    // 홈으로 이동
                } label: {
                    Image(systemName: "house.fill")
                        .font(.title)
                }
                
                Spacer()
                
                /* 일기 제목 */
                Text("주체적인 삶에 대한 논의")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            
            
            // MARK: - 화면 내용
            /* 일기 그림 담는 뷰 */
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            
            /* 일기 내용 담는 뷰 */
            TextView()
            
        }
    }
}

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(diaryData: DiaryData(diaryImage: "miya", diaryText: ["안녕", "나는", "미야"]))
    }
}
