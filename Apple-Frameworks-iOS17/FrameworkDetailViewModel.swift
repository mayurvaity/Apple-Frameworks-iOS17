//
//  FrameworkDetailViewModel.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 17/06/24.
//

import SwiftUI

final class FrameworkDetailViewModel: ObservableObject {
    
    let framework: Framework
    
    @Published var isShowingSafariView = false
    
    init(framework: Framework) {
        self.framework = framework
    }
    
}
