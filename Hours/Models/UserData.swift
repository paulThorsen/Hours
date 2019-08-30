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

final class UserData: ObservableObject, Identifiable {
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    let defaults = UserDefaults.standard
    
//    func updateZeroToDoEvents() {
//        for toDo in toDoEvents {
//            zeroToDoEvents = true
//            if !toDo.isCompleted {
//                zeroToDoEvents = false
//            }
//        }
//    }
    
    var toDoEvents: [ToDoEvent] = [] {
        willSet {
//            updateZeroToDoEvents()
            objectWillChange.send()
        }
    }
    
//    var zeroToDoEvents: Bool = true {
//        willSet {
//            objectWillChange.send()
//        }
//    }
    
    var notificationsOn: Bool = false {
        willSet {
            objectWillChange.send()
            defaults.set(newValue, forKey: "notificationsOn")
        }
    }
    
    var iCloudCalenderOn: Bool = false {
        willSet {
            objectWillChange.send()
            defaults.set(newValue, forKey: "iCloudCalenderOn")
        }
    }
    
    var minutesBeforeNotification: Time {
        willSet {
            objectWillChange.send()
            defaults.set(newValue.rawValue, forKey: "minutesBeforeNotification")
        }
    }
    
    var daySelection: Date = Date() {
        willSet {
            objectWillChange.send()
        }
    }
    
    func removeToDo(id: UUID) {
        for i in 0...self.toDoEvents.count - 1 {
            if self.toDoEvents[i].id == id {
                toDoEvents.remove(at: i)
//                updateZeroToDoEvents() 
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
    
    init() {
        self.notificationsOn = defaults.bool(forKey: "notificationsOn")
        self.iCloudCalenderOn = defaults.bool(forKey: "iCloudCalenderOn")
        self.minutesBeforeNotification = UserData.Time(rawValue: defaults.string(forKey: "minutesBeforeNotification") ?? "15")!
    }
}
