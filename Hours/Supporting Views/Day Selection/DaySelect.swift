//
//  DaySelect.swift
//  Hours
//
//  Created by Paul Thorsen on 6/29/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct DaySelect : View {
    @State var dayOfMonth: intmax_t
    @State var dayOfWeek: String
    @State var isToday: Bool
    
    var date = Date()

    
    var body: some View {
        ZStack {
                Rectangle()
                    .frame(width: 62, height: 62)
                    .foregroundColor(Color("cellWhite"))
                
                VStack {
                    Text(String(dayOfMonth))
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(Color("lightTextGray"))
                        .frame(alignment: .center)
                    
                    Text(dayOfWeek)
                        .font(.system(size: 8))
                        .bold()
                        .foregroundColor(Color("textGray"))
                        .offset(x: 0, y: -3)
                        .frame(alignment: .center)
                }
                if isToday {
                    Rectangle()
                        .frame(width: 5, height: 5)
                        .foregroundColor(Color("red"))
                        .offset(y: 20)
                }
        }
    }
}

#if DEBUG
struct DaySelect_Previews : PreviewProvider {
    static var previews: some View {
        DaySelect(dayOfMonth: 31, dayOfWeek: "TUES", isToday: true)
    }
}
#endif
