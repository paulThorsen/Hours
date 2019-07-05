//
//  CompletedToDo.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct CompletedToDoView : View {
    @EnvironmentObject private var userData: UserData
    @State var toDo: ToDoEvent
    
    var toDoIndex: Int {
        userData.toDoEvents.firstIndex(where: { $0.id == toDo.id })!
    }

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: CELL_HEIGHT)
                .foregroundColor(.white)
            
            HStack {
                Button(action: {
                    self.userData.toDoEvents[self.toDoIndex].isCompleted.toggle()
                }) {
                    Image("done")
                        .foregroundColor(Color("green"))
                        .padding()
                        .blendMode(.multiply)
                    
                }
                Text(self.userData.toDoEvents[self.toDoIndex].eventTitle)
                    .bold()
                    .color(Color("textGray"))
                
                Spacer()
            }
        }
    }
}

#if DEBUG
struct CompletedToDoView_Previews : PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return CompletedToDoView(toDo: userData.toDoEvents[0])
            .environmentObject(userData)
    }
}
#endif
