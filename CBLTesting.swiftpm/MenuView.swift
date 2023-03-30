//
//  MenuView.swift
//  MC1
//
//  Created by 정현 on 2023/03/30.
//

import Foundation
import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView{
            VStack() {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 150) { // Stack 별 차이
                        ForEach(users) { rs in
                            GeometryReader { geometry in
                                VStack {
                                    NavigationLink(destination: FinalView().navigationBarBackButtonHidden(true)) {
                                        Image(rs.photo)
                                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
                                            .overlay(RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.white, lineWidth: 4)
                                                .frame(width: 210, height: 350, alignment: .center)
                                                .cornerRadius(16)
                                                .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 0)
                                                .opacity(0)
                                            )
                                            .shadow(radius: 16)
                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -30), axis: (x: 0, y: 1.0, z: 0))
                                            
                                    }
                                        Text(rs.detail)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .black, design: .rounded))
                                            .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
                                        Text(rs.username)
                                            .foregroundColor(.black)
                                            .font(.system(size: 10, weight: .black, design: .rounded))
                                    
                                }.frame(width: 150, alignment: .center) // 카드 크기
                            }
                        }
                        
                    }
                        .padding(.vertical, 200)
                }
                Text("스와이프를 해서 이야기를 읽어보세요!")
                    .font(.none)
                    .padding(EdgeInsets(top:-50,leading: 0,bottom: 20,trailing: 0))
                
            }
            .background(
                Image("background"))
            .edgesIgnoringSafeArea(.all)
        }
    }
    
}

struct FinalView : View {
    
    var body : some View {
        Text("This page is end page")
    }
}

struct UserList : Identifiable {
    let id : Int
    let username : String
    let photo : String
    let detail : String
//    let view : AnyView
}

//var users = [
//    UserList(id:0, username: "🌻브루니의 이야기",photo: "1",detail: "팀원들과 발표준비"),
//    UserList(id:1, username: "터피의 이야기",photo: "2",detail: "팀원들과 발표준비"),
//    UserList(id:2, username: "비니의 이야기",photo: "3",detail: "팀원들과 발표준비"),
//    UserList(id:3, username: "미야의 이야기",photo: "4",detail: "팀원들과 발표준비"),
//    UserList(id:4, username: "안나의 이야기",photo: "5",detail: "팀원들과 발표준비"),
//    UserList(id:5, username: "리앤의 이야기",photo: "6",detail: "팀원들과 발표준비"),
//]
//
var users = [
    UserList(id:0, username: "🌻브루니의 이야기",photo: "1",detail: "팀원들과 발표준비"),
    UserList(id:1, username: "터피의 이야기",photo: "2",detail: "팀원들과 발표준비"),
    UserList(id:2, username: "비니의 이야기",photo: "3",detail: "팀원들과 발표준비"),
    UserList(id:3, username: "미야의 이야기",photo: "4",detail: "팀원들과 발표준비"),
    UserList(id:4, username: "안나의 이야기",photo: "5",detail: "팀원들과 발표준비"),
    UserList(id:5, username: "리앤의 이야기",photo: "6",detail: "팀원들과 발표준비"),
]

