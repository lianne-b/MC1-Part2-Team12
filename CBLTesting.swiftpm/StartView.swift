//
//  StartView.swift
//  CBLTesting
//
//  Created by 정현 on 2023/03/30.
//

import SwiftUI

struct StartView: View {
    @State private var isNextViewPresented = false
    
    var body: some View {
        ZStack {
            NavigationView{
                VStack(alignment: .center, spacing: 50 ) {
                    Image("TitleA")
                    Image("TitleB")
                }
                .background(
                    Image("Background")
                        .edgesIgnoringSafeArea(.all)
                )
            }
            if isNextViewPresented {
                MenuView()
                    .transition(.opacity)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isNextViewPresented = true
                }
            }
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
