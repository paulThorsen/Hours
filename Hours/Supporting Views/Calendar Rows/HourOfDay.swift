//
//  HourOfDay.swift
//  Hours
//
//  Created by Paul Thorsen on 6/27/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct HourOfDay : View {
    @State var hour: Int
    @State var isMorning: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: CELL_HEIGHT)
                .foregroundColor(Color("lightGray"))
            
            HStack {
                Text(String(hour))
                    .font(.system(size: 23))
                    .bold()
                    .foregroundColor(Color("textGray"))
                    .offset(x: 3, y: 0)
                
                Text(isMorning ? "AM" : "PM")
                    .font(.system(size: 8))
                    .bold()
                    .foregroundColor(Color("textGray"))
                    .offset(x: -5, y: -5)
            }
        }
        .frame(width: 55, height: CELL_HEIGHT)
    }
}

#if DEBUG
struct HourOfDay_Previews : PreviewProvider {
    static var previews: some View {
        HourOfDay(hour: 4, isMorning: true)
    }
}
#endif
