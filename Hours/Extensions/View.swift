//
//  View.swift
//  Hours
//
//  Created by Paul Thorsen on 9/4/19.
//  Copyright © 2019 Paul Thorsen. All rights reserved.
//

import SwiftUI
import CoreData

extension View {
    static var toDosFetchRequest: NSFetchRequest<ToDoEvent2> {
        let request: NSFetchRequest<ToDoEvent2> = ToDoEvent2.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \ToDoEvent2.dateCreated, ascending: true)]
          
        return request
    }
}
