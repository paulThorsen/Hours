//
//  ToDoEventView.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var completedAnimation: AnyTransition {
        AnyTransition.slide
    }
}

struct ToDoEventView : View {
    @EnvironmentObject private var userData: UserData
    @ObservedObject var toDo: ToDoEvent
    @Binding var addingIsDisabled: Bool
    
    @State var hapticDeleteFeedback = false
    let triggerLength: CGFloat = -200.0

    @State var isPresented = false

    @State private var location = CGPoint.zero
    
    var toDoIndex: Int {
        userData.toDoEvents.firstIndex{ $0.id == toDo.id }!
    }
    
    var body: some View {
        return ZStack {
            //just for testing
//            Rectangle()
//                .frame(height: CELL_HEIGHT)
//                .foregroundColor(Color("red"))
            ZStack {
                Rectangle()
                    .frame(height: CELL_HEIGHT)
                    .foregroundColor(Color(self.toDo.color))

                HStack {
                    Button(action: {
                        let generator = UIImpactFeedbackGenerator(style: .medium)
                        generator.impactOccurred()
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { // Change `2.0` to the desired number of
                            self.userData.markAsComplete(id: self.toDo.id);
//                        }
                        })
                    {
                        Image("notDone")
                            .foregroundColor(Color("textGray"))
                            .padding()
                            .padding(.top, 9)
                            .padding(.bottom, 9)
                            .blendMode(.multiply)
                    }
                    .frame(height: CELL_HEIGHT)
                    
                    TextField("Title", text: self.$toDo.eventTitle, onEditingChanged: { if $0 { self.addingIsDisabled = true } else { self.addingIsDisabled = false }})
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .truncationMode(.tail)
                        .textContentType(.none)
                        .keyboardType(.alphabet)
                        .frame(height: CELL_HEIGHT)
                        .onAppear(perform: { self.toDo.eventTitle = "asdf" })
                    
                    Button(action: {self.isPresented = true}) {
                        Image("more")
                            .foregroundColor(Color("textGray"))
                            .padding(.leading)
                            .padding(.trailing)
                            .padding(.bottom, 39)
                            .padding(.top, 39)
                            .blendMode(.multiply)
                    }
                    .frame(height: CELL_HEIGHT)
                    .sheet(isPresented: $isPresented) {
                        ToDoEditModal(toDo: self.$userData.toDoEvents[self.toDoIndex]).environmentObject(self.userData)
                    }
                }
            }
            .gesture(
                DragGesture(minimumDistance: 20, coordinateSpace: .global)
                    .onChanged { value in
//                        print("value.translation")
//                        print(value.translation)
                        self.location = CGPoint(
                            x: value.translation.width,
                            y: 0)
                        if self.location.x <= self.triggerLength && !self.hapticDeleteFeedback {
                            self.hapticDeleteFeedback.toggle()
                            let generator = UIImpactFeedbackGenerator(style: .heavy)
                            generator.impactOccurred()
                        } else if self.location.x > self.triggerLength && self.hapticDeleteFeedback{
                            self.hapticDeleteFeedback.toggle()
                            let generator = UIImpactFeedbackGenerator(style: .heavy)
                            generator.impactOccurred()
                        }
                }.onEnded({ drag in
                    if self.location.x >= self.triggerLength {
                        self.hapticDeleteFeedback = false
                        self.location = CGPoint(
                            x: 0,
                            y: 0)
                    } else {
                        self.location = CGPoint(
                            x: -1000,
                            y: 0)
                        self.hapticDeleteFeedback = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { // Change `2.0` to the desired number of seconds.
                            self.userData.removeToDo(id: self.toDo.id)
                        }

                    }
                }))
                .animation(.spring())
                .offset(x: self.location.x, y: self.location.y)
        }
    }
}


#if DEBUG
struct ToDoEventView_Previews : PreviewProvider {
    static var previews: some View {
        return ToDoEventView(toDo: ToDoEvent(), addingIsDisabled: .constant(true))
            .environmentObject(UserData())
        
    }
}
#endif
