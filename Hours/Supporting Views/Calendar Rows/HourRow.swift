//
//  HourRow.swift
//  Hours
//
//  Created by Paul Thorsen on 6/28/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct HourRow : View {
    @State var hour: Int
    @State var isMorning: Bool
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                HourOfDay(hour: hour, isMorning: isMorning)
                VerticalDivider(borderColor: Color("lightTextGray"))
                PlannableTimeRow()
            }
        }
    }
}

#if DEBUG
struct HourRow_Previews : PreviewProvider {
    static var previews: some View {
        HourRow(hour: 4, isMorning: true)
    }
}
#endif
