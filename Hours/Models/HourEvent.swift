//
//  HourEvent.swift
//  Hours
//
//  Created by Paul Thorsen on 6/20/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI
import Combine

class HourEvent: BindableObject {
    let uuid = UUID().uuidString
    let didChange = PassthroughSubject<HourEvent, Never>()
    
    var eventStartTime: Date = Date() {
        didSet {
            didChange.send(self)
        }
    }
    
    var eventDurationInMins: Int = 0 {
        didSet {
            didChange.send(self)
        }
    }
    
    var eventEndTime: Date = Date() {
        didSet {
            didChange.send(self)
        }
    }
    
    var eventTitle: String = "Hour Event" {
        didSet {
            didChange.send(self)
        }
    }
    
    var eventDate: Date = Date() {
        didSet {
            didChange.send(self)
        }
    }
    
//    var eventStartTime: Date
//    var eventDurationInMins: intmax_t
//    var eventEndTime: Date
//    var eventTitle: String
//    var eventDate: Date
}
