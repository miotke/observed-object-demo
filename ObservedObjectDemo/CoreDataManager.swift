//
//  CoreDataManager.swift
//  ObservedObjectDemo
//
//  Created by Andrew on 2/12/23.
//

import SwiftUI
import CoreData
import Foundation

class CoreDataManager: ObservableObject {
    static let instance = CoreDataManager() // Create singleton
    let container: NSPersistentContainer
    
    @Published var savedEntities: [Person] = []
    
    init() {
        container = NSPersistentContainer(name: "Model") // Model should have a better name
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING PERSISTENT STORE: \(error)")
            }
        }
        
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<Person>(entityName: "Person")
        do {
            savedEntities = try container.viewContext.fetch(request)
            print("🚒 Documents Directory: \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!)")
        } catch {
            // TODO: If this fails display an alert
            print("Error fetching data: \(error)")
        }
    }
    
    func saveData(id: UUID, name: String) {
        let newPerson = Person(context: container.viewContext)
        newPerson.id = id
        newPerson.name = name
        
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            // TODO: If this fails display an alert
            print("Error saving data: \(error)")
        }
    }
}
