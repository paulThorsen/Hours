//
//  ToDoEditModal.swift
//  Hours
//
//  Created by Paul Thorsen on 7/6/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct ToDoEditModal : View {
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) var presentationMode
    @State var showingDeleteAlert = false
    @State var showingCompleteAlert = false
    @State var toDo: ToDoEvent
    
    var toDoIndex: Int {
        userData.toDoEvents.firstIndex(where: { $0.id == toDo.id })!
    }
    
    var body: some View {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(toDo.color))
                        .frame(height: 60)
                    TextField("Title", text: $toDo.eventTitle)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .truncationMode(.tail)
                }
                HorizontalDivider(borderColor: Color("borderGray"))
                HStack {
                    TextField("Notes", text: $toDo.notes)
                        .multilineTextAlignment(.leading)
                        .lineLimit(40)
                }
                .padding()
                Spacer().frame(height: 100)
                
                HorizontalDivider(borderColor: Color("borderGray"))
                VStack {
                    HStack {
                        Text("Color")
                            .frame(alignment: .topLeading)
                            .padding()
                        Spacer()
                    }
                    ColorSelection(toDo: $toDo)
                        .padding(.bottom)
                }
                VStack(spacing: 0) {
                    HorizontalDivider(borderColor: Color("borderGray"))
                    Button (action: {self.showingCompleteAlert = true}) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("cellWhite"))
                            Text("Mark as Complete")
                                .foregroundColor(Color("textGray"))
                        }
                    }
                    .actionSheet(isPresented: $showingCompleteAlert) {
                        ActionSheet(title: Text("Mark \"" + self.toDo.eventTitle + "\" as complete?"), message: Text("Great job!"), buttons: [
                            .default(Text("Complete")) {
                                self.userData.toDoEvents[self.toDoIndex].isCompleted = true
                                self.presentationMode.wrappedValue.dismiss()
                            },
                            .destructive(Text("Cancel"))])
                    }
                    HorizontalDivider(borderColor: Color("borderGray"))
                    Button (action: {self.showingDeleteAlert = true}) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("cellWhite"))
                                .accentColor(.black)
                            Text("Delete")
                                .foregroundColor(Color("red"))
                                .padding()
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
struct ToDoEditModal_Previews : PreviewProvider {
    static var previews: some View {
        ToDoEditModal(toDo: ToDoEvent())
            .environmentObject(UserData())
            
    }
}
#endif
