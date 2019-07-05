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
    
    var toDoEvents: [ToDoEvent] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
//    var completedToDos: [ToDoEvent] = [] {
//        didSet {
//            didChange.send(self)
//        }
//    }
    
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
    
    enum Time: String, CaseIterable {
        case fifteen = "15"
        case thirty = "30"
        case fortyfive = "45"
        case sixty = "60"
    }
    
    init() {
        toDoEvents.append(ToDoEvent())
        toDoEvents.append(ToDoEvent())
    }
}
