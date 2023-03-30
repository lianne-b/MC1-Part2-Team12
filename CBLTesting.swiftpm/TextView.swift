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
                    
                    ForEach(0..<diaryText.count, id: \.self) { index in
                        VStack {
                            AnimatedTextView(text: diaryText[index])
                            Spacer()
                        }
                        .lineSpacing(30)
                        .padding(.horizontal, 10)
                        .tag(index)
//                        .overlay {
//                            NavigationLink(isActive: $isShowing) {
//                                Text("도착지")
//                            } label: {
//                                EmptyView()
//                            }
//                        }
                        
                    }
                    
                }
                .position(x:200, y: 280)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .onChange(of: index) { newValue in
                    if index == diaryText.count - 1 {
                        isShowing.toggle()
                    }
                }
                
                
                
                
            }
            
            
            
            
            HStack(spacing: 15) {
                //                Text(index.description)
                ForEach(diaryText.indices, id: \.self) { index in
                    
                    if index < diaryText.count  {
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

