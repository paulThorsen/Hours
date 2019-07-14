//
//  PlannableTimeRow.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct PlannableTimeRow : View {
    @State var isSelected = false
    
    var body: some View {
        Button(action: {self.isSelected.toggle()}) {
            if !self.isSelected {
                HStack {
                    Rectangle()
                        .frame(height: CELL_HEIGHT)
                        .foregroundColor(Color("cellWhite"))
                }
            } else {
                HStack {
                    Rectangle()
                        .frame(height: CELL_HEIGHT)
                        .foregroundColor(Color("lightRed"))
                        .border(Color("red"), width: 2)
                }
            }
        }.accentColor(.black)
    }
}

#if DEBUG
struct PlannableTimeRow_Previews : PreviewProvider {
    static var previews: some View {
        PlannableTimeRow(isSelected: true)
    }
}
#endif
