//
//  MvvmProjectApp.swift
//  MvvmProject
//
//  Created by Brigosha_Guest on 28/06/23.
//

import SwiftUI

@main
struct MvvmProjectApp: App {
    
    @StateObject var viewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                ListView()
            })
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(viewModel)
            //MangificinetGeustre()
            //DragGesturevIEW()
        }
    }
}
