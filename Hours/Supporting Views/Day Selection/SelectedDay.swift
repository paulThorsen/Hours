//
//  SelectedDay.swift
//  Hours
//
//  Created by Paul Thorsen on 6/29/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct SelectedDay : View {
    @State var dayOfMonth: intmax_t
    @State var dayOfWeek: String
    @State var isToday: Bool
    
    var date = Date()
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 62, height: 62)
                .foregroundColor(Color("red"))
                .overlay(Rectangle().stroke(Color("selectedBorder"), lineWidth: 4))
            
            VStack {
                Text(String(dayOfMonth))
                    .font(.system(size: 20))
                    .bold()
                    .color(.white)
                    .frame(alignment: .center)
                
                Text(dayOfWeek)
                    .font(.system(size: 8))
                    .bold()
                    .color(.white)
                    .offset(x: 0, y: -3)
                    .frame(alignment: .center)
            }
            if isToday {
                Rectangle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.white)
                    .offset(y: 20)
            }
        }
    }
}

#if DEBUG
struct SelectedDay_Previews : PreviewProvider {
    static var previews: some View {
        SelectedDay(dayOfMonth: 4, dayOfWeek: "MON", isToday: true)
    }
}
#endif
