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
    
    
    struct AnimatedTextView: View {
        let text: String
        @State private var currentIndex: Int = 0
        
        var body: some View {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Text(text.prefix(currentIndex))
                        .font(.headline)
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
        }
    }
    

    
    var body: some View {
        
        VStack {
            
            ZStack {
                VStack {
                    // MARK: - 노트 빨간줄 (하드코딩 ver.)
                    // TODO: - 내용 텍스트에 top alignment & 스와이프 시 빨간줄도 내용과 같이 이동하게 수정
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 4)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 4)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 4)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Rectangle()
                        .fill(Color.red)
                        .frame(height: 4)
                }
                
                
                TabView(selection: $index) {
 
                    ForEach(0..<diaryData.diaryText.count, id: \.self) { index in
                        VStack {
                            AnimatedTextView(text: diaryData.diaryText[index])
                             .overlay {
                                    NavigationLink(isActive: $isShowing) {
                                        
                                        // TODO: - 로직 수정 필요
                                        // 넘겨진 데이터는 특정 멤버의 데이터
                                        // 데이터에 id 값이 있다
                                        // 다음 페이지 멤버의 id 값은 무조건 +1
                                        // 솔루션: 현재 데이터의 id에 +1 연산 후 / 연산 결과와 일치한 id를 갖고 있는 데이터로 넘어가기
                                        
                                        if diaryData.id < DiaryViewModel.shared.memberData.count - 1 {
                                            DiaryDetailView(diaryData: diaryData.id < 5 ? DiaryViewModel.shared.memberData[diaryData.id + 1] :
                                                DiaryViewModel.shared.memberData[5])
                                            .navigationBarBackButtonHidden(true)
                                        } else {
                                            EndingView()
                                        }
                                        let _ = print(diaryData.id)

                                    } label: {
                                        EmptyView()
                                    }
                                }
                            Spacer()
                        }
                        .lineSpacing(30)
                        .padding(.horizontal, 10)
                        .tag(index)
                    }
                    
                }
                .position(x:200, y: 280)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: index) { newValue in
                    if index == diaryData.diaryText.count - 1 {
                        isShowing.toggle()
                    }
                }
                
            }
            
            HStack(spacing: 15) {
                Text(index.description)
                ForEach(diaryData.diaryText.indices, id: \.self) { index in
                    
                    if index < diaryData.diaryText.count - 1 {
                        Circle()
                        // TODO: - 현재 index에 강조하는 컬러 적용
                            .fill(Color.black)
                            .frame(width: 7)
                        }
                        
                    }
                }
            }
            
            
        }
        
        
        
        //    func getIndex() -> Int {
        //        let index = Int(round(Double(offset / getWidth())))
        //        return index
        //    }
    }
    
    
    
    
    
    //struct TextView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        NavigationView {
    //            TextView()
    //        }
    //
    //    }
    //}

