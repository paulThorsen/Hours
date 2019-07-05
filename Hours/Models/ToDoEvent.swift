//
//  ToDoEvent.swift
//  Hours
//
//  Created by Paul Thorsen on 6/20/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ToDoEvent: HourEvent {
    let toDoChanged = PassthroughSubject<ToDoEvent, Never>()

    var isCompleted: Bool = true {
        didSet {
            toDoChanged.send(self)
        }
    }

    var minutesSpent: Int = 0 {
        didSet {
            toDoChanged.send(self)
        }
    }

    var dateCompleted: Date = Date() {
        didSet {
            toDoChanged.send(self)
        }
    }

    var color: Color = Color("orange") {
        didSet {
            toDoChanged.send(self)
        }
    }

    var notes: String = "" {
        didSet {
            toDoChanged.send(self)
        }
    }

    var image: String = "notDone" {
        didSet {
            toDoChanged.send(self)
        }
    }

    func updateColor(newColor: Color) {
        self.color = newColor
    }
    
//    var super.eventTitle: String = "" {
//        didSet {
//            toDoChanged.send(self)
//        }
//    }
    
//    var isCompleted: Bool
//    var minutesSpent: Int
//    var dateCompleted: Date
//    var color: Color
//    var notes: String
//    var image: String

    override init() {
//        isCompleted = false
//        minutesSpent = 0
//        dateCompleted = Date()
//        color = Color("orange")
//        notes = "String"
//        image = "notDone"
        super.init()
        eventTitle = "New To-Do"
    }
    
}
