import SwiftUI

struct ContentView: View {
    
    let miya = DiaryData(
        diaryImage: "cc",
        diaryText: [
            "춘식이 너무너무 귀여워 고구마도 좋아하고 젤리도 좋아하고 생선은 싫어해. 노란색 고양이 너무 귀여워요 춘장이들 최고야 그래도 역시 라이언이 주는 밥이 제일 좋아",
            "두 번째 문장입니다.",
            "세 번째 문장입니다."
        ]
    )
    
    let biny = DiaryData(
        diaryImage: "cc",
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
