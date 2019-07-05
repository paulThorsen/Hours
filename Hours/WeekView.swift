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
            HStack(spacing: 0) {
                ForEach(self.numDays) { day in
//                    if self.todaysDate == 4 {
//                        isToday = true
//                    }
                    Button(action: {self.isSelected.toggle()}) {
                        if !self.isSelected {
                            DayPlaceHolder(dayOfMonth: day, dayOfWeek: WEEK[day % 7], isToday: self.isToday)
                        }
                        else {
                            DayPlaceHolder(dayOfMonth: day, dayOfWeek: WEEK[day % 7], isToday: self.isToday)
                        }
                    }
                    VerticalDivider(borderColor: Color("lightTextGray"))
                    
                }
            }.frame(height: 62, alignment: .top)
        }
    }
    
    
//    static func intToString(_ value: Int) -> String {
//        return "\(value)"
//    }
//
//    /**
//     convert String to Date
//
//     - Parameter value: input String value
//     - Parameter format: date format
//
//     - Returns: converted Date
//     */
//    static func stringToDate(_ value: String, format: String) -> Date? {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = format
//
//        return dateFormatter.date(from: value)
//    }
//
//    /**
//     convert Date to String
//
//     - Parameter date: input Date value
//
//     - Returns: converted String
//     */
//    static func dateToString(_ date: Date, format: String) -> String {
//        let dateFormatter = DateFormatter()
//
//        dateFormatter.locale = Locale.current
//        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
//        dateFormatter.dateFormat = format
//
//        return dateFormatter.string(from: date)
//    }
//
//    /**
//     calculate date by adding parameters
//
//     - Parameter date: target Date
//     - Parameter year: add years to target date
//     - Parameter month: add months to target date
//     - Parameter day: add days to target date
//
//     - Returns: added Date
//     */
//    static func addDate(_ date: Date, year: Int?, month: Int?, day: Int?) -> Date? {
//        var dateComponent = DateComponents()
//
//        dateComponent.year = year ?? 0
//        dateComponent.month = month ?? 0
//        dateComponent.day = day ?? 0
//
//        return Calendar.current.date(byAdding: dateComponent, to: date)
//    }
//}
//
//extension Date {
//    func startOfMonth() -> Date {
//        var dateComponent = Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self))
//        dateComponent.hour = 12
//        dateComponent.minute = 0
//        dateComponent.second = 0
//
//        return Calendar.current.date(from: dateComponent)!
//    }
//
//    func endOfMonth() -> Date {
//        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
//    }
}

#if DEBUG
struct WeekView_Previews : PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}
#endif
