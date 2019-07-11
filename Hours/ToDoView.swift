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
//    @State var completedCount: Int
    
    var body: some View {
        ScrollView {
            HStack {
                Text("To-Do")
                    .color(Color("mainTextGray"))
                    .font(.headline)
                    .padding(.leading)
                
                Spacer()
                Button(action: {self.userData.addToDo(toDo: ToDoEvent())}) {
                    Image("add")
                        .foregroundColor(Color("red"))
                        .padding(.trailing)
                }
            }
            VStack(spacing: 0) {
                HorizontalDivider(borderColor: Color("borderGray"))
                ForEach(self.userData.toDoEvents.identified(by: \.uuid)) { toDo in
                    if !toDo.isCompleted {
                        ToDoEventView(toDo: toDo)
                        HorizontalDivider(borderColor: Color("borderGray"))
                    }
                }
                if self.userData.zeroToDoEvents {
                    Button(action: {self.userData.addToDo(toDo: ToDoEvent())}) {
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
    static var previews: some View {
        return ToDoView()
            .environmentObject(UserData())
    }
}
#endif
