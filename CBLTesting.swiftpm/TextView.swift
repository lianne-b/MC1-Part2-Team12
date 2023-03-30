//
//  TextView.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/29.
//

import SwiftUI

struct TextView: View {
    /* 뷰 네비게이션에 쓰이는 변수 */
    @State private var index: Int = 0
    @State private var isShowing: Bool = false
    
    /* 스템프 애니메이션에 쓰이는 변수 */
    @State private var animationAmount: CGFloat = 1
    @State private var stampOpacity = false
    
    let diaryData: DiaryData
    
    // MARK: - 텍스트 애니메이션 뷰
    struct AnimatedTextView: View {
        let text: String
        let font: String
        
        @State private var currentIndex: Int = 0
        
        var body: some View {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Text(text.prefix(currentIndex))
                        .font(Font.custom(font, size: 30))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .onAppear {
                            let timer = Timer.scheduledTimer(withTimeInterval: 0.06, repeats: true) { _ in
                                if currentIndex < text.count {
                                    currentIndex += 1
                                }
                            }
                            RunLoop.current.add(timer, forMode: .common)
                        }
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            }
            .padding(.horizontal, 15)
        }
    }
    //문자열에서 캐릭터의 개수를 새면서 계속 반복하며 찍어내는것
    //MARK: 빨간색 선
    

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    // MARK: - 노트 빨간줄
                    ForEach(0..<6, id: \.self) { _ in
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 2)
                        
                        Spacer()
                            .frame(height: 48)
                    }
                }
                
                VStack {
                    TabView(selection: $index) {
                        ForEach(0..<diaryData.diaryText.count, id: \.self) { index in
                            VStack {
                                AnimatedTextView(text: diaryData.diaryText[index], font: diaryData.diaryFont)
                                    .overlay {
                                        NavigationLink(isActive: $isShowing) {
                                            
                                            // MARK: - 다음 멤버의 페이지로 스와이핑 되는 로직 (데이터 교체)
                                            // 현재 넘겨져 온 데이터는 특정 멤버의 데이터
                                            // 데이터 속성 중 id 값이 memberData에서의 인덱스에 해당하고, 다음 페이지 멤버의 id 값은 무조건 +1이다
                                            // 솔루션: (현재 데이터의 id + 1)에 해당하는 데이터로 넘어가게 한다
                                            if diaryData.id < DiaryViewModel.shared.memberData.count - 1 {
                                                DiaryDetailView(diaryData: diaryData.id < 5 ? DiaryViewModel.shared.memberData[diaryData.id + 1] :
                                                                    DiaryViewModel.shared.memberData[5])
                                                .navigationBarBackButtonHidden(true)
                                            } else {
                                                EndingView()
                                            }
                                            
                                        } label: {
                                            EmptyView()
                                        }
                                   }
               
                            }
                            .lineSpacing(20)
                            .tag(index)
                        }
                    }
//                    .position(x:200, y: 280)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .onChange(of: index) { newValue in
                        if index == diaryData.diaryText.count - 1 {
                            isShowing.toggle()
                        }
                    }
                }
                
                
                // MARK: - 스템프 이미지
                HStack {
                    Spacer()
                    Image(diaryData.diaryStamp)
                        .resizable()
                        .frame(width: 180, height: 180)
                        .scaleEffect(animationAmount, anchor: .center)
                        .animation(Animation.spring().speed(2), value: animationAmount)
                        .opacity(stampOpacity ? 1.0 : 0.0)
                        .padding(.trailing, 10)
                        .offset(y: 90)

                }
            }
            

            // MARK: - 탭뷰 하단 인디케이터
            HStack(spacing: 15) {
                //                Text(index.description)
                ForEach(diaryData.diaryText.indices, id: \.self) { i in
                    
                    if i < diaryData.diaryText.count - 1 {
                        Circle()
                            .fill(i == index ? Color.black : Color(.systemGray2))
                            .frame(width: 10)
                    }
                    
                }
            }
      
            
            // MARK: - 스템프 트리거 버튼 영역 (opacity: 0 으로 처리)
            HStack {
                Spacer()
                Button {
                    self.animationAmount -= 0.1
                    stampOpacity = true
                } label: {
                    Text("리액션 달기")
                        .bold()
                        .font(.title2)
                        .opacity(0.0)
                        .padding(.leading, 50)
                        .padding(.vertical, 40)
                }
                .padding(.bottom, 20)
            }
            
        }
        
        
    }
    
}





//struct TextView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            TextView()
//        }
//
//    }
//}

