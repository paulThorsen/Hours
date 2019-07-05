//
//  DayPlaceHolder.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct DayPlaceHolder : View {
    @State var dayOfMonth: intmax_t
    @State var dayOfWeek: String
    @State var isToday: Bool
    
    var date = Date()
    @State var isSelected = false
    
    var body: some View {
        HStack {
            if isSelected {
                SelectedDay(dayOfMonth: dayOfMonth, dayOfWeek: dayOfWeek, isToday: self.isToday)
            }
            else {
                DaySelect(dayOfMonth: dayOfMonth, dayOfWeek: dayOfWeek, isToday: self.isToday)
            }
        }
    }
}

#if DEBUG
struct DayPlaceHolder_Previews : PreviewProvider {
    static var previews: some View {
        DayPlaceHolder(dayOfMonth: 31, dayOfWeek: "TUES", isToday: true)
    }
}
#endif
