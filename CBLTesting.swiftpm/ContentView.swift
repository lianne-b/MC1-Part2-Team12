import SwiftUI

struct ContentView: View {
    
    let miya = DiaryData(
        diaryImage: "sampleImage",
        diaryText: [
            "대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!  기획을 엎는다는 건 참 지치고 힘든 일인 것 같아.",
            "dddddddd",
            "aaa"
        ]
    )
    
    let biny = DiaryData(
        diaryImage: "sampleImage",
        diaryText: [
            "a12334444555",
            "12233333ee",
            "bbbbbbb"
        ]
    )
    
    
    var body: some View {
        VStack {

            NavigationView {
                DiaryDetailView(diaryData: miya)
                    .background(
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .ignoresSafeArea(.all)
                )
            }.navigationBarBackButtonHidden(true)
            
        }
//        .padding(.horizontal, 20)
        
    }
}
