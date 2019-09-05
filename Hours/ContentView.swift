//
//  ContentView.swift
//  Hours
//
//  Created by Paul Thorsen on 6/19/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI


struct ContentView : View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @EnvironmentObject var userData: UserData
    
    @State var showingSettings = false
    
    // MARK: CoreData properties

//    @FetchRequest(
//        entity: Event.entity(),
//        sortDescriptors: [
//            NSSortDescriptor(keyPath: \Event.dateCreated, ascending: true),
////            NSSortDescriptor(keyPath: \Events.creator, ascending: false)
//        ]
//    ) var toDoEvents: FetchedResults<Event>
    
    @FetchRequest(fetchRequest: toDosFetchRequest) var items: FetchedResults<ToDoEvent2>
        
    var settingsButton: some View {
        Button(action: { self.showingSettings.toggle() }) {
            Image("Settings")
                .imageScale(.large)
                .accessibility(label: Text("Settings"))
                .padding()
                .foregroundColor(Color("red"))
        }
    }
    
    var body: some View {
        NavigationView {
            TabView {
                ZStack {
                    Color("bg")
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        WeekView()
                        HorizontalDivider(borderColor: Color("borderGray"))
                        TimeInHour()
                        HorizontalDivider(borderColor: Color("borderGray"))
                        AllHoursView()
                    }
                }
                .tabItem {
                    Image("Calendar")
                    Text("Calendar")
                }
                .tag(0)
            
                ToDoView()
                    .environmentObject(self.userData)
                    .tabItem {
                        Image("To-Do")
                        Text("To-Do")
                    }
                    .tag(1)
        }
        .accentColor(Color("red"))
        .navigationBarTitle(Text("Hours"), displayMode: .inline)
        .navigationBarItems(leading: Button(action: {}) {
            Image("Today")
            .imageScale(.large)
            .accessibility(label: Text("Today"))
            .padding()
            .foregroundColor(Color("red"))
            }, trailing:
            self.settingsButton)
                .sheet(isPresented: $showingSettings) { Settings().environmentObject(self.userData) }
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
