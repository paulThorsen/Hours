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
    @State var toDo: ToDoEvent
    
    var toDoIndex: Int {
        userData.toDoEvents.firstIndex(where: { $0.id == toDo.id })!
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: CELL_HEIGHT)
                .foregroundColor(self.toDo.color)
            
            HStack {
                Button(action: {
                    self.userData.toDoEvents[self.toDoIndex].isCompleted.toggle()
                }) {
                    Image("notDone")
                        .foregroundColor(Color("textGray"))
                        .padding()
                        .blendMode(.multiply)
                    
                }
                Text(self.userData.toDoEvents[self.toDoIndex].eventTitle)
                    .color(.white)
                    .bold()
                
                Spacer()
                Image("more")
                    .foregroundColor(Color("textGray"))
                    .padding()
                    .blendMode(.multiply)
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
