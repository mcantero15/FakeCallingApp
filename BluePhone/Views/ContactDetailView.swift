//
//  ContactDetailView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 4/25/24.
//

import SwiftUI

struct ContactDetailView: View {
    var contact: ContactModel
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: "person.circle.fill").foregroundStyle(Color(UIColor.systemGray)).font(.system(size: 120))
            Text("\(contact.firstname ?? "") \(contact.lastname ?? "")").font(.largeTitle).foregroundColor(Color.white).multilineTextAlignment(.center).padding(.horizontal)
            HStack {
                Spacer()
                Menu {
                    ForEach(contact.phonenumbers ?? [], id: \.self) { contactNum in
                        Button(action: {
                            message(number: contactNum.value.stringValue)
                        }, label: {
                            Text(contactNum.value.stringValue)
                        })
                    }
                    
                } label:
                {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).fill(.gray)
                            .frame(width: 75.0, height: 60.0)
                        VStack(spacing: 5.0) {
                            Image(systemName: "message.fill").font(.title2).foregroundStyle(.white)
                            Text("message").foregroundStyle(.white).font(.caption).bold()
                        }
                    }
                }.menuStyle(ButtonMenuStyle())
                
                
                
//                Button(action: {
//                    
//                }, label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 10).fill(.gray)
//                            .frame(width: 75.0, height: 60.0)
//                        VStack(spacing: 5.0) {
//                            Image(systemName: "message.fill").font(.title2).foregroundStyle(.white)
//                            Text("message").foregroundStyle(.white).font(.caption).bold()
//                        }
//                    }
//                            })
                Menu {
                    ForEach(contact.phonenumbers ?? [], id: \.self) { contactNum in
                        Button(action: {
                            call(number: contactNum.value.stringValue)
                        }, label: {
                            Text(contactNum.value.stringValue)
                        })
                    }
                    
                } label:
                {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).fill(.gray)
                            .frame(width: 75.0, height: 60.0)
                        VStack(spacing: 5.0){
                            Image(systemName: "phone.fill").font(.title2).foregroundStyle(.white)
                            Text("mobile").foregroundStyle(.white).font(.caption).bold()
                        }
                    }
                }.menuStyle(ButtonMenuStyle())
//                Button(action: {
//                    //let phonenumbers = contact.phonenumbers ?? []
//                    //let number = phonenumbers.first?.value
//                    let phoneNumber : String = "1-609-783-3559"
//                    let url = URL(string: "tel:\(phoneNumber)")
//                    if UIApplication.shared.canOpenURL(url!) {
//                        UIApplication.shared.open(url!, options: [:], completionHandler: nil)
//                    }
//                }, label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 10).fill(.gray)
//                            .frame(width: 75.0, height: 60.0)
//                        VStack(spacing: 5.0){
//                            Image(systemName: "phone.fill").font(.title2).foregroundStyle(.white)
//                            Text("mobile").foregroundStyle(.white).font(.caption).bold()
//                        }
//                    }
//                            })
                Menu {
                    ForEach(contact.phonenumbers ?? [], id: \.self) { contactNum in
                        Button(action: {
                            faceTime(number: contactNum.value.stringValue)
                        }, label: {
                            Text(contactNum.value.stringValue)
                        })
                    }
                    
                } label: 
                {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).fill(.gray)
                            .frame(width: 75.0, height: 60.0)
                        VStack(spacing: 5.0){
                            Image(systemName: "video.fill").font(.title2).foregroundStyle(.white)
                            Text("FaceTime").foregroundStyle(.white).font(.caption).bold()
                        }
                    }
                }
//                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//                    ZStack{
//                        RoundedRectangle(cornerRadius: 10).fill(.gray)
//                            .frame(width: 75.0, height: 60.0)
//                        VStack(spacing: 5.0){
//                            Image(systemName: "video.fill").font(.title2).foregroundStyle(.white)
//                            Text("FaceTime").foregroundStyle(.white).font(.caption).bold()
//                        }
//                    }
//                            })
                Spacer()

            }
            Spacer()
            Spacer()
        }.toolbar(.hidden, for: .tabBar)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
            Rectangle()
                .fill(Color(UIColor.systemGray2).gradient)
                .ignoresSafeArea()
        }
        
    }
    
    
    func message(number: String){
        let phoneNumber = number
        let message = "This is a test message "
        
        let sms : String = "sms:\(phoneNumber)&body=\(message)"
        let strURL : String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
    
    func call(number: String) {
        let url = URL(string: "tel:\(number)")
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
    }
    
    func faceTime(number: String){
        let url = URL(string: "facetime://\(number)")
        if UIApplication.shared.canOpenURL(url!)
        {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        }
        
    }
    
}

#Preview {
    ContactDetailView(contact: ContactModel(firstname: "Brother From the Same Mother 👨‍👩‍👧", lastname: nil))
}
