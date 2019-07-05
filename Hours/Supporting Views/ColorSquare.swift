//
//  ColorSquares.swift
//  Hours
//
//  Created by Paul Thorsen on 6/20/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct ColorSquare: View {
    var color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: 44, height: 44, alignment: .center)
            .foregroundColor(color)
            .cornerRadius(4)
    }
}

#if DEBUG
struct ColorSquare_Previews : PreviewProvider {
    static var previews: some View {
        ColorSquare(color: Color("red"))
    }
}
#endif
