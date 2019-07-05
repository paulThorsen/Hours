//
//  ColorChoiceView.swift
//  Hours
//
//  Created by Paul Thorsen on 6/21/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI

struct ColorChoiceView : View {
    var toDoEvent: ToDoEvent
    var colorOptions = [Color.red, Color.orange, Color.pink, Color.blue]
    
    var body: some View {
        VStack {
            Text("Hola")
//            ForEach(colorOptions) { color in
                ColorSquare(color: self.colorOptions[0])
//            }
        Text("hello")
        }
    }
}

#if DEBUG
struct ColorChoiceView_Previews : PreviewProvider {
    static var previews: some View {
        ColorChoiceView(toDoEvent: ToDoEvent())
    }
}
#endif
