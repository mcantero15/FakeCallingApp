//
//  ClockView.swift
//  BluePhone
//
//  Created by Mariana Cantero on 11/27/23.
//

import SwiftUI

struct MakeCallView: View {
    
    //    @State var callOptions: [CallOptionModel] = [CallOptionModel]() //will contain an empty array of CallOption instances
    //    var dataService = DataService()
    //
    @EnvironmentObject var callOptionViewModel : CallOptionViewModel
    
    
    var body: some View {
        List {
            ForEach(callOptionViewModel.callOptions) { option in
                OptionListRowView(option: option)
            }
            .onMove(perform: callOptionViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Make Call")
        .navigationBarItems(leading: EditButton())
        
            
            
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
