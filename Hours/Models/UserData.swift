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
import CoreData

final class UserData: ObservableObject, Identifiable {
//    var context: NSManagedObjectContext
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    let defaults = UserDefaults.standard
    
    @Published var completedToDos: [ToDoEvent] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    @Published var toDoEvents: [ToDoEvent] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    func markAsComplete(id: UUID) {
        for toDo in self.toDoEvents {
            if toDo.id == id {
                toDo.isCompleted.toggle()
                self.completedToDos.append(self.toDoEvents.remove(at: self.toDoEvents.firstIndex{ $0.id == id }!))
                break
            }
        }
    }
    
    func markAsIncomplete(id: UUID) {
        for completedtoDo in self.completedToDos {
            if completedtoDo.id == id {
                completedtoDo.isCompleted.toggle()
                self.toDoEvents.append(self.completedToDos.remove(at: self.completedToDos.firstIndex{ $0.id == id }!))
                break
            }
        }
    }
    
    func removeToDo(id: UUID) {
        for toDo in self.toDoEvents {
            if toDo.id == id {
                self.toDoEvents.remove(at: self.toDoEvents.firstIndex{ $0.id == id }!)
                break
            }
        }
//        for index in context {
//            let language = languages[index]
//            managedObjectContext.delete(language)
//        }
    }
    
    func removeCompletedToDo(id: UUID) {
            for completedToDo in self.completedToDos {
                if completedToDo.id == id {
                    self.completedToDos.remove(at: self.completedToDos.firstIndex{ $0.id == id }!)
                    break
                }
            }
        }
    
    func addToDo(toDo: ToDoEvent) {
        self.toDoEvents.append(toDo)
//        let newToDo = Event(context: self.context)
//        newToDo.eventTitle = toDo.eventTitle
//        newToDo.color = toDo.color
//        newToDo.dateCompleted = toDo.dateCompleted
//        newToDo.dateCreated = toDo.dateCompleted
//        newToDo.eventDate = toDo.eventDate
//        newToDo.eventDurationInMins = toDo.eventDurationInMins
//        newToDo.eventEndTime = toDo.eventEndTime
//        newToDo.eventStartTime = toDo.eventStartTime
//        newToDo.id = toDo.id
//        newToDo.isCompleted = toDo.isCompleted
//        newToDo.minutesSpent = toDo.minutesSpent
//        newToDo.notes = toDo.notes
//        do {
//            try self.context.save()
//        } catch {
//            print("core data error")
//        }
    }
    
    func reuseCompletedToDo(id: UUID) {
        for completedToDo in self.completedToDos {
            if completedToDo.id == id {
                let newToDo = ToDoEvent()
                newToDo.color = completedToDo.color
                newToDo.notes = completedToDo.notes
                newToDo.eventTitle = completedToDo.eventTitle
                self.toDoEvents.append(newToDo)
                break
            }
        }
    }
    
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
    
    @Published var daySelection: Date = Date() {
        willSet {
            objectWillChange.send()
        }
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
//        self.context = context
    }
}
