//
//  PlannableTimeRow.swift
//  Hours
//
//  Created by Paul Thorsen on 7/2/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct PlannableTimeRow : View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: CELL_HEIGHT)
                .foregroundColor(.white)
        }
    }
}

#if DEBUG
struct PlannableTimeRow_Previews : PreviewProvider {
    static var previews: some View {
        PlannableTimeRow()
    }
}
#endif
