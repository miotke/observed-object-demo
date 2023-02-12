//
//  ContentView.swift
//  ObservedObjectDemo
//
//  Created by Andrew on 2/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var navigationVM = NavigationViewModel()
    @ObservedObject var coreDataManager: CoreDataManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(coreDataManager.savedEntities, id:\.self) { person in
                    Text("Hello, \(person.name!)")
                }
            }
            .navigationTitle("Demo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        navigationVM.isShowingAddView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $navigationVM.isShowingAddView) {
                        AddView(isShowingAddView: $navigationVM.isShowingAddView, coreDataManager: coreDataManager)
                    }
                }
            }
        }
    }
}
