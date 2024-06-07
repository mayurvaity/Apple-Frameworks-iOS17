//
//  FrameworkGridView.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 06/06/24.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    //.flexible - to make sure it adopts to any grid dimensions
    //no if GridItem specified in the array determine no of columns (in this case 3)
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    //as Framework struct conforms to Identifiable, it (below ForEach) will use id created in it using Identifiable protocol without having to specify it
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework)
                            .onTapGesture {
                                print("Tapped \(framework.id)")
                            }
                    }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
        
    }
}

//changes made in this will reflect only in preview window on right, e.g. .preferredColorScheme(.dark)
//if u want these changes to reflect in the app, add it in Apple_Frameworks_iOS17App file
#Preview {
    FrameworkGridView()
        .preferredColorScheme(.dark)
}

struct FrameworkTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        //padding - to add padding around vstack
        VStack {
            Image(framework.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 90, height: 90)
            //scaledToFit - to adjust the font size if needed
            //minimumScaleFactor - minimum font scaling
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}