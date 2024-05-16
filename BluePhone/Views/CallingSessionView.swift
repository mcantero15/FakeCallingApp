//
//  CallingSessionView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 3/7/24.
//
import Contacts
import ContactsUI
import SwiftUI
import AVFAudio

struct CallingSessionView: View {
    
//    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @State private var audioPlayer: AVAudioPlayer!
    @State private var isContactPickerPresented = false
    @State private var selectedContact: CNContact?
    
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
                            
                            Text("Amy")
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
                                isContactPickerPresented = true
                            } label: {
                                SessionButtonView(caption: "Contacts", symbol: "person.circle.fill", buttonColor: .systemGray2)
                            }
                            
                            Button(action: {
                                endCallButtonPressed()
                            }, label: {
                                SessionButtonView(caption: "End", symbol: "phone.down.fill", buttonColor: .blue)
                            })
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
            .sheet(isPresented: $isContactPickerPresented) {
                ContactsPicker(selectedContact: $selectedContact)
            }
    }
    
    func endCallButtonPressed() {
        dismiss()
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

struct ContactsPicker: UIViewControllerRepresentable {
    
//    typealias UIViewControllerType = CNContactPickerViewController
    
    @Binding var selectedContact: CNContact?
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = context.coordinator
        return contactPicker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedContact: $selectedContact)
    }
    class Coordinator: NSObject, CNContactPickerDelegate {
        @Binding var selectedContact: CNContact?
        
        init(selectedContact: Binding<CNContact?>) {
            _selectedContact = selectedContact
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            selectedContact = contact
        }
    }
    
}

#Preview {
            CallingSessionView(call: CallOptionModel(name: "Rec 1", duration: "0:00", callerName: "today"))

}
