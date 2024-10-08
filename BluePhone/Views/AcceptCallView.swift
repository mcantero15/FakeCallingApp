//
//  AcceptCallView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 5/24/24.
//

import SwiftUI
import AVFAudio

struct AcceptCallView: View {
    @EnvironmentObject var router: ReceiveCallRouter
    @State private var audioPlayer: AVAudioPlayer!
    @State var playsound : Bool = true
    let call : CallOptionModel
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGray)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image(systemName: "person.circle.fill")
                        .foregroundColor(Color(UIColor.systemGray3))
                        .font(.system(size: 50))
                        .bold()
                    VStack(alignment: .leading) {
                        Text("home")
                            .foregroundColor(Color(UIColor.systemGray3))
                            .font(.headline)
                            .bold()
                        
                        Text(call.callerName)
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .bold()
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                
                HStack {
                    Button(action: {
                        playsound = false
                        router.navigateBack()
                    }, label: {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Color(UIColor.red))
                                    .frame(width: 80, height: 80)
                                Image(systemName: "phone.down.fill")
                                    .font(.title)
                                    .foregroundStyle(Color.white)
                            }
                            Text("Decline")
                                .foregroundStyle(Color.white)
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        playsound = false
                        router.navigate(to: .callingSession(call: call))
                    }, label: {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(Color(UIColor.blue))
                                    .frame(width: 80, height: 80)
                                Image(systemName: "phone.fill")
                                    .font(.title)
                                    .foregroundStyle(Color.white)
                            }
                            Text("Accept")
                                .foregroundStyle(Color.white)
                        }
                    })
                }
                .padding()
                
            }
            .padding(.horizontal)
            
        }.navigationBarBackButtonHidden(true)
        .toolbar(.hidden,for: .tabBar)
        .onAppear{
        
                playSound(soundName: "Ringtone")
            
        }
        .onDisappear{
            playSound(soundName: "Ringtone")
        }
        
    }
    
    
    
    
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("Could not read file name")
            return
        }
        do
        {
            if playsound{
                audioPlayer = try AVAudioPlayer(data: soundFile.data)
                audioPlayer.play()
            }
            else {
                audioPlayer.pause()
            }
        } catch {
            print("Error")
        }
    }
    
    
    
    
    
}

//add ringtone on appear, and should disappear when user accepts call


#Preview {
    AcceptCallView(call: CallOptionModel(type: "Outgoing", name: "Ask for a ride", fileName: "Rec 1", duration: "0:00", callerName: "Amy"))
}
