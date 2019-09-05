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
    @Binding var toDo: ToDoEvent
    
    var toDoIndex: Int {
        userData.toDoEvents.firstIndex(where: { $0.id == toDo.id })!
    }
    
    var body: some View {
        ZStack {
            Color("bg")
            .edgesIgnoringSafeArea(.all)
        
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
                
                ZStack {
                    Color("cellWhite")
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack {
                            TextField("Notes", text: $toDo.notes)
                                .multilineTextAlignment(.leading)
                                .lineLimit(40)
                        }
                        .padding()
                        Spacer()
                    }
                }
                .frame(height: 200)
                
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
                .background(Color("cellWhite"))
                HorizontalDivider(borderColor: Color("borderGray"))
//                Rectangle().foregroundColor(Color("borderGray")).frame(height: 40)
                Spacer().frame(height: 50)
                VStack(spacing: 0) {
                    HorizontalDivider(borderColor: Color("borderGray"))
                    Button (action: {self.showingCompleteAlert = true}) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("cellWhite"))
                            Text("Mark as Complete")
                                .foregroundColor(Color("textGray"))
                        }
                        .frame(height: 60)
                    }
                    .actionSheet(isPresented: $showingCompleteAlert) {
                        ActionSheet(title: Text("Mark \"" + self.toDo.eventTitle + "\" as complete?"), message: Text("Great job!"), buttons: [
                            .default(Text("Complete")) {
                                self.presentationMode.wrappedValue.dismiss()
                                self.userData.markAsComplete(id: self.toDo.id)
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
                        .frame(height: 60)
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
}

#if DEBUG
struct ToDoEditModal_Previews : PreviewProvider {
    static var previews: some View {
        ToDoEditModal(toDo: .constant(ToDoEvent()))
            .environmentObject(UserData())
            
    }
}
#endif
