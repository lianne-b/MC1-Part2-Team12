import SwiftUI

struct DiaryData {
    var diaryImage: String
    var diaryText: [String]
}


struct ContentView: View {
    
    let miya = DiaryData(
        diaryImage: "sampleImage",
        diaryText: [
            "대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!  기획을 엎는다는 건 참 지치고 힘든 일인 것 같아.",
            "dddddddd",
            "aaa"
        ]
    )
    
    var body: some View {
        VStack {
            
            // 타임라인 뷰
            
            
            // 타임라인에서 각 미모지로 누르면 하단 다이어리 단일 페이지로 이동
            /* 다이어리 단일 페이지 */
            
            
            DiaryDetailView(diaryData: miya)
            
        }
        .padding(.horizontal, 20)
    }
}
