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
    
    var isCompleted: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    
    var dateCreated: Date = Date() {
        willSet {
            objectWillChange.send()
        }
    }

    var minutesSpent: Int32 = 0 {
        willSet {
            objectWillChange.send()
        }
    }

    var dateCompleted: Date = Date() {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var color: String = "orange" {
        willSet {
            objectWillChange.send()
        }
    }

    @Published var notes: String = "" {
        willSet {
            objectWillChange.send()
        }
    }
    
    enum Colors: String, CaseIterable {
        case red = "red"
        case green = "green"
        case orange = "orange"
        case gray = "borderGray"
    }


    override init() {
        super.init()
        eventTitle = "New To-Do"
    }
    
}
