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

    var isCompleted: Bool = false {
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

    var color: String = "orange" {
        didSet {
            toDoChanged.send(self)
        }
    }

    var notes: String = "" {
        didSet {
            toDoChanged.send(self)
        }
    }
    
    enum Colors: String, CaseIterable {
        case red = "red"
        case green = "green"
        case orange = "orange"
        case gray = "borderGray"
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
