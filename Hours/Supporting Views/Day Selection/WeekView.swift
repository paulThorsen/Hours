//
//  WeekView.Swift
//  Hours
//
//  Created by Paul Thorsen on 6/29/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct WeekView : View {
    let numDays = Array<Int>(1...31)
    @State var isSelected = false
    @State var todaysDate: Int = 4
    @State var isToday = false
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Spacer()
//            HStack(spacing: 0) {
//                ForEach(numDays, id: \.self) { day in
////                    if self.todaysDate == 4 {
////                        isToday = true
////                    }
//                    Button(action: {self.isSelected.toggle()}) {
//                        if !self.isSelected {
//                            DayPlaceHolder(dayOfMonth: day, dayOfWeek: WEEK[day % 7], isToday: self.isToday)
//                        }
//                        else {
//                            SelectedDay(dayOfMonth: day, dayOfWeek: WEEK[day % 7], isToday: self.isToday)
//                        }
//                    }
//                    VerticalDivider(borderColor: Color("lightTextGray"))
//
//                }
//            }.frame(height: 62, alignment: .top)
        }
    }
}

#if DEBUG
struct WeekView_Previews : PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
#endif
