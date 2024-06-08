//
//  FrameworkDetailView.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 07/06/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    isShowingDetailView = false 
                } label: {
                    //frame - it determines touch target area
                    Image(systemName: "xmark")
                        .foregroundStyle(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button {
                //setting this variable to true to flag below sheet modifier to perform its action, in this case, to show SafariView
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            //using fullScreenCover instead of a sheet, it is same but shows fullscreen instead of Modal view 
            //this fullScreenCover observes changes in the variable isShowingSafariView and performs below action
            //to call SafariView using url for selected framework
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")! )
        })
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework, isShowingDetailView: .constant(false))
        .preferredColorScheme(.dark)
}
