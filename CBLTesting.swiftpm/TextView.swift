//
//  TextView.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/29.
//

import SwiftUI

struct TextView: View {
    @State private var index: Int = 0
    @State private var isShowing: Bool = false

    let diaryData: DiaryData
    
    //MARK: AnimatedTextView
    struct AnimatedTextView: View {
        let text: String
        @State private var currentIndex: Int = 0
        
        var body: some View {
            
            // MARK: - 타이핑 되는 애니메이션
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Text(text.prefix(currentIndex))
                        .font(Font.custom("NanumGyuRiEuiIrGi", size: 40))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .onAppear {
                            let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                                if currentIndex < text.count {
                                    currentIndex += 1
                                }
                            }
                            RunLoop.current.add(timer, forMode: .common)
                        }
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            }
            .padding(.horizontal, 20)
        }
    }
    //문자열에서 캐릭터의 개수를 새면서 계속 반복하며 찍어내는것
    

    
    var body: some View {
        
        VStack {
            
            ZStack {
                VStack {
                    // MARK: - 노트 빨간줄 (하드코딩 ver.)
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 2)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 2)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 2)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 2)
                    Spacer()
                        .frame(height: 50)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 2)
                    
                }
                
                
                TabView(selection: $index) {
  // ["나는", "춘식이가", "좋아요."]
                    ForEach(0..<diaryData.diaryText.count, id: \.self) { index in
                        VStack {
                            AnimatedTextView(text: diaryData.diaryText[index])
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
//                                        let _ = print(diaryData.id)

                                    } label: {
                                        EmptyView()
                                    }
                                }
                            Spacer()
                        }
                        .lineSpacing(5.5)
                        .padding(.horizontal, 10)
                        .tag(index)
                    }
                    
                }
                .position(x:200, y: 240)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                .onChange(of: index) { newValue in
//                    sleep(3)
                    if index == diaryData.diaryText.count - 1 {
                        
                        isShowing.toggle()
                    }
                }
                
            }
            
            HStack(spacing: 15) {
//                Text(index.description)
                ForEach(diaryData.diaryText.indices, id: \.self) { i in
                    
                    if i < diaryData.diaryText.count {
                        Circle()
                        // TODO: - 현재 index에 강조하는 컬러 적용
                            .fill(i == index ? Color.yellow : Color.gray)
//                            .fill(Color.black)
                            .frame(width: 7)
                        }
                        
                    }
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

