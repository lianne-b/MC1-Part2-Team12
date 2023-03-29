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
    
    let diaryText: [String]
    
    
    var body: some View {
        
        VStack {
            
            TabView(selection: $index) {
                ForEach(0..<diaryText.count, id: \.self) { index in
                    Text(diaryText[index])
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
                if index == diaryText.count - 1 {
                    isShowing.toggle()
                }
            }
            
            
            
            HStack(spacing: 15) {
                Text(index.description)
                ForEach(diaryText.indices, id: \.self) { index in
                    
                    if index < diaryText.count - 1 {
                        Circle()
                        // TODO: - 현재 index에 강조하는 컬러 적용
                        //                        .fill(getIndex() == index ? Color.black : Color.white)
                            .fill(Color.black)
                            .frame(width: 7)
                    }
                    
                }
            }
        }
//        .background(
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .edgesIgnoringSafeArea(.all)
//        )
        
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
