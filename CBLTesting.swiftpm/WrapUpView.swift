//
//  WrapUpView.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/31.
//

import SwiftUI


struct WrapUpView: View {

    
    var body: some View {
        //        @State var audioPlayer: AVAudioPlayer?
        VStack {
            Image("WrapUpImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden()
        }
    }
}

struct WrapUpView_Previews: PreviewProvider {
    static var previews: some View {
        WrapUpView()
    }
}
