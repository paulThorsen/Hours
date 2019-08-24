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
    @Binding var updateParent: Bool
    @Binding var addingIsDisabled: Bool
    
    @State var hapticDeleteFeedback = false
    let triggerLength: CGFloat = -200.0
    
    @State var isPresented = false
    
    @State private var location = CGPoint.zero
    
    var toDoIndex: Int {
        userData.toDoEvents.firstIndex(where: { $0.id == toDo.id })!
    }
    
    var body: some View {
        return ZStack {
            Rectangle()
                .frame(height: CELL_HEIGHT)
                .foregroundColor(Color("red"))
            ZStack {
                Rectangle()
                    .frame(height: CELL_HEIGHT)
                    .foregroundColor(Color(self.userData.toDoEvents[self.toDoIndex].color))
                
//                HStack {
//                    Button(action: { self.userData.toDoEvents[self.toDoIndex].isCompleted.toggle(); self.updateParent.toggle()
//                    }) {
//                    Image("notDone")
////                        .foregroundColor(Color("textGray"))
//                        .padding()
//                        .blendMode(.multiply)
//                    }
//                    TextField("Title", text: self.$toDo.eventTitle, onEditingChanged: { if $0 { self.addingIsDisabled = true }})
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.leading)
//                        .truncationMode(.tail)
//                        .textContentType(.none)
//                    Spacer().frame(width: CGFloat(10))
//                    Image("more")
//                        .foregroundColor(Color("textGray"))
//                        .padding()
//                        .blendMode(.multiply)
//                        .sheet(isPresented: $isPresented) {
//                            ToDoEditModal(toDo: self.toDo)
//                    }
//
//                }
            }
//            .gesture(
//                DragGesture(minimumDistance: 20, coordinateSpace: .global)
//                    .onChanged { value in
////                        print("value.translation")
////                        print(value.translation)
//                        self.location = CGPoint(
//                            x: value.translation.width,
//                            y: 0)
//                        if self.location.x <= self.triggerLength && !self.hapticDeleteFeedback {
//                            self.hapticDeleteFeedback.toggle()
//                            let generator = UIImpactFeedbackGenerator(style: .heavy)
//                            generator.impactOccurred()
//                        } else if self.location.x > self.triggerLength && self.hapticDeleteFeedback{
//                            self.hapticDeleteFeedback.toggle()
//                            let generator = UIImpactFeedbackGenerator(style: .heavy)
//                            generator.impactOccurred()
//                        }
//                }.onEnded({ drag in
//                    if self.location.x >= self.triggerLength {
//                        self.hapticDeleteFeedback = false
//                        self.location = CGPoint(
//                            x: 0,
//                            y: 0)
//                    } else {
//                        self.location = CGPoint(
//                            x: -1000,
//                            y: 0)
//                        self.hapticDeleteFeedback = false
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Change `2.0` to the desired number of seconds.
//                            self.userData.removeToDo(id: self.toDo.uuid)
//                        }
//
//                    }
//                }))
//                .animation(.spring(stiffness: 1000.0, damping: 1000.0))
//                .offset(x: self.location.x, y: self.location.y)
        }
    }
}


#if DEBUG
struct ToDoEventView_Previews : PreviewProvider {
    @State static var didChange = false
    @State static var addingIsDisabled = true
    static var previews: some View {
        return ToDoEventView(toDo: ToDoEvent(), updateParent: $didChange, addingIsDisabled: $addingIsDisabled)
            .environmentObject(UserData())
        
    }
}
#endif
