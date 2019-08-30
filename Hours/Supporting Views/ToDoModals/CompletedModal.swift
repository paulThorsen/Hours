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
    @Environment(\.presentationMode) var presentationMode
    @State var showingDeleteAlert = false
    @State var showingCompletedAlert = false
    @State var toDo: ToDoEvent
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("cellWhite"))
                    .frame(height: 60)
                Text(toDo.eventTitle)
                    .font(.system(size: 20))
                    .foregroundColor(Color("textGray"))
            }
            HorizontalDivider(borderColor: Color("borderGray"))
            HStack {
                Text(self.toDo.notes)
            }
            .padding()
            Spacer().frame(height: 100)
            
            HorizontalDivider(borderColor: Color("borderGray"))
            VStack {
                HorizontalDivider(borderColor: Color("borderGray"))
                Button(action: { self.showingCompletedAlert = true}) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("cellWhite"))
                        Text("Mark as Incomplete")
                            .foregroundColor(Color("textGray"))
                    }
                }
                .actionSheet(isPresented: $showingCompletedAlert) {
                    ActionSheet(title: Text("Mark \"" + self.toDo.eventTitle + "\" as incomplete?"), message: Text("You can always complete it later on."), buttons: [
                        .default(Text("Confirm")) {
                            self.toDo.isCompleted = false
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        .destructive(Text("Cancel"))])
                }
                HorizontalDivider(borderColor: Color("borderGray"))
                Button(action: {self.showingDeleteAlert = true}) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("cellWhite"))
                            .accentColor(.black)
                        Text("Delete")
                            .foregroundColor(Color("red"))

                    }
                }
                .actionSheet(isPresented: $showingDeleteAlert) {
                    ActionSheet(title: Text("Delete \"" + self.toDo.eventTitle + "\"?"), message: Text("This can't be undone"), buttons: [
                        .destructive(Text("Delete")) {
                            self.userData.removeToDo(id: self.toDo.id)
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        .default(Text("Cancel"))])
                }
                HorizontalDivider(borderColor: Color("borderGray"))
            }
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
