//
//  TimeInHour.swift
//  Hours
//
//  Created by Paul Thorsen on 7/13/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct TimeInHour : View {
    let bounds = UIScreen.main.bounds
//    var width = bounds.size.width
//    var height = bounds.size.height
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("lightGray"))
            }
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("lightGray"))
                        .frame(width: 55)
                }
                //            VerticalDivider(borderColor: Color("lightTextGray"))
                ZStack {
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: 3)
                            Text(":00")
                                .font(.footnote)
                                .foregroundColor(Color("textGray"))
                                Spacer().frame(height: 5)
                                //                    VerticalDivider(borderColor: Color("textGray"))
                            }
                            .offset(x: -10)
                            VStack(spacing: 0) {
                                Spacer()
                                    .frame(height: 3)
                                    Text(":15")
                                        .font(.footnote)
                                        .foregroundColor(Color("textGray"))
                                        Spacer().frame(height: 5)
                                        //                    VerticalDivider(borderColor: Color("textGray"))
                                    }
                                    .offset(x: (bounds.size.width / 5) - 10)
                                    VStack(spacing: 0) {
                                        Spacer()
                                            .frame(height: 3)
                                            Text(":30")
                                                .font(.footnote)
                                                .foregroundColor(Color("textGray"))
                                                Spacer().frame(height: 5)
                                                //                    VerticalDivider(borderColor: Color("textGray"))
                                            }
                                            .offset(x: (bounds.size.width / 5) * 2)
                                            VStack(spacing: 0) {
                                                Spacer()
                                                    .frame(height: 3)
                                                    Text(":45")
                                                        .font(.footnote)
                                                        .foregroundColor(Color("textGray"))
                                                        Spacer().frame(height: 5)
                                                        //                    VerticalDivider(borderColor: Color("textGray"))
                                                    }
                                                    .offset(x: ((bounds.size.width / 5) * 3) + 10)
                                            }
                                            Spacer()
                                        }
            
                                }.frame(height: 30)
    }
}

#if DEBUG
struct TimeInHour_Previews : PreviewProvider {
    static var previews: some View {
        TimeInHour()
    }
}
#endif
