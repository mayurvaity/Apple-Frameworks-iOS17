//
//  FrameworkGridView.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 06/06/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    //StateObject - to retain value of object even when view object gets destroyed 
    @StateObject var viewModel = FrameworkGridViewModel()
    
    var body: some View {
        NavigationStack {
            //sheet - to show a Modal view (as specified) based on a boolean variable value
            //navigationTitle - to assign a title to scrollview
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    //as Framework struct conforms to Identifiable, it (below ForEach) will use id created in it using Identifiable protocol without having to specify it
                    ForEach(MockData.frameworks) { framework in
                        //to create a link around clickable title view and also pass value of framework, to be used in destination
                        NavigationLink(value: framework) {
                            FrameworkTitleView(framework: framework)
                        }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .navigationDestination(for: Framework.self) { framework in
                //gets above variable value from NavigationLink and stored in var framework, to be used below
                //then with this value, calling detail view below 
                FrameworkDetailView(framework: framework)
            }
        }
        
    }
}

//changes made in this will reflect only in preview window on right, e.g. .preferredColorScheme(.dark)
//if u want these changes to reflect in the app, add it in Apple_Frameworks_iOS17App file
#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}


