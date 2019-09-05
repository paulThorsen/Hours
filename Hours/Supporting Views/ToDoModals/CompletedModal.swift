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
    @State var showingReuseAlert = false
    @Binding var completedToDo: ToDoEvent
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("cellWhite"))
                        .frame(height: 60)
                    Text(completedToDo.eventTitle)
                        .font(.system(size: 20))
                        .foregroundColor(Color("mainTextGray"))
                }
                HorizontalDivider(borderColor: Color("borderGray"))
                ZStack {
                    Color("cellWhite")
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        if self.completedToDo.notes != "" {
                            HStack {
                                Text(self.completedToDo.notes)
                                    .foregroundColor(Color("mainTextGray"))
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                Spacer()
                            }
                            Spacer()
                        }
                        else {
                            Text("No Notes")
                                .foregroundColor(Color("borderGray"))
                                .font(.title)
                        }
                    }
                }
                .background(Color("cellWhite"))
                .frame(height: 200)
                HorizontalDivider(borderColor: Color("borderGray"))
                Spacer().frame(height: 50)
                
                VStack(spacing: 0) {
                    HorizontalDivider(borderColor: Color("borderGray"))
                    Button(action: { self.showingCompletedAlert = true}) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("cellWhite"))
                            Text("Mark as Incomplete")
                                .foregroundColor(Color("textGray"))
                        }
                    }
                    .frame(height: 70)
                    .actionSheet(isPresented: $showingCompletedAlert) {
                        ActionSheet(title: Text("Mark \"" + self.completedToDo.eventTitle + "\" as incomplete?"), message: Text("You can always complete it later on."), buttons: [
                            .default(Text("Confirm")) {
                                self.presentationMode.wrappedValue.dismiss()
                                self.userData.markAsIncomplete(id: self.completedToDo.id)
                            },
                            .destructive(Text("Cancel"))])
                    }
                    HorizontalDivider(borderColor: Color("borderGray"))
                    Button(action: { self.showingReuseAlert = true}) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("cellWhite"))
                            Text("Reuse To-Do")
                                .foregroundColor(Color("textGray"))
                        }
                        
                    }
                    .frame(height: 70)
                    .actionSheet(isPresented: $showingReuseAlert) {
                        ActionSheet(title: Text("Reuse \"" + self.completedToDo.eventTitle + "\"?"), message: Text("This will create a new To-Do event."), buttons: [
                            .default(Text("Confirm")) {
                                self.presentationMode.wrappedValue.dismiss()
                                self.userData.reuseCompletedToDo(id: self.completedToDo.id)
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
                    .frame(height: 70)
                    .actionSheet(isPresented: $showingDeleteAlert) {
                        ActionSheet(title: Text("Delete \"" + self.completedToDo.eventTitle + "\"?"), message: Text("This can't be undone"), buttons: [
                            .destructive(Text("Delete")) {
                                self.userData.removeCompletedToDo(id: self.completedToDo.id)
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
struct CompletedModal_Previews : PreviewProvider {
    static var previews: some View {
        CompletedModal(completedToDo: .constant(ToDoEvent()))
            .environmentObject(UserData())
    }
}
#endif
