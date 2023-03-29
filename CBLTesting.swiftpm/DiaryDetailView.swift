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
            TextView(diaryText: diaryData.diaryText)
            
        }
    }
}

struct DiaryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryDetailView(diaryData: DiaryData(diaryImage: "miya", diaryText: ["대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!  기획을 엎는다는 건 참 지치고 힘든 일인 것 같아.", "이럴 땐 꼭 당 보충을 해줘야 하는 거 알지. 오늘은 집 가는 길에 반드시 브라우니를 사먹을거야!! 🥹", "dddddddd", ""
            ]))
    }
}