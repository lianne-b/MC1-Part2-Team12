//
//  stampView.swift
//  CBLTesting
//
//  Created by Sebin Kwon on 2023/03/30.
//

import SwiftUI

struct stampView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var num = 0
    @State private var opacity = false
    let array = ["One", "Two", "Three"]
    
    var body: some View {
        VStack {
            if num < array.count {
                Text(array[num])
            }
            Text("Hello, World!")
            TapMe
            Image("stamp")
//                .delay(1)
                .resizable()
                .frame(width: 500, height: 500)
                .scaleEffect(animationAmount, anchor: .center)
                .animation(Animation.spring().speed(2), value: animationAmount)
                .offset(x: 50, y: 230)
                .opacity(opacity ? 1.0 : 0.0)
        }
    }
    
    var TapMe: some View {
        Button(action: {
            // 인덱스 넘어가지 않을 만큼만 인덱스 값 올리기
            if num < array.count {
                num += 1
                // 마지막 배열값이면 도장찍히게
                if num == array.count {
                    self.animationAmount -= 0.5
                    opacity = true
                }
            }
        }) {
            Text("Tap Me")
        }
    }
    
}

struct stampView_Previews: PreviewProvider {
    static var previews: some View {
        stampView()
    }
}
