//
//  AddView.swift
//  ObservedObjectDemo
//
//  Created by Andrew on 2/12/23.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var dataVM = DataViewModel()
    @ObservedObject var coreDataManager: CoreDataManager
    @Binding var isShowingAddView: Bool
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $dataVM.name)
            }
            .navigationTitle("Add view")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddView.toggle()
                        coreDataManager.saveData(id: UUID(), name: dataVM.name)
                    } label: {
                        Text("Save")
                    }
                }
            }
        }
    }
}
