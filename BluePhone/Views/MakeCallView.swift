//
//  ClockView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI
import AVFAudio

struct MakeCallView: View {
    @ObservedObject var router = MakeCallRouter()
    //    @State var callOptions: [CallOptionModel] = [CallOptionModel]() //will contain an empty array of CallOption instances
    //    var dataService = DataService()
    //
    @EnvironmentObject var callOptionViewModel : CallOptionViewModel
    
//    @State private var selectedItem: CallOptionModel?
//    @State private var isNavigationActiv	e = false
    
    //@State private var path = NavigationPath()
    //@State private var animate: Bool = false
    @State private var audioPlayer: AVAudioPlayer!
    
    //@StateObject var audioPlayerViewModel = AudioPlayerViewModel(soundName: "outgoingCall", soundType: "mp3")
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
        List {
            ForEach(callOptionViewModel.callOptions) { option in
                if option.type == "Outgoing"
                {
                    Button(action: {
                        router.navigate(to: .callingSession(call: option))
                        //                    selectedItem = option
                        //                    isNavigationActive = true
                        print("this button works")
                        
                        //playSound(soundName: "outgoingCall")
                    }, label: {
                        OptionListRowView(option: option, phoneSymbol: "phone.arrow.up.right.fill")
                            .contentShape(Rectangle())
                        
                    })
                    .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                    //                .listRowInsets(.init(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)))
                    .buttonStyle(PlainButtonStyle())
                    
                    
                }
                
            }
            .onMove(perform: callOptionViewModel.moveItem)
            
//            .onTapGesture {
//                animate.toggle()
//            }
        }
        
        .listStyle(PlainListStyle())
        .navigationTitle("Make Call")
        //.padding()
        .navigationBarItems(leading: EditButton())
        .navigationDestination(for: MakeCallRouter.Destination.self) { destination in
            switch destination {
            case .callingSession(let call):
                CallingSessionView(action: endCall, iscalling: true, call: call)
                    //.onAppear(perform: audioPlayerViewModel.playOrPause)
                    //.onDisappear(perform: audioPlayerViewModel.playOrPause)
            }
        }
//        .navigationDestination(for: CallOptionModel.self) { option in
//            CallingSessionView(call: option)
////                .onAppear(perform: {
////                    let soundName = "outgoingCall"
////                    guard let soundFile = NSDataAsset(name: soundName) else {
////                        print("Could not read file name")
////                        return
////                    }
////                    do {
////                        audioPlayer = try AVAudioPlayer(data: soundFile.data)
////                        audioPlayer.play()
////                    } catch {
////                        print("Error")
////                    }
////                    
////                })
//                
//        }
            
            
//        .navigationDestination(isPresented: $isNavigationActive, destination: {
//            CallingSessionView(call: selectedItem ?? CallOptionModel(name: "", duration: "", callerName: ""))
//        })
            
            
        //.background(
        
//            NavigationLink(destination: CallingSessionView(call: selectedItem ?? CallOptionModel(name: "", duration: "", callerName: "")), isActive: $isNavigationActive ) {
//                EmptyView()
//            }
//                .hidden()
        //)
//        .animation(.easeInOut, value: animate)
    }
        
}
    
    
    //
            //        VStack {
            //            HStack {
            //                Text("Recents")
            //                    .font(.largeTitle)
            //                    .bold()
            //
            //                Spacer()
            //            } .padding()
            //        List(callOptions) { option in
            //
            //            OptionListRow(option: option)
            //
            //        }
            //        .padding()
            //        .listStyle(.plain)
            //        .onAppear {
            //            callOptions = dataService.getData()
            //        }
            //        }
    
    
    func endCall() {
        router.navigateToRoot()
    }
    
    
            
    func playSound(soundName : String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read file name")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()
        } catch {
            print("Error")
        }
    }
    
    
}






struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
            NavigationView {
                MakeCallView()
            }
            .environmentObject(CallOptionViewModel())
    }
}
