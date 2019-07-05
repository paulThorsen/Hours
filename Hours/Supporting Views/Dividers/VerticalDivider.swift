//
//  VerticalDivider.swift
//  Hours
//
//  Created by Paul Thorsen on 6/29/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct VerticalDivider : View {
    
    @State var borderColor = Color("textGray")
    
    var body: some View {
        Rectangle()
            .frame(width: 1)
            .foregroundColor(borderColor)
    }
}

#if DEBUG
struct VerticalDivider_Previews : PreviewProvider {
    static var previews: some View {
        VerticalDivider(borderColor: .red)
    }
}
#endif
