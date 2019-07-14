//
//  ContentView.swift
//  Hours
//
//  Created by Paul Thorsen on 6/19/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI


struct ContentView : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            TabbedView {
                VStack(spacing: 0) {
                    WeekView()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("textGray"))
                    AllHoursView()
                }
                .tabItemLabel(VStack {
                    Image("Calendar").accentColor(Color("red"))
                    Text("Calendar").accentColor(Color("red"))
                })
                .tag(0)
            
                
                
            HStack {
                ToDoView()
                    .environmentObject(userData)
            }
            .tabItemLabel(VStack {
                Image("To-Do")
                Text("To-Do")
            })
            .tag(1)
        }
        .navigationBarTitle(Text("Hours"), displayMode: .inline)
                .navigationBarItems(leading: Button(action: {}) {
                    Image("Today")
                    .imageScale(.large)
                    .accessibility(label: Text("Today"))
                    .padding()
                    .foregroundColor(Color("red"))
                    }, trailing:
                    PresentationLink(destination: Settings().environmentObject(userData)) {
                Image("Settings")
                    .imageScale(.large)
                    .accessibility(label: Text("Settings"))
                    .padding()
                    .foregroundColor(Color("red"))
            })
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        return ContentView()
            .environmentObject(UserData())
    }
}
#endif
