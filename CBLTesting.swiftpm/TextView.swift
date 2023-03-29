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
    
    var colors: [Text] = [
        Text("대해서 논의하다가 아이디어가 엎어진 게 기억에 남네. 주체적인 생활... 뭘까?ㅎ 이게 맞나? 아~ 다 모르겠고!  기획을 엎는다는 건 참 지치고 힘든 일인 것 같아."),
        Text("이럴 땐 꼭 당 보충을 해줘야 하는 거 알지. 오늘은 집 가는 길에 반드시 브라우니를 사먹을거야!! 🥹"),
        Text("dddddddd"),
        Text("")
        ]
    
    var body: some View {
       
        VStack {
            
            TabView(selection: $index) {
//                ForEach(colors.indices, id: \.self) { index in
//                    colors[index]
//                }
                ForEach(0..<colors.count, id: \.self) { index in
                    colors[index]
                        .tag(index)
                        .overlay {
                            NavigationLink(isActive: $isShowing) {
                                Text("도착지")
                            } label: {
                                EmptyView()
                            }

                        }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onChange(of: index) { newValue in
                if index == colors.count - 1 {
                    isShowing.toggle()
                }
            }
            

            
            HStack(spacing: 15) {
                Text(index.description)
                ForEach(colors.indices, id: \.self) { index in
                    
                    if index < colors.count - 1 {
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

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TextView()
        }
        
    }
}
