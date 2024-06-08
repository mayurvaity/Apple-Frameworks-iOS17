//
//  Apple_Frameworks_iOS17App.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 06/06/24.
//

import SwiftUI

@main
struct Apple_Frameworks_iOS17App: App {
    var body: some Scene {
        WindowGroup {
            //preferredColorScheme - to specify dark/light mode 
            FrameworkGridView()
                .preferredColorScheme(.dark)
        }
    }
}
