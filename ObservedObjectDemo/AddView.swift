//
//  AddView.swift
//  ObservedObjectDemo
//
//  Created by Andrew on 2/12/23.
//

import SwiftUI

struct AddView: View {
    
    @State var name: String = ""
    @Binding var isShowingAddView: Bool
    @ObservedObject var coreDataManager: CoreDataManager
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $name)
            }
            .navigationTitle("Add view")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddView.toggle()
                        coreDataManager.saveData(id: UUID(), name: self.name)
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}
