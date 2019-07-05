//
//  To-DoView.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct ToDoView : View {
    @EnvironmentObject private var userData: UserData
    
    
    var body: some View {
        ScrollView {
            Text("To-Do")
                .font(.headline)
                .padding()
            VStack(spacing: 0) {
                HorizontalDivider(borderColor: Color("textGray"))
                ForEach(self.userData.toDoEvents.identified(by: \.isCompleted)) { toDo in
                    if !toDo.isCompleted {
                        ToDoEventView(toDo: toDo)
                        HorizontalDivider(borderColor: Color("textGray"))
                    }
                }
            }
            Text("Completed")
                .font(.headline)
                .padding()
            VStack(spacing: 0) {
                HorizontalDivider(borderColor: Color("textGray"))
                ForEach(self.userData.toDoEvents.identified(by: \.isCompleted)) { toDo in
                    if toDo.isCompleted {
                        CompletedToDoView(toDo: toDo)
                        HorizontalDivider(borderColor: Color("textGray"))
                    }
                }
            }
            Button(action: {self.userData.toDoEvents.append(ToDoEvent())}) {Text("Add")}
        }
    }
}

#if DEBUG
struct ToDoView_Previews : PreviewProvider {
    static var previews: some View {
        return ToDoView()
            .environmentObject(UserData())
    }
}
#endif
