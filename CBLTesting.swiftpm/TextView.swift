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
    
    //MARK: 텍스트 애니메이션 뷰
    struct AnimatedTextView: View {
        let text: String
        @State private var currentIndex: Int = 0
        
        var body: some View {

            //MARK: VStack으로 안 묶어도 잘 작동하는 거 같아서 우선 주석처리 해뒀어요!
//            VStack(alignment: .leading) {
                Text(text.prefix(currentIndex))
                    .font(.headline)
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
            .padding(.horizontal, 20)
        }
    }
    //MARK: 빨간색 선
    var body: some View {
        VStack {
            ZStack {
                VStack {
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
                
                //MARK: 탭뷰 (탭뷰 안에서 AnimatedTextView 찍어냄)
                TabView(selection: $index) {
                    ForEach(0..<diaryData.diaryText.count, id: \.self) { index in
                        VStack {
                            AnimatedTextView(text: diaryData.diaryText[index])
                                .overlay {
                                    NavigationLink(isActive: $isShowing) {
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
                            Spacer()
                        }

                        .lineSpacing(30)
                        .tag(index)
                    }
                }
                .position(x:200, y: 282)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: index) { newValue in
                    if index == diaryData.diaryText.count - 1 {
                        isShowing.toggle()
                    }
                }
            }
            //MARK: 인디케이터 코드, 현재 너무 하단에 내려와 있는 거 같아서 위치 조정 좀 하면 좋을 거 같아요
            HStack(spacing: 15) {
                ForEach(diaryData.diaryText.indices, id: \.self) { i in
                    if i < diaryData.diaryText.count {
                        Circle()
                            .fill(i == index ? Color.yellow : Color.gray)
                            .frame(width: 10)
                    }
                }
            }
        }
    }
}

