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
    
    var body: some View {
        ScrollView {
            HStack {
                Text("To-Do")
                    .color(Color("mainTextGray"))
                    .font(.headline)
                    .padding(.leading)
                
                Spacer()
                Button(action: {self.userData.toDoEvents.append(ToDoEvent())}) {
                    Image("add")
                        .foregroundColor(Color("red"))
                        .padding(.trailing)
                }
            }
            VStack(spacing: 0) {
                HorizontalDivider(borderColor: Color("borderGray"))
                ForEach(self.userData.toDoEvents.identified(by: \.uuid)) { toDo in
////                    var toDoIndex: Int {
////                        toDoEvents.firstIndex(where: { $0.id == toDo.id })
////                    }
                    if !toDo.isCompleted {
                        ToDoEventView(toDo: toDo, updateParent: self.$didChange)
                        HorizontalDivider(borderColor: Color("borderGray"))
                    }
                }
                if self.userData.toDoEvents.count == 0 {
                    Button(action: {self.userData.toDoEvents.append(ToDoEvent())}) {
                        VStack {
                            Text("Tap to add a new To-Do")
                                .color(Color("textGray"))
                            Image("add")
                                .foregroundColor(Color("textGray"))
                        }

                    }.frame(height: CELL_HEIGHT)
                }
            }
            .padding(.bottom)


            HStack {
                Text("Completed")
                    .color(Color("mainTextGray"))
                    .font(.headline)
                    .padding(.leading)

                Spacer()
            }
            VStack(spacing: 0) {
                HorizontalDivider(borderColor: Color("borderGray"))
                ForEach(self.userData.toDoEvents.identified(by: \.uuid)) { toDo in
                    if toDo.isCompleted {
                        CompletedToDoView(toDo: toDo)
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
