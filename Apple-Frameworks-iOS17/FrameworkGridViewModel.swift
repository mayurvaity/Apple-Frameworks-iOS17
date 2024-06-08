//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks-iOS17
//
//  Created by Mayur Vaity on 07/06/24.
//

import SwiftUI

//if u r not gonna subclass ur class, make it final
//conform to ObservableObject to broadcast its changes
final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        //every time selectedFramework changes below didSet code gets executed
        didSet {
            isShowingDetailView = true
        }
    }
    //varaible to maintain if to show detail view or not 
    //@Published - makes it obeservable throught the app, wherever it is used, for change of its value 
    @Published var isShowingDetailView = false
    
    //.flexible - to make sure it adopts to any grid dimensions
    //no if GridItem specified in the array determine no of columns (in this case 3)
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
