//
//  AlarmView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI
import AVFAudio

struct AlarmView: View {
    
    @State private var isPlaying = false
    @State private var audioPlayer: AVAudioPlayer!
    
    
    
    var body: some View {
        //var isplaying = false
                            
            HStack {
                
                
                Button(action: {
                    if isPlaying {
                        audioPlayer.pause()
                    }
                    else {
                        
                        let soundName = "helpAlarm"
                        guard let soundFile = NSDataAsset(name: soundName ) else  {
                            print("Could not read file name")
                            return  
                        }
                        
                        do {
                            audioPlayer = try AVAudioPlayer(data: soundFile.data)
                        } catch {
                            print("Error")
                        }
                        audioPlayer.play()
                    }
                    
                    
                    isPlaying.toggle()
                }, label: {
                    Text("ALARM")
                }).buttonStyle(AlarmButtonStyle(isplaying: isPlaying))
            }
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button(action: {
//                        router.navigate(to: .settingsView(settings: EmergencyContactModel(emergencyContact: "000")))
//                    }, label: {
//                        Image(systemName: "gear")
//                            .foregroundStyle(.blue
//                            )
//                    })
//                }
//        }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            
                                                                                                           
        
        
//        Button(action: {
//            
//            if isPlaying {
//                audioPlayer.pause()
//            }
//            else {
//                let soundName = "helpAlarm"
//                guard let soundFile = NSDataAsset(name: soundName ) else  {
//                    print("Could not read file name")
//                    return
//                }
//                
//                do {
//                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
//                } catch {
//                    print("Error")
//                }
//                audioPlayer.play()
//            }
//            
//            
//            isPlaying.toggle()
//        }, label: {
//            if isPlaying{
//                AlarmButtonPressedView()
//            }
//            else {
//                AlarmButtonView()
//            }
//            
//        }
//        )
        
        
    }
    
    
//    func playPauseSound(soundName: String) {
//        
//        var isPlaying = false
//        
//        if isPlaying {
//            player.pause()
//        }
//        
//        guard let soundFile = NSDataAsset(name: soundName ) else  {
//            print("Could not read file name")
//            return
//        }
//        
//        do {
//            audioPlayer = try AVAudioPlayer(data: soundFile.data)
//        } catch {
//            print("Error")
//        }
//        
//        
//        if !audioPlayer.isPlaying {
//            print("Playing")
//            audioPlayer.play()
//            
//        } else {
//            print("Pausing")
//            audioPlayer.pause()
//        }
//       
//        
//        
//        
//    }
    
    
    //not ringing play
    //ringing pause
    
}


struct AlarmButtonStyle: ButtonStyle {
    var isplaying: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            Circle().fill(Color("AlarmButton").shadow(.drop(color: .black, radius: isplaying ? 0 : 1, x: -2, y: isplaying ? 9 : 13)))
                .frame(width: 300, height: isplaying ? 280 : 300)
                .opacity(isplaying ? 0.94 : 1)
            configuration.label.bold()
                .offset(y: isplaying ? 1.5 : 0)
                .foregroundStyle(Color("AlarmFont")).font(.system(size: 50))
            
//            Circle()
//                .frame(width: 300, height: isplaying ? 296 : 300)
//                .foregroundStyle(Color.black)
//                .offset(y : isplaying ? 0.2 : 3)
//            configuration.label.bold()
//                .offset(y: configuration.isPressed ? -0.5 : 0)
//                .foregroundStyle(Color("AlarmFont"))
//                .font(.system(size: 50))
//                .frame(width: 295, height: 290)
//                .background(Color("AlarmButton"), in: .circle)
////                .overlay {
////                    Circle().stroke(lineWidth: 2)
////                        .foregroundStyle(.gray)
////                }
                
        }
        
        .animation(.linear(duration: 0.2), value: isplaying)
    }
    
    
}


struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
