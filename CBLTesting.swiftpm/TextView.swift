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
    
//    let memberOrder: [String] = ["biny", "toughie", "lianne", "miya", "anna", "bruny"]
    
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
                        Text(diaryData.diaryText[index])
                                .lineSpacing(30)
                                .tag(index)
                                .overlay {
                                    NavigationLink(isActive: $isShowing) {
                                        
                                        // TODO: - 로직 수정 필요
                                        DiaryDetailView(diaryData: DiaryData(id: diaryData.id, memberName: diaryData.memberName, diaryImage: diaryData.diaryImage, diaryText: diaryData.diaryText))
                                    } label: {
                                        EmptyView()
                                    }
                                }
                            
                        }
                    
                }
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
    //                        .fill(getIndex() == index ? Color.black : Color.white)
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
