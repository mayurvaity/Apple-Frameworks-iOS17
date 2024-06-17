//
//  FrameworkDetailView.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 07/06/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    //@ObservedObject - we use it when we are initialising this obj from other view (injecting obj)
    //@StateObject - we use it when we are creating a new obj below
    @ObservedObject var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            
            FrameworkTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
//            //custom button
//            Button {
//                //setting this variable to true to flag below sheet modifier to perform its action, in this case, to show SafariView
//                isShowingSafariView = true
//            } label: {
//                AFButton(title: "Learn More")
//            }
            
            //apple style button (new)
            Button {
                //setting this variable to true to flag below sheet modifier to perform its action, in this case, to show SafariView
                viewModel.isShowingSafariView = true
            } label: {
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.bordered)
            //            .controlSize(.large)
            //            .buttonBorderShape(.capsule)
            .tint(.red)
        }
        .fullScreenCover(isPresented: $viewModel.isShowingSafariView, content: {
            //using fullScreenCover instead of a sheet, it is same but shows fullscreen instead of Modal view
            //this fullScreenCover observes changes in the variable isShowingSafariView and performs below action
            //to call SafariView using url for selected framework
            SafariView(url: URL(string: viewModel.framework.urlString) ?? URL(string: "www.apple.com")! )
        })
    }
}

#Preview {
    FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework))
}
