//
//  VoicemailView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI

struct ReceiveCallView: View {
    @ObservedObject var router = ReceiveCallRouter()
    
    
    @EnvironmentObject var callOptionViewModel: CallOptionViewModel
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            List {
                ForEach(callOptionViewModel.callOptions) { option in
                    
                    if option.type == "Incoming"
                    {
                        Button(action: {
                            router.navigate(to: .acceptCall(call: option))
                        }, label: {
                            OptionListRowView(option: option, phoneSymbol: "phone.arrow.down.left.fill")
                                .contentShape(Rectangle())
                        })
                        .listRowInsets(.init(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    
                }.onMove(perform: callOptionViewModel.moveItem)
                
                
                
            }.navigationTitle("Receive Call")
                .listStyle(PlainListStyle())
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
                
                .navigationDestination(for: ReceiveCallRouter.Destination.self) { destination in
                            switch destination {
                            case .acceptCall(let call):
                                AcceptCallView(call: call)
                            case .callingSession(let call):
                                CallingSessionView(action: endCall, iscalling: false, call: call)
                        
                            }
                        }
                
        }.environmentObject(router)
    }
    
    
    func endCall() {
        router.navigateToRoot()
    }
    
}

struct ReceiveCallView_Previews: PreviewProvider {
    static var previews: some View {
        ReceiveCallView()
            .environmentObject(CallOptionViewModel())
    }
}

//navigation structure
//show recording options 1.
//ring and receiving a call view 2.
//aceept call and show calling session view 3.
//end call returns to recording options screen
