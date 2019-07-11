//
//  HorizontalDivider.swift
//  Hours
//
//  Created by Paul Thorsen on 6/29/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct HorizontalDivider : View {
    @State var borderColor = Color("borderGray")
    
    var body: some View {
        Rectangle()
            .frame(height: BORDER_WIDTH)
            .foregroundColor(borderColor)
    }
}

#if DEBUG
struct HorizontalDivider_Previews : PreviewProvider {
    static var previews: some View {
        HorizontalDivider()
    }
}
#endif
