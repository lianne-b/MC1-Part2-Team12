//import SwiftUI
//import AVFoundation
//
//
//struct ContentView: View {
//
//    @State var audioPlayer: AVAudioPlayer?
//    @Environment(\.presentationMode) var presentationMode
//
//    var body: some View {
//        NavigationView {
//            VStack(){
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(alignment: .center, spacing: 150) {
//                        ForEach(0..<6) {rs in
//                            GeometryReader { geometry in
//                                VStack {
//                                    /* 비니의 일기 */
//                                    NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[0])
//                                        .navigationBarBackButtonHidden(true)) {
//                                            Text("biny")
//                                                .font(.title)
//                                            Image(DiaryViewModel.shared.memberData[0].mimoji)
//                                                .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
//                                                .overlay(RoundedRectangle(cornerRadius: 10)
//                                                    .stroke(Color.white, lineWidth: 4)
//                                                    .frame(width: 210, height: 350, alignment: .center)
//                                                    .cornerRadius(16)
//                                                    .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 0)
//                                                    .opacity(0)
//                                                )
//                                                .shadow(radius: 16)
//                                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -30), axis: (x: 0, y: 1.0, z: 0))
//                                        }
//                                    Text(DiaryViewModel.shared.memberData[0].mimojiText)
//                                        .foregroundColor(.black)
//                                        .font(.system(size: 20, weight: .black, design: .rounded))
//                                        .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
//                                    Text(DiaryViewModel.shared.memberData[0].memberName)
//                                        .foregroundColor(.black)
//                                        .font(.system(size: 10, weight: .black, design: .rounded))
//                                }.frame(width: 150, alignment: .center)
//
//                                                            VStack {
//                                                                /* 터피의 일기 */
//                                                                NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[1])
//                                                                    .navigationBarBackButtonHidden(true)) {
//                                                                        Text("toughie")
//                                                                            .font(.title)
//                                                                        Image(DiaryViewModel.shared.memberData[1].mimoji)
//                                                                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
//                                                                            .overlay(RoundedRectangle(cornerRadius: 10)
//                                                                                .stroke(Color.white, lineWidth: 4)
//                                                                                .frame(width: 210, height: 350, alignment: .center)
//                                                                                .cornerRadius(16)
//                                                                                .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 0)
//                                                                                .opacity(0)
//                                                                            )
//                                                                            .shadow(radius: 16)
//                                                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -30), axis: (x: 0, y: 1.0, z: 0))
//                                                                    }
//                                                                Text(DiaryViewModel.shared.memberData[0].mimojiText)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 20, weight: .black, design: .rounded))
//                                                                    .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
//                                                                Text(DiaryViewModel.shared.memberData[0].memberName)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 10, weight: .black, design: .rounded))
//
//                                                            }.frame(width: 210, alignment: .center)
//
//
//                                                            VStack {
//                                                                /* 리앤의 일기 */
//                                                                NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[2])
//                                                                    .navigationBarBackButtonHidden(true)) {
//                                                                        Text("lianne")
//                                                                            .font(.title)
//                                                                        Image(DiaryViewModel.shared.memberData[2].mimoji)
//                                                                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
//                                                                            .overlay(RoundedRectangle(cornerRadius: 10)
//                                                                                .stroke(Color.white, lineWidth: 4)
//                                                                                .frame(width: 210, height: 350, alignment: .center)
//                                                                                .cornerRadius(16)
//                                                                                .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 0)
//                                                                                .opacity(0)
//                                                                            )
//                                                                            .shadow(radius: 16)
//                                                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -30), axis: (x: 0, y: 1.0, z: 0))
//
//                                                                    }
//                                                                Text(DiaryViewModel.shared.memberData[0].mimojiText)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 20, weight: .black, design: .rounded))
//                                                                    .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
//                                                                Text(DiaryViewModel.shared.memberData[0].memberName)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 10, weight: .black, design: .rounded))
//
//
//                                                            }.frame(width: 210, alignment: .center)
//
//
//                                                            VStack {
//                                                                /* 미야의 일기 */
//                                                                NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[3])
//                                                                    .navigationBarBackButtonHidden(true)) {
//                                                                        Text("miya")
//                                                                            .font(.title)
//                                                                        Image(DiaryViewModel.shared.memberData[3].mimoji)
//                                                                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
//                                                                            .overlay(RoundedRectangle(cornerRadius: 10)
//                                                                                .stroke(Color.white, lineWidth: 4)
//                                                                                .frame(width: 210, height: 350, alignment: .center)
//                                                                                .cornerRadius(16)
//                                                                                .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 0)
//                                                                                .opacity(0)
//                                                                            )
//                                                                            .shadow(radius: 16)
//                                                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -30), axis: (x: 0, y: 1.0, z: 0))
//                                                                    }
//                                                                Text(DiaryViewModel.shared.memberData[0].mimojiText)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 20, weight: .black, design: .rounded))
//                                                                    .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
//                                                                Text(DiaryViewModel.shared.memberData[0].memberName)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 10, weight: .black, design: .rounded))
//                                                            }.frame(width: 210, alignment: .center)
//
//
//                                                            VStack {
//                                                                /* 안나의 일기 */
//                                                                NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[4])
//                                                                    .navigationBarBackButtonHidden(true)) {
//                                                                        Text("anna")
//                                                                            .font(.title)
//                                                                        Image(DiaryViewModel.shared.memberData[4].mimoji)
//                                                                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
//                                                                            .overlay(RoundedRectangle(cornerRadius: 10)
//                                                                                .stroke(Color.white, lineWidth: 4)
//                                                                                .frame(width: 210, height: 350, alignment: .center)
//                                                                                .cornerRadius(16)
//                                                                                .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 0)
//                                                                                .opacity(0)
//                                                                            )
//                                                                            .shadow(radius: 16)
//                                                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -30), axis: (x: 0, y: 1.0, z: 0))
//                                                                    }
//                                                                Text(DiaryViewModel.shared.memberData[0].mimojiText)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 20, weight: .black, design: .rounded))
//                                                                    .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
//                                                                Text(DiaryViewModel.shared.memberData[0].memberName)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 10, weight: .black, design: .rounded))
//
//                                                            }.frame(width: 210, alignment: .center)
//
//
//                                                            VStack {
//
//                                                                /* 브루니의 일기 */
//                                                                NavigationLink(destination:  DiaryDetailView(diaryData: DiaryViewModel.shared.memberData[5])
//                                                                    .navigationBarBackButtonHidden(true)) {
//                                                                        Text("bruny")
//                                                                            .font(.title)
//                                                                        Image(DiaryViewModel.shared.memberData[5].mimoji)
//                                                                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
//                                                                            .overlay(RoundedRectangle(cornerRadius: 10)
//                                                                                .stroke(Color.white, lineWidth: 4)
//                                                                                .frame(width: 210, height: 350, alignment: .center)
//                                                                                .cornerRadius(16)
//                                                                                .shadow(color: Color.gray.opacity(0.2), radius: 20, x: 0, y: 0)
//                                                                                .opacity(0)
//                                                                            )
//                                                                            .shadow(radius: 16)
//                                                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 210) / -30), axis: (x: 0, y: 1.0, z: 0))
//                                                                    }
//                                                                Text(DiaryViewModel.shared.memberData[0].mimojiText)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 20, weight: .black, design: .rounded))
//                                                                    .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
//                                                                Text(DiaryViewModel.shared.memberData[0].memberName)
//                                                                    .foregroundColor(.black)
//                                                                    .font(.system(size: 10, weight: .black, design: .rounded))
//
//                                                            }.frame(width: 210, alignment: .center)
//                            }
//                        }.padding(.horizontal, 210)
//                    }
//                }
//
//                .onDisappear {
//                    audioPlayer?.stop()
//                    print("음악이 끊겨야됨")
//                }
//
//            }
//
//            .onAppear {
//                guard let soundPath = Bundle.main.path(forResource: "실수", ofType: "mp3") else { return }
//                let url = URL(fileURLWithPath: soundPath)
//
//                do {
//                    // Initialize audio player
//                    audioPlayer = try AVAudioPlayer(contentsOf: url)
//
//                    // Play audio
//                    audioPlayer?.play()
//                    print("Music started playing.")
//                } catch {
//                    print("Error playing music: \(error.localizedDescription)")
//                }
//            }
//
//
//        }
//    }
//}


import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center, spacing: 90) {
                ForEach(0..<6) {index in
                    VStack {
                        Image(DiaryViewModel.shared.memberData[index].mimoji)
                            .resizable().frame(width: 210, height: 350, alignment: .center).cornerRadius(16)
                            .shadow(radius: 16)
                        
                        Text(DiaryViewModel.shared.memberData[index].mimojiText)
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .black, design: .rounded))
                            .padding(EdgeInsets(top:-20,leading: 0,bottom: 20,trailing: 0))
                        Text(DiaryViewModel.shared.memberData[index].memberName)
                            .foregroundColor(.black)
                            .font(.system(size: 10, weight: .black, design: .rounded))
                    }.frame(width:150,alignment: .center)
                    
                }
            }.padding(.vertical,200)
        }
        
        .onDisappear {
            audioPlayer?.stop()
            print("음악이 끊겨야됨")
        }
    
        
        
        .onAppear {
            guard let soundPath = Bundle.main.path(forResource: "실수", ofType: "mp3") else { return }
            let url = URL(fileURLWithPath: soundPath)
            
            do {
                // Initialize audio player
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                
                // Play audio
                audioPlayer?.play()
                print("Music started playing.")
            } catch {
                print("Error playing music: \(error.localizedDescription)")
            }
        }
        
    }
}

