//
//  UserData.swift
//  Hours
//
//  Created by Paul Thorsen on 6/20/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    func updateZeroToDoEvents() {
        for toDo in toDoEvents {
            zeroToDoEvents = true
            if !toDo.isCompleted {
                zeroToDoEvents = false
            }
        }
    }
    
    var toDoEvents: [ToDoEvent] = [] {
        didSet {
            didChange.send(self)
            updateZeroToDoEvents()            
        }
    }
    
    var zeroToDoEvents: Bool = true {
        didSet {
            didChange.send(self)
        }
    }
    
//    var completedToDos: [ToDoEvent] = [] {
//        didSet {
//            didChange.send(self)
//        }
//    }
    
    var deadToggle: Bool = false {
        didSet {
            didChange.send(self)
            updateZeroToDoEvents()
        }
    }
    
    var notificationsOn: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var iCloudCalenderOn: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
    var minutesBeforeNotification: Time = .fifteen {
        didSet {
            didChange.send(self)
        }
    }
    
    var daySelection: Date = Date() {
        didSet {
            didChange.send(self)
        }
    }
    
    func removeToDo(id: String) {
        for i in 1...self.toDoEvents.count {
            if self.toDoEvents[i].uuid == id {
                toDoEvents.remove(at: i)
                break
            }
        }
    }
    
    func addToDo(toDo: ToDoEvent) {
        self.toDoEvents.append(toDo)
    }
    
    enum Time: String, CaseIterable {
        case fifteen = "15"
        case thirty = "30"
        case fortyfive = "45"
        case sixty = "60"
    }
}
