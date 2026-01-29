//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Ravisinh on 23/05/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Item.self], inMemory: true) /// ModelContainer is responsible for creating and managing the actual database file used for all SwiftData’s storage needs.
    }
}
