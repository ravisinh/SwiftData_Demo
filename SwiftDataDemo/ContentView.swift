//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Ravisinh on 23/05/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   
    /// ModelContext has the job of tracking all objects that have been created, modified, and deleted in memory, so they can all be saved to the model container at some later point.
    @Environment(\.modelContext) private var modelContext
    
    /// Query property wrapper fetches data from swift data and assing it to a variable
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                #endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            /// inserts data into container
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                /// Removes data from container
                modelContext.delete(items[index])
            }
        }
    }
}

/// Displays view preview on right hand side of Xcode canvas
///  Incase if you are unable to see canvas use option + command + return keys
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
