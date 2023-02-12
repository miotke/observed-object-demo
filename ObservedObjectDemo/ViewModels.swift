//
//  ViewModels.swift
//  ObservedObjectDemo
//
//  Created by Andrew on 2/12/23.
//

import Foundation

class NavigationViewModel: ObservableObject {
    @Published var isShowingAddView: Bool = false
}

class DataViewModel: ObservableObject {
    @Published var id: UUID = UUID()
    @Published var name: String = ""
}
