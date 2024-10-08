//
//  CallingSessionView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 3/7/24.
//
//This view needs to be connected to two routers so that when the end button is pressed, the routers return to their root which would be the initial tab view 
//
//
import Contacts
import ContactsUI
import SwiftUI
import AVFAudio

struct CallingSessionView: View {
    @EnvironmentObject var router: ReceiveCallRouter
    
    
//    @Environment(\.presentationMode) var presentationMode
    //@Environment(\.dismiss) var dismiss
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isContactViewPresented = false
//    @State private var isContactPickerPresented = false
//    @State private var selectedContact: CNContact?
    var action: () -> Void
    
    var iscalling: Bool
    
    let call : CallOptionModel
    
    var body: some View {
//        NavigationStack {
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
                            Text("calling mobile...")
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
                    
                    Grid(alignment: .center, horizontalSpacing: 30, verticalSpacing: 10) {
                        GridRow{
                            SessionButtonView(caption: "Speaker", symbol: "speaker.wave.3.fill", buttonColor: .systemGray2)
                            SessionButtonView(caption: "FaceTime", symbol: "questionmark.video.fill", buttonColor: .systemGray2)
                            Button {
                                print("this button works")
                                playSound(soundName: "helpAlarm")
                               
                            } label: {
                                SessionButtonView(caption: "Alarm", symbol: "speaker.badge.exclamationmark.fill", buttonColor: .systemGray2)
                            }
                            
                        }
                        
                        GridRow{
                            Button {
                                isContactViewPresented = true
                                //isContactPickerPresented = true
                            } label: {
                                SessionButtonView(caption: "Contacts", symbol: "person.circle.fill", buttonColor: .systemGray2)
                            }
                            EndButtonView().environment(\.endAction, action)
//                            Button(action: {
//                                endCallButtonPressed()
//                            }, label: {
//                                SessionButtonView(caption: "End", symbol: "phone.down.fill", buttonColor: .blue)
//                            })
                            
                            
                            Button(action: {
                                let number = ""
                                let message = "This is a test message "
                                
                                let sms : String = "sms:\(number)&body=\(message)"
                                let strURL : String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                                UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
//                                if let url = URL(string: "sms://\(number)&body=\(message)") {
//                                    if UIApplication.shared.canOpenURL(url) {
//                                        UIApplication.shared.open(url)
//                                    }
//                                }
                                
                            }, label: {
                                SessionButtonView(caption: "Message", symbol: "message.fill", buttonColor: .systemGray2)
                            })
                        }
                    }
                     .padding()
                }
                .padding(.horizontal)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .tabBar)
            .sheet(isPresented: $isContactViewPresented, content: {
                ContactsView()
            })
            .onAppear{
                
                
               //play the voice recording
                playSound(soundName: call.fileName)
                
                
                
                
            }

    }
    
    func endCallButtonPressed() {
        router.navigateToRoot()
        //dismiss()
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



#Preview {
    
    
    CallingSessionView(action: {}, iscalling: true, call: CallOptionModel(type: "Outgoing", name: "Ask for a ride", fileName: "Rec 1", duration: "0:00", callerName: "Amy"))

}
