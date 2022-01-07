//
//  ToDo_App_WidgetApp.swift
//  ToDo-App&Widget
//
//  Created by admin on 7/1/2565 BE.
//

import SwiftUI

@main
struct ToDo_App_WidgetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
