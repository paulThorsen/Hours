//
//  CalendarEvent.swift
//  Hours
//
//  Created by Paul Thorsen on 6/21/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import Foundation
import SwiftUI

class CalendarEvent: HourEvent {
    var isCompleted: Bool
    var minutesSpent: intmax_t
    var color: Color
    var notes: String
    
    
    override init() {
        isCompleted = false
        minutesSpent = 0
        color = Color("red")
        notes = ""
    }
    
}
