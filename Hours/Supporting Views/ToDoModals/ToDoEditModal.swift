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
//    @Environment(\.isPresented) var isPresented: Binding<Bool>?
    @State var showingAlert = false
    @State var toDo: ToDoEvent
    
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
                        Text(verbatim: "Color")
                            .frame(alignment: .topLeading)
                            .padding()
                        Spacer()
                    }
                    ColorSelection(toDo: $toDo)
                        .padding(.bottom)
                }
//                VStack(spacing: 0) {
//                    HorizontalDivider(borderColor: Color("borderGray"))
//                    Button (action: {self.toDo.isCompleted = true}) {
//                        ZStack {
//                            Rectangle()
//                                .foregroundColor(Color("cellWhite"))
//                            Text(verbatim: "Mark as Complete")
//                                .foregroundColor(Color("textGray"))
//                        }
//                    }
//                    HorizontalDivider(borderColor: Color("borderGray"))
//                    Button (action: {self.showingAlert = true}) {
//                        ZStack {
//                            Rectangle()
//                                .foregroundColor(Color("cellWhite"))
//                                .accentColor(.black)
//                            Text("Delete")
//                                .foregroundColor(Color("red"))
//                                .padding()
//                        }
//                    }
//                    .alert(item: self.$showingAlert) {
//                        Alert(title: Text("Delete \"" + self.toDo.eventTitle + "\"?"), message: Text("This can't be undone"), primaryButton: .destructive(Text("Delete"), onTrigger: {
//                            self.userData.removeToDo(id: self.toDo.uuid);
//                            self.isPresented?.value = false
//                            }), secondaryButton: .cancel())
//
//                    }
//                    HorizontalDivider(borderColor: Color("borderGray"))
//
//                 }
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
