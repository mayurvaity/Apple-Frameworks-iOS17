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
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                print("Tapped \(framework.id)")
                                viewModel.selectedFramework = framework
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                //when above parameter isPresented is set to true the sheet shows the Modal view, when set to false sheet dismisses Modal view - needs an binding variable, $ makes it binding 
                //to call method which will show detail view with values of selected framework
                FrameworkDetailView(
                    framework: viewModel.selectedFramework ?? MockData.sampleFramework,
                    isShowingDetailView: $viewModel.isShowingDetailView)
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


