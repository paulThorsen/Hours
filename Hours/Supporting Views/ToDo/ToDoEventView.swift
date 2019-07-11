//
//  ToDoEventView.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct ToDoEventView : View {
    @EnvironmentObject private var userData: UserData
    @ObjectBinding var toDo: ToDoEvent
    
    var toDoIndex: Int {
        userData.toDoEvents.firstIndex(where: { $0.id == toDo.id })!
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: CELL_HEIGHT)
                .foregroundColor(Color(self.toDo.color))
            
            HStack {
                Button(action: {
                    self.userData.toDoEvents[self.toDoIndex].isCompleted.toggle(); self.userData.deadToggle.toggle()
                }) {
                    Image("notDone")
                        .foregroundColor(Color("textGray"))
                        .padding()
                        .blendMode(.multiply)
                    
                }
                TextField("Title", text: $userData.toDoEvents[self.toDoIndex].eventTitle)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .truncationMode(.tail)
                
                Spacer().frame(width: 10)
                
                PresentationLink(destination: ToDoEditModal(toDo: toDo)) {
                    Image("more")
                        .foregroundColor(Color("textGray"))
                        .padding()
                        .blendMode(.multiply)
                }
            }
        }
    }
}

#if DEBUG
struct ToDoEventView_Previews : PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return ToDoEventView(toDo: userData.toDoEvents[0])
            .environmentObject(userData)
        
    }
}
#endif
