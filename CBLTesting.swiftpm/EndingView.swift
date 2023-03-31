//
//  EndingView.swift
//  CBLTesting
//
//  Created by Ye Eun Choi on 2023/03/30.
//

import SwiftUI

struct EndingView: View {
    
    @State var ImageOpacity: Double = 0.0
    
    var body: some View {
        VStack {
            
            NavigationLink {
                WrapUpView()
            } label: {
                Image("EndingViewImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden()
            }

        }
        
        
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
