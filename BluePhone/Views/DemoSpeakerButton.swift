//
//  DemoSpeakerButton.swift
//  BluePhone
//
//  Created by Mariana Cantero on 7/12/24.
//

import SwiftUI
import AVFoundation

struct DemoSpeakerButton: View {
    @State private var isSpeakerOn: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        
        VStack {
            Button(action: {
                self.playSound()
            }, label: {
                Text("Play")
            })
            .padding()
            
            
            Button(action: {
                self.isSpeakerOn.toggle()
                self.toggleSpeaker(isOn: self.isSpeakerOn)
            }, label: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.largeTitle)
            }).padding()
        }.onAppear{
            self.prepareAudioPlayer()
           // self.configureAudioSession()
            
        }
    }
    
    
    func configureAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
            try audioSession.setActive(true)
        } catch {
            print("Error configuring")
        }
    }
    
    func toggleSpeaker(isOn: Bool) {
        
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            if isOn {
                try audioSession.overrideOutputAudioPort(.speaker)
                print("Speaker on")
            } else {
                try audioSession.overrideOutputAudioPort(.none)
                print("Speaker off")
            }
        } catch {
            print("Error toggle speaker")
        }
    }
    
    
    func prepareAudioPlayer() {
        guard let soundFile = NSDataAsset(name: "helpAlarm") else {
            print("Could not read file name")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer?.prepareToPlay()
            
        }catch  {
            print("Error preparing audio")
        }
    }
    
    func playSound() {
        configureAudioSession()
        audioPlayer?.play()
        print("audio is playing")
    }
    
    
}

#Preview {
    DemoSpeakerButton()
}
