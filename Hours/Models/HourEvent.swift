//
//  HourEvent.swift
//  Hours
//
//  Created by Paul Thorsen on 6/20/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI
import Combine

class HourEvent: ObservableObject {
    let uuid = UUID().uuidString
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    var eventStartTime: Date = Date() {
        willSet {
            objectWillChange.send()
        }
    }
    
    var eventDurationInMins: Int = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    var eventEndTime: Date = Date() {
        willSet {
            objectWillChange.send()
        }
    }
    
    var eventTitle: String = "Hour Event" {
        willSet {
            objectWillChange.send()
        }
    }
    
    var eventDate: Date = Date() {
        willSet {
            objectWillChange.send()
        }
    }
    
//    var eventStartTime: Date
//    var eventDurationInMins: intmax_t
//    var eventEndTime: Date
//    var eventTitle: String
//    var eventDate: Date
}
