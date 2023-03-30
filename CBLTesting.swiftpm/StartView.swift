//
//  StartView.swift
//  CBLTesting
//
//  Created by 정현 on 2023/03/30.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 30 ) {
                Text("우당탕탕 12조")
                    .font(.system(size: 20, weight: .black, design: .rounded))
                Text("내가 그린 기린 그림")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                Text("니가 그린 그림일기")
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    Button(action: {
                        print("Button is Clicked")
                    },
                           label : {
                        NavigationLink(destination: MenuView().navigationBarBackButtonHidden(true)){
                            Text("시작하기")
                                .padding(20)
                                .foregroundColor(.black)
                                .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black , lineWidth: 5))
                                
                        }
                    }).padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 0))
                

            }
            .background(
                Image("background"))
            .edgesIgnoringSafeArea(.all)
        }
    }
}i


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
