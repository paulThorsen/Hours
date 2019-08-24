//
//  CompletedModal.swift
//  Hours
//
//  Created by Paul Thorsen on 7/16/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct CompletedModal : View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var isPresented
    @State var showingDeleteAlert = false
    @State var showingCompletedAlert = false
    @State var toDo: ToDoEvent
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("cellWhite"))
//                    .frame(height: 60)
                Text(toDo.eventTitle)
//                    .font(.system(size: 20))
                    .foregroundColor(Color("textGray"))
            }
            HorizontalDivider(borderColor: Color("borderGray"))
            HStack {
                Text(self.toDo.notes)
            }
            .padding()
//            Spacer().frame(height: 100)
            
            HorizontalDivider(borderColor: Color("borderGray"))
//            VStack {
////                HorizontalDivider(borderColor: Color("borderGray"))
////                Button(action: {showingCompletedAlert = true}) {
////                    ZStack {
////                        Rectangle()
////                            .foregroundColor(Color("cellWhite"))
////                        Text("Mark as Incomplete")
//////                            .foregroundColor(Color("textGray"))
////                    }
////                }
//                .ActionSheet(self.$showingCompletedAlert) {
//                    Alert(title: Text("Mark \"" + self.toDo.eventTitle + "\" as incomplete?"), primaryButton: .destructive(Text("Confirm"), onTrigger: {
//                        self.toDo.isCompleted = false;
//                        self.isPresented?.value = false
//                    }), secondaryButton: .cancel())
//                    
//                }
//                HorizontalDivider(borderColor: Color("borderGray"))
//                Button(action: {self.showingDeleteAlert = true}) {
//                    ZStack {
//                        Rectangle()
//                            .foregroundColor(Color("cellWhite"))
//                            .accentColor(.black)
//                        Text("Delete")
//                            .foregroundColor(Color("red"))
//
//                    }
//                }
//                .ActionSheet(self.$showingDeleteAlert) {
//                    Alert(title: Text("Delete \"" + self.toDo.eventTitle + "\"?"), message: Text("This can't be undone"), primaryButton: .destructive(Text("Delete"), onTrigger: {
//                            self.userData.removeToDo(id: self.toDo.uuid);
//                            self.isPresented?.value = false;
//                    }), secondaryButton: .cancel())
//                    
//                }
//                HorizontalDivider(borderColor: Color("borderGray"))
//                
//            }
            Spacer()
        }
    }
}

#if DEBUG
struct CompletedModal_Previews : PreviewProvider {
    static var previews: some View {
        CompletedModal(toDo: ToDoEvent())
            .environmentObject(UserData())
    }
}
#endif
