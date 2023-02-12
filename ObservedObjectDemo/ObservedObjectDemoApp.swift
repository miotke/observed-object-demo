//
//  ObservedObjectDemoApp.swift
//  ObservedObjectDemo
//
//  Created by Andrew on 2/12/23.
//

import SwiftUI

@main
struct ObservedObjectDemoApp: App {
    
    @StateObject var coreDataManager = CoreDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView(coreDataManager: coreDataManager)
        }
    }
}
