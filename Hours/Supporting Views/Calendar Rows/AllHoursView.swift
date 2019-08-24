//
//  AllHoursView.swift
//  Hours
//
//  Created by Paul Thorsen on 6/28/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct AllHoursView : View {
    let numHours = Array<Int>(1...11)

    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: CGFloat(0)) {
                HorizontalDivider(borderColor: Color("lightTextGray"))
                HourRow(hour: 12, isMorning: true)
                HorizontalDivider(borderColor: Color("lightTextGray"))
//                ForEach(numHours.sorted(), id: \.self) { hour in
//                        HourRow(hour: hour, isMorning: true)
//                        HorizontalDivider(borderColor: Color("lightTextGray"))
//                }
                HourRow(hour: 12, isMorning: false)
                HorizontalDivider(borderColor: Color("lightTextGray"))
//                ForEach(numHours.sorted(), id: \.self) { hour in
//                        HourRow(hour: hour, isMorning: false)
//                        HorizontalDivider(borderColor: Color("lightTextGray"))
//                }
            }
        }
    }
}

#if DEBUG
struct AllHoursView_Previews : PreviewProvider {
    static var previews: some View {
        AllHoursView()
    }
}
#endif
