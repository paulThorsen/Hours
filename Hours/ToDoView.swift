//
//  To-DoView.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct ToDoView : View {
    @EnvironmentObject var userData: UserData
    @State var didChange = false
    @State var addingToDo = false
    
    var body: some View {
        ScrollView {
            HStack {
                Text("To-Do")
                    .foregroundColor(Color("mainTextGray"))
                    .font(.headline)
                    .padding(.leading)
                
                Spacer()
                Button(action: {self.userData.toDoEvents.append(ToDoEvent())}) {
                    Image("add")
                        .accentColor(Color("red"))
                        .padding(.trailing)
                }
                .disabled(addingToDo)
            }
            VStack(spacing: 0) {
                HorizontalDivider(borderColor: Color("borderGray"))
                if userData.toDoEvents.count != 0 {
                    ForEach(userData.toDoEvents) { toDo in
                        if !toDo.isCompleted {
                            ToDoEventView(toDo: toDo, updateParent: self.$didChange, addingIsDisabled: self.$addingToDo)
                            HorizontalDivider(borderColor: Color("borderGray"))
                        }
                    }
                }
                if self.userData.toDoEvents.count == 0 {
                    Button(action: {self.userData.toDoEvents.append(ToDoEvent())}) {
                        VStack {
                            Text("Tap to add a new To-Do")
                                .foregroundColor(Color("textGray"))
                            Image("add")
                                .foregroundColor(Color("textGray"))
                        }

                    }
                    .frame(height: CELL_HEIGHT)
                }
            }
            .padding(.bottom)
            HStack {
                Text("Completed")
                    .foregroundColor(Color("mainTextGray"))
                    .font(.headline)
                    .padding(.leading)

                Spacer()
            }
            VStack(spacing: 0) {
                HorizontalDivider(borderColor: Color("borderGray"))
                ForEach(userData.toDoEvents) { toDo in
                    if toDo.isCompleted {
                        CompletedToDoView(toDo: toDo, updateParent: self.$didChange, addingIsDisabled: self.$addingToDo)
                        HorizontalDivider(borderColor: Color("borderGray"))
                    }
                }
            }
        }
        .padding(.top)
    }
}

#if DEBUG
struct ToDoView_Previews : PreviewProvider {
//     static var userData = UserData()
    static var previews: some View {
        return ToDoView()
            .environmentObject(UserData())
    }
}
#endif
